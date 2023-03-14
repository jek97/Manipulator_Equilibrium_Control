% Simscape(TM) Multibody(TM) version: 7.2

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(5).translation = [0.0 0.0 0.0];
smiData.RigidTransform(5).angle = 0.0;
smiData.RigidTransform(5).axis = [0.0 0.0 0.0];
smiData.RigidTransform(5).ID = '';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [0 0 0];  % mm
smiData.RigidTransform(1).angle = 0;  % rad
smiData.RigidTransform(1).axis = [0 0 0];
smiData.RigidTransform(1).ID = 'RootGround[base v1:1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [0 0 0];  % mm
smiData.RigidTransform(2).angle = 0;  % rad
smiData.RigidTransform(2).axis = [0 0 0];
smiData.RigidTransform(2).ID = 'SixDofRigidTransform[engine1 v1:1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [0 0 0];  % mm
smiData.RigidTransform(3).angle = 0;  % rad
smiData.RigidTransform(3).axis = [0 0 0];
smiData.RigidTransform(3).ID = 'SixDofRigidTransform[link1 v1:1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [0 1000 -1.7763568393999999e-14];  % mm
smiData.RigidTransform(4).angle = 0;  % rad
smiData.RigidTransform(4).axis = [0 0 0];
smiData.RigidTransform(4).ID = 'SixDofRigidTransform[engine2 v1:1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [0 1000 0];  % mm
smiData.RigidTransform(5).angle = 0;  % rad
smiData.RigidTransform(5).axis = [0 0 0];
smiData.RigidTransform(5).ID = 'SixDofRigidTransform[link2 v1:1]';


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(5).mass = 0.0;
smiData.Solid(5).CoM = [0.0 0.0 0.0];
smiData.Solid(5).MoI = [0.0 0.0 0.0];
smiData.Solid(5).PoI = [0.0 0.0 0.0];
smiData.Solid(5).color = [0.0 0.0 0.0];
smiData.Solid(5).opacity = 0.0;
smiData.Solid(5).ID = '';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 1543.1025100685933;  % lbm
smiData.Solid(1).CoM = [0 -229.35195732797197 0];  % mm
smiData.Solid(1).MoI = [33761199.425473668 139160774.56540346 128561386.5910683];  % lbm*mm^2
smiData.Solid(1).PoI = [9.2415859245247104e-09 0 -5.503170780086298e-05];  % lbm*mm^2
smiData.Solid(1).color = [1 1 1];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = 'base v1.ipt_{03A66BA0-4F6D-EEAC-ED7D-5FA2C20DBB4D}';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 195.72950133716697;  % lbm
smiData.Solid(2).CoM = [0 0 0];  % mm
smiData.Solid(2).MoI = [5614327.4814628055 5614327.3303875523 1169789.5222977838];  % lbm*mm^2
smiData.Solid(2).PoI = [0 -0.00049504740592837206 8.0588681532314645e-10];  % lbm*mm^2
smiData.Solid(2).color = [1 1 1];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = 'engine1 v1.ipt_{4543D5C8-4880-C548-676B-6EA5E7EB5B8D}';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 1741.0622898397542;  % lbm
smiData.Solid(3).CoM = [0 500 0];  % mm
smiData.Solid(3).MoI = [213899006.95700595 26546004.036020242 214329076.64542988];  % lbm*mm^2
smiData.Solid(3).PoI = [0 0 -1.128241541515796e-08];  % lbm*mm^2
smiData.Solid(3).color = [1 1 1];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = 'link1 v1.ipt_{ED1CA21E-4BF2-35BB-3D13-4E8BAB93B7E0}';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(4).mass = 195.72950133716697;  % lbm
smiData.Solid(4).CoM = [0 0 0];  % mm
smiData.Solid(4).MoI = [5614327.4814628074 5614327.3303875532 1169789.5222977859];  % lbm*mm^2
smiData.Solid(4).PoI = [-8.0588681537252335e-10 -0.00049504660004155655 -8.0588681537252335e-10];  % lbm*mm^2
smiData.Solid(4).color = [1 1 1];
smiData.Solid(4).opacity = 1;
smiData.Solid(4).ID = 'engine2 v1.ipt_{D010E70B-46FE-024C-315F-B5A1726E5F7E}';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(5).mass = 1923.8408368618771;  % lbm
smiData.Solid(5).CoM = [0 531.6456416091994 0];  % mm
smiData.Solid(5).MoI = [175009178.71391413 42101345.045752138 162596914.31203663];  % lbm*mm^2
smiData.Solid(5).PoI = [0 -6.4470945229801868e-09 -0.00012753138137377231];  % lbm*mm^2
smiData.Solid(5).color = [1 1 1];
smiData.Solid(5).opacity = 1;
smiData.Solid(5).ID = 'link2 v1.ipt_{9F15D74A-4D66-440B-52EE-8099DCC91158}';

