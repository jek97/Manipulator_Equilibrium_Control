doublependolum_DataFile
% preliminary definition:
% link's lenghts: assign for each link his lenght which is the distance
% between the origin of the local reference frame of the link and the
% position of the origin of the next one in the chain (in mm).
l_u = [0, 0, 1000, 0, 1000];
% converting the lenghts in meters:
l = l_u / 1000;
% number of link:
n = size(l,2);
% configuration vector and joint type: in this vector the first coloumn
% contain the configuration angle in radiants (for revolute joint), the configuration
% distance in millimiters (for prismatic joint) or 0 for rigid joint, while the second coloumn contain the
% joint type: 0 for revolute joint, 1 for prismatic joint, 2 for rigid, and
% the third coloumn is used in case of prismatic joint to specify the angle
% between the axe y0 and the translation axis:
% joint.
q = [0, 1, -pi/2;
    0, 2, 0;
    -pi/4, 0, 0;
    0, 2, 0];
% center of mass of each link expressed in the local reference frame of the link (in mm):
for i = 1 : size(l,2)
    C_u(i,:) = smiData.Solid(i).CoM;
end
% converting the center of mass coordinates in meters:
C = C_u / 1000;
% mass of each link:
for i = 1 : size(l,2)
    m_p(i) = smiData.Solid(i).mass;
end
% converting the masses from lb to kg:
m = m_p * 0.454;
% gravity flag: 1 to set the gravity on, 0 to set the gravity off
g_flag = 1; 
% external forces acting on the robot: in the vector the first three
% coloumns contain the force components along the axis of the absolute
% reference frame (in N), the fourth coloumn contain the number of the link on
% which the force act, the last three coloumns contain the position where
% the force act in the local reference frame of the link.
F_ext = [0.5 ,-0.6 ,0 , 5 ,0 ,1 ,0;
     1 ,-0.4 ,0 ,5 ,0 ,0.6816 ,0;
     0 ,0 ,0 ,0 ,0 ,0 ,0];
% external torque acting on the robot:in the vector the first three
% coloumns contain the torque components along the axis of the absolute
% reference frame (in N*m), the fourth coloumn contain the number of the link on
% which the torque act
M_ext = [0, 0, 0, 0;
    0, 0, 0, 0;
    0, 0, 0, 0];
% definition of the relative rotational matrises:
Rr(:,:,n) = [0, 0, 0;
    0, 0, 0;
    0, 0, 0;];
for i = 1 : n-1
     if  q(i,2) == 1
        Rr(:,:,i) = [cos(q(i,3)), sin(q(i,3)), 0;
           -sin(q(i,3)), cos(q(i,3)), 0;
           0, 0, 1];
     else 
        Rr(:,:,i) = [cos(q(i,1)), sin(q(i,1)), 0;
           -sin(q(i,1)), cos(q(i,1)), 0;
           0, 0, 1];
     end
end     
% definition of the absolute rotational matrises:
for j = 1 : n-1
    if j == 1
        Ra(:,:,1) = Rr(:,:,1);
    else
        Ra(:,:,j) = Ra(:,:,j-1) * Rr(:,:,j);
    end
end

% evaluation program:
% gravity on or off:
if g_flag == 1
    g = [0, -9.81, 0];
else
    g = [0, 0, 0];
end
% starting evaluation:
t_eq = [];
for k = n : -1 : 2
    F_1(:,n+1) = [0, 0, 0];
    M(:,n+1) = [0, 0, 0];
    Fc(k,:) = [0, 0, 0];
    Mc(k,:) = [0, 0, 0];
    for w = 1 : size(F_ext,1) %for each link
        if F_ext(w,4) == k
            F3 = [F_ext(w,1); F_ext(w,2); F_ext(w,3)];
            Fc(k,:) = Fc(k,:) + ((Ra(:,:,k-1)) * F3)'; % summ all the forces acting on it
            Pn = [F_ext(w,5), F_ext(w,6), F_ext(w,7)];
            Rcp = Pn - C(k,:);
            Mc(k,:) = Mc(k,:) + (cross(Rcp',((Ra(:,:,k-1)) * F3)))'; % evaluate the external moment produced by the external force and his position
        end
    end
    for w = 1 : size(M_ext,1)
        if M_ext(w,4) == k
            T3 = [M_ext(w,1); M_ext(w,2); M_ext(w,3)];
            Mc(k,:) = Mc(k,:) +((Ra(:,:,k-1)) * T3)'; % adding the external moment
        end
    end
    % considering the prismatic join case:
    if q(k-1,2) == 1
        rpc = [0, q(k-1,1), 0]  + C(k,:);
    else
        rpc = C(k,:);
    end
    if q(k-1,2) == 1
        rpq = [0, q(k-1,1)+l(1,k), 0];
    else
        rpq = [0, l(1,k), 0];
    end
    % evaluate the force and moments exchanged in the joint
    F_1(:, k) = m(k) * ((Ra(:,:,k-1)) * g') + Fc(k,:)' + (Rr(:,:,k)') * F_1(:,k+1);
    F(:, k) = - F_1(:, k);
    M(:, k) = -Mc(k,:)' - cross(rpc',(m(k) * ((Ra(:,:,k-1)) * g') + Fc(k,:)')) - cross(rpq',(Rr(:,:,k)') * F_1(:,k+1)) + (Rr(:,:,k)') * M(:,k+1);
    % summarise and group the actuator action
    if q(k-1,2) == 0
        t_eq = [M(3, k); t_eq];
    elseif q(k-1,2) == 1
        t_eq = [F(2, k); t_eq];
    end
end
