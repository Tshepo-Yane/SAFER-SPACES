tic
time_morning=60*5;
time_afternoon=60*6;
time_e_evening=60*4;
time_evening=60*9;


%Volumes
V1=2.5e5; %ft^3
V2=1.3e5; %ft^3
V3=1.5e5; %ft^3
V4=1.1e5; %ft^3
V5=1.2e5; %ft^3
V6=2.2e5; %ft^3
V7=3.8e5; %ft^3
V8=2.8e5; %ft^3
V9=1.6e5; %ft^3

Volumes = [V1 V2 V3 V4 V5 V6 V7 V8 V9];

start_viral_particles=1e6;

Volume_space=2.5e5; %ft^3

init_conc=start_viral_particles;

in_concs = start_viral_particles./Volumes;

int_conc_all=[0 0 0 0 0 0 0 0 0];
time_vect=[];

options=odeset('RelTol',1e-3,'AbsTol',[1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 1e-2]);

%time_of_day =[7,12,18,22];

end_conc_m=[];
end_conc_a=[];
end_conc_ee=[];
end_conc_e=[];

convert=3.534e-5*500*15;% to convert to Particle concentration to partclies 
Pm=[];
Pa=[];
Pee=[];
Pe=[];



for N=1:25

    [Tm,Ym]=ode45(@(t, y)buildingmodel_ty1_doors_morning(t,y,N),[0 time_morning],int_conc_all,options);
    int_conc_all_afteroon=Ym(end,:);% make array for next intial concentrations 
    end_conc_m(:,end+1)=Ym(end,:);% get final concnetrations of of particles 
    Pm(:,end+1)=trapz(Tm,Ym)*convert;% find the total number of particles inhaled at that point in time and store them  
    
    %Volume_inahled_m=sum(Ym(1:4:end))
   
    [Ta,Ya]=ode45(@(t, y)buildingmodel_ty1_doors_afternoon(t,y,N),[0 time_afternoon],int_conc_all_afteroon,options);
    int_conc_all_e_evening=Ya(end,:);
    end_conc_a(:,end+1)=Ya(end,:);
    
    Pa(:,end+1)=trapz(Ta,Ya)*convert;
    
    [Tee,Yee]=ode45(@(t, y)buildingmodel_ty1_doors_e_evening(t,y,N),[0 time_e_evening],int_conc_all_e_evening,options);
    int_conc_all_evening=Yee(end,:);
    end_conc_ee(:,end+1)=Yee(end,:);
    
    Pee(:,end+1)=trapz(Tee,Yee)*convert;
    
    [Te,Ye]=ode45(@(t, y)buildingmodel_ty1_doors_e_evening(t,y,N),[0 time_evening],int_conc_all_evening,options);
    
    Pe(:,end+1)=trapz(Te,Ye)*convert;
    
    end_conc_e(:,end+1)=Ye(end,:);
end

%% probability of infecting
Prop_m=1./(1+10.^(10-1.2.*log10(Pm)))*100;

Prop_a=1./(1+10.^(10-1.2.*log10(Pa)))*100;

Prop_e=1./(1+10.^(10-1.2.*log10(Pe)))*100;

Prop_ee=1./(1+10.^(10-1.2.*log10(Pee)))*100;
X=[1:1:25];


for i=1:length(Prop_m(:,1))
    
    figure(i)
    subplot(2,2,1);
    plot(X,Prop_m(i,:))
    xlabel("Percent of infected individuals")
    ylabel("Infection Risk %")
    title(["Morning Shift ","Room:", num2str(i)])
    grid minor
    
    subplot(2,2,2);
    plot(X,Prop_a(i,:))
    xlabel("Percent of infected individuals")
    ylabel("Infection Risk %")
    title(["Afternoon Shift ","Room:", num2str(i)])
    grid minor


    subplot(2,2,3);
    plot(X,Prop_ee(i,:))
    xlabel("Percent of infected individuals")
    ylabel("Infection Risk %")
    title(["Early afternoon Shift ","Room:", num2str(i)])
    grid minor



    subplot(2,2,4);
    plot(X,Prop_e(i,:))
    xlabel("Percent of infected individuals")
    ylabel("Infection Risk %")
    title(["Evening Shift ","Room:", num2str(i)])
    grid minor
    
    hold on
end