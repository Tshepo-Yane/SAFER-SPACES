%% Early evening conditions
function dy=buildingmodel_ty1_doors_e_evening(t,y,N)

dy=zeros(9,1);

V1=2.5e5; %ft^3
V2=1.3e5; %ft^3
V3=1.5e5; %ft^3
V4=1.1e5; %ft^3
V5=1.2e5; %ft^3
V6=2.2e5; %ft^3
V7=3.8e5; %ft^3
V8=2.8e5; %ft^3
V9=1.6e5; %ft^3

Pdoor=1.0e2; % permeability of door ft/min

floor_height=10; %ft
%density in each room
D1=1/100; %per ft^2
D2=1/25; %per ft^2
D3=1/100; %per ft^2
D4=1/25; %per ft^2
D5=1/100; %per ft^2
D6=1/25; %per ft^2
D7=1/25; %per ft^2
D8=1/100; %per ft^2
D9=1/25; %per ft^2

ACH_1=2; % air changes per hour for entry/hallway
ACH_2=4; % air changes per hour for office space
ACH_3=8; % air changes per hour for research space
ACH_4=4; % air changes per hour for office space
ACH_5=8; % air changes per hour for research space
ACH_6=4; % air changes per hour for office space
ACH_7=4; % air changes per hour for office space
ACH_8=8; % air changes per hour for research space
ACH_9=4; % air changes per hour for office space

% ACH_1=0; % air changes per hour for entry/hallway
% ACH_2=0; % air changes per hour for office space
% ACH_3=0; % air changes per hour for research space
% ACH_4=0; % air changes per hour for office space
% ACH_5=0; % air changes per hour for research space
% ACH_6=0; % air changes per hour for office space
% ACH_7=0; % air changes per hour for office space
% ACH_8=0; % air changes per hour for research space
% ACH_9=0; % air changes per hour for office space

C_air=0; % concentration of virus in the outdoor air

r_1=0.7; %fraction of recycled air in entry/hallway
r_2=0.6; %fraction of recycled air in office space
r_3=0.0; %fraction of recycled air in research space
r_4=0.6; %fraction of recycled air in office space
r_5=0.0; %fraction of recycled air in research space
r_6=0.6; %fraction of recycled air in office space
r_7=0.6; %fraction of recycled air in office space
r_8=0.0; %fraction of recycled air in research space
r_9=0.6; %fraction of recycled air in office space


% r_1=0; %fraction of recycled air in entry/hallway
% r_2=0; %fraction of recycled air in office space
% r_3=0; %fraction of recycled air in research space
% r_4=0; %fraction of recycled air in office space
% r_5=0; %fraction of recycled air in research space
% r_6=0; %fraction of recycled air in office space
% r_7=0; %fraction of recycled air in office space
% r_8=0; %fraction of recycled air in research space
% r_9=0; %fraction of recycled air in office space


Q_e_1=ACH_1*V1/60; %ft^3 per min
Q_e_2=ACH_2*V2/60; %ft^3 per min
Q_e_3=ACH_3*V3/60; %ft^3 per min
Q_e_4=ACH_4*V4/60; %ft^3 per min
Q_e_5=ACH_5*V5/60; %ft^3 per min
Q_e_6=ACH_6*V6/60; %ft^3 per min
Q_e_7=ACH_7*V7/60; %ft^3 per min
Q_e_8=ACH_8*V8/60; %ft^3 per min
Q_e_9=ACH_9*V9/60; %ft^3 per min

%flow of recycled air
Q_r_1=r_1*Q_e_1; %ft^3 per min 
Q_r_2=r_2*Q_e_2; %ft^3 per min
Q_r_3=r_3*Q_e_3; %ft^3 per min
Q_r_4=r_4*Q_e_4; %ft^3 per min
Q_r_5=r_5*Q_e_5; %ft^3 per min
Q_r_6=r_6*Q_e_6; %ft^3 per min
Q_r_7=r_7*Q_e_7; %ft^3 per min
Q_r_8=r_8*Q_e_8; %ft^3 per min
Q_r_9=r_9*Q_e_9; %ft^3 per min

%flow of filtred air
Q_f_1=(1-r_1)*Q_e_1;
Q_f_2=(1-r_2)*Q_e_2;
Q_f_3=(1-r_3)*Q_e_3;
Q_f_4=(1-r_4)*Q_e_4;
Q_f_5=(1-r_5)*Q_e_5;
Q_f_6=(1-r_6)*Q_e_6;
Q_f_7=(1-r_7)*Q_e_7;
Q_f_8=(1-r_8)*Q_e_8;
Q_f_9=(1-r_9)*Q_e_9;


filter7 =0.01; % the percentage of filtering of virus before it is recirculated; 1 = nothing is filtered, 0 = everything viral particle is removed
filter14=0.01;

Adoor=25; % ft^2 area of door

breath_Rate= 15;%breadth/min
V_breath= 500; %mL
cubic_ft_to_ml=3.5315e-5;

inhale=breath_Rate*V_breath*cubic_ft_to_ml;

part_per_breadth= 1e5; % partcles per bretah 

exhale= part_per_breadth*breath_Rate;

p_inf=(N/100);
p_non_inf=(1-(N/100));

dy(1)=Q_f_1*C_air/V1 - Q_e_1*y(1)/V1 + Q_r_1*filter7*y(1)/V1 - 1*Pdoor*(y(1)-y(2))*Adoor/V1 - 1*Pdoor*(y(1)-y(3))*Adoor/V1 - 1*Pdoor*(y(1)-y(4))*Adoor/V1 - 1*Pdoor*(y(1)-y(5))*Adoor/V1 - 1*Pdoor*(y(1)-y(6))*Adoor/V1 - 2*Pdoor*(y(1)-y(7))*Adoor/V1 - 1*Pdoor*(y(1)-y(8))*Adoor/V1 - 2*Pdoor*(y(1)-y(9))*Adoor/V1+(D1/(2*floor_height))*(p_inf*exhale - y(1)*p_non_inf*inhale-y(1)*p_inf*inhale);

dy(2)=Q_f_2*C_air/V2 - Q_e_2*y(2)/V2 + Q_r_2*filter7*y(2)/V2 + 1*Pdoor*(y(1)-y(2))*Adoor/V2+(D2 /floor_height)*(p_inf*exhale - y(2)*p_non_inf*inhale-y(2)*p_inf*inhale);

dy(3)=Q_f_3*C_air/V3 - Q_e_3*y(3)/V3 + Q_r_3*filter14*y(3)/V3 + 1*Pdoor*(y(1)-y(3))*Adoor/V3 - 1*Pdoor*(y(3)-y(4))*Adoor/V3 +(D3 /floor_height)*(p_inf*exhale - y(3)*p_non_inf*inhale-y(3)*p_inf*inhale);

dy(4)=Q_f_4*C_air/V4 - Q_e_4*y(4)/V4 + Q_r_4*filter7*y(4)/V4 + 1*Pdoor*(y(1)-y(4))*Adoor/V4+(D4 /floor_height)*(p_inf*exhale - y(4)*p_non_inf*inhale-y(4)*p_inf*inhale);

dy(5)=Q_f_5*C_air/V5 - Q_e_5*y(5)/V5 + Q_r_5*filter14*y(5)/V5 + 1*Pdoor*(y(1)-y(5))*Adoor/V5+(D5 /floor_height)*(p_inf*exhale - y(5)*p_non_inf*inhale-y(5)*p_inf*inhale);

dy(6)=Q_f_6*C_air/V6 - Q_e_6*y(6)/V6 + Q_r_6*filter7*y(6)/V6 + 1*Pdoor*(y(1)-y(6))*Adoor/V6+(D6 /floor_height)*(p_inf*exhale - y(6)*p_non_inf*inhale-y(6)*p_inf*inhale);

dy(7)=Q_f_7*C_air/V7 - Q_e_2*y(7)/V7 + Q_r_7*filter7*y(7)/V7 + 2*Pdoor*(y(1)-y(7))*Adoor/V7+(D7 /floor_height)*(p_inf*exhale - y(7)*p_non_inf*inhale-y(7)*p_inf*inhale);

dy(8)=Q_f_8*C_air/V8 - Q_e_8*y(8)/V8 + Q_r_8*filter14*y(8)/V8 + 1*Pdoor*(y(1)-y(8))*Adoor/V8+(D8 /floor_height)*(p_inf*exhale - y(8)*p_non_inf*inhale-y(8)*p_inf*inhale);

dy(9)=Q_f_9*C_air/V9 - Q_e_2*y(9)/V9 + Q_r_9*filter7*y(9)/V9 + 2*Pdoor*(y(1)-y(9))*Adoor/V9+(D9 /floor_height)*(p_inf*exhale - y(9)*p_non_inf*inhale-y(9)*p_inf*inhale);



end









