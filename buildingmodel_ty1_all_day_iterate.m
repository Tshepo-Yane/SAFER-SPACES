function dy=buildingmodel_ty1_all_day_iterate(t,y, i, j)

dy=zeros(9,1);
j=1;
i=1;
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

ACH = [3, 3, 12, 3, 12, 3, 3, 12, 3; 
    3, 4, 10, 4, 10, 4, 4, 10, 4;
    2, 4, 8, 4, 8, 4, 4, 8, 4; 
    2, 2, 8, 2, 8, 2, 2, 8, 2];
 
r = [0.6, 0.65, 0, 0.65, 0, 0.65, 0.65, 0, 0.65;
    0.6, 0.6, 0, 0.6, 0, 0.6, 0.6, 0, 0.6;
    0.7, 0.6, 0, 0.6, 0, 0.6, 0.6, 0, 0.6; 
    0.7, 0.7, 0, 0.7, 0, 0.7, 0.7, 0, 0.7];

filter = [0.05, 0.05, 0.01, 0.05, 0.01, 0.05, 0.05, 0.01, 0.05;
    0.05, 0.05, 0.01, 0.05, 0.01, 0.05, 0.05, 0.01, 0.05;
    0.05, 0.05, 0.01, 0.05, 0.01, 0.05, 0.05, 0.01, 0.05;
    0.05, 0.05, 0.01, 0.05, 0.01, 0.05, 0.05, 0.01, 0.05 ];


C_air=0; % concentration of virus in the outdoor air

Q_e_1=ACH(j,i)*V1/60; %ft^3 per min
Q_e_2=ACH(j,i)*V2/60; %ft^3 per min
Q_e_3=ACH(j,i)*V3/60; %ft^3 per min
Q_e_4=ACH(j,i)*V4/60; %ft^3 per min
Q_e_5=ACH(j,i)*V5/60; %ft^3 per min
Q_e_6=ACH(j,i)*V6/60; %ft^3 per min
Q_e_7=ACH(j,i)*V7/60; %ft^3 per min
Q_e_8=ACH(j,i)*V8/60; %ft^3 per min
Q_e_9=ACH(j,i)*V9/60; %ft^3 per min


%Q_e = [Q_e_1,Q_e_2,Q_e_3,Q_e_4,Q_e_5,Q_e_6,Q_e_7,Q_e_8,Q_e_9];

%flow of recycled air
Q_r_1=r(j,i)*Q_e_1; %ft^3 per min 
Q_r_2=r(j,i)*Q_e_2; %ft^3 per min
Q_r_3=r(j,i)*Q_e_3; %ft^3 per min
Q_r_4=r(:,i)*Q_e_4; %ft^3 per min
Q_r_5=r(j,i)*Q_e_5; %ft^3 per min
Q_r_6=r(j,i)*Q_e_6; %ft^3 per min
Q_r_7=r(j,i)*Q_e_7; %ft^3 per min
Q_r_8=r(j,i)*Q_e_8; %ft^3 per min
Q_r_9=r(j,i)*Q_e_9; %ft^3 per min


%Q_r= [Q_r_1,Q_r_2,Q_r_3,Q_r_4,Q_r_5,Q_r_6,Q_r_7,Q_r_8,Q_r_9];

%flow of filtred air
Q_f_1=(1-r(j,i))*Q_e_1;
Q_f_2=(1-r(j,i))*Q_e_2;
Q_f_3=(1-r(j,i))*Q_e_3;
Q_f_4=(1-r(j,i))*Q_e_4;
Q_f_5=(1-r(j,i))*Q_e_5;
Q_f_6=(1-r(j,i))*Q_e_6;
Q_f_7=(1-r(j,i))*Q_e_7;
Q_f_8=(1-r(j,i))*Q_e_8;
Q_f_9=(1-r(j,i))*Q_e_9;


%Q_f=[Q_f_1,Q_f_2,Q_f_3,Q_f_4,Q_f_5,Q_f_6,Q_f_7,Q_f_8,Q_f_9];

time_of_day =[7,12,18,22];

filter7 =0.05; % the percentage of filtering of virus before it is recirculated; 1 = nothing is filtered, 0 = everything viral particle is removed
filter14=0.01;

Adoor=25; % ft^2 area of door

dy(1)=Q_f_1*C_air/V1 - Q_e_1*y(1)/V1 + Q_r_1*filter(j,i)*y(1)/V1;
dy(2)=Q_f_2*C_air/V2 - Q_e_2*y(2)/V2 + Q_r_2*filter(j,i)*y(2)/V2;
dy(3)=Q_f_3*C_air/V3 - Q_e_3*y(3)/V3 + Q_r_3*filter(j,i)*y(3)/V3;
dy(4)=Q_f_4*C_air/V4 - Q_e_4*y(4)/V4 + Q_r_4*filter(j,i)*y(4)/V4;
dy(5)=Q_f_5*C_air/V5 - Q_e_5*y(5)/V5 + Q_r_5*filter(j,i)*y(5)/V5;
dy(6)=Q_f_6*C_air/V6 - Q_e_6*y(6)/V6 + Q_r_6*filter(j,i)*y(6)/V6;
dy(7)=Q_f_7*C_air/V7 - Q_e_7*y(7)/V7 + Q_r_7*filter(j,i)*y(7)/V7;
dy(8)=Q_f_8*C_air/V8 - Q_e_8*y(8)/V8 + Q_r_8*filter(j,i)*y(8)/V8;
dy(9)=Q_f_9*C_air/V9 - Q_e_9*y(9)/V9 + Q_r_9*filter(j,i)*y(9)/V9;
    
    


end