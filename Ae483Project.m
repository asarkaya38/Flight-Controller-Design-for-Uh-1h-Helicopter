clc;clear;

A_10_full = [-0.006289	0.032720	1.318244	-32.063538	0.001827	-0.977238	0.000000	0.000733	;
             -0.200312	-0.472949	17.042599	-2.225631	-0.024044	-0.219160	-0.020111	0.000000	;
             -0.002476	-0.003717	-0.371469	0.000000	0.000220	0.106867	0.000000	0.000000	;
             -0.000025	-0.000037	0.996286	0.000000	0.000002	0.001070	-0.000000	-0.000625	;
              0.001398	-0.024126	-0.961740	-0.001396	-0.046108	-1.444106	32.063532	-16.051579	;
              0.003284	-0.001052	-0.512389	0.000000	-0.008983	-1.333561	0.000000	0.139904	;
             -0.000038	0.000003	-0.005148	0.000000	-0.000080	0.986571	-0.000000	0.070553	;
             -0.007600	0.019971	-0.096905	0.000000	0.014176	-0.133995	0.000000	-0.374052	];

B_10_full = [32.104822	29.961036	0.359934	0.000000	;
             7.175070	-411.428890	0.080765	0.000000	;
            -3.510832	0.394072	-0.039366	0.000000	;
            -0.035106	0.003877	-0.000408	0.000049	;
             0.048561	-22.770380	32.655485	16.453389	;
            -0.171227	-5.523594	16.879349	3.811265	;
            -0.001969	-0.048151	0.170396	0.032637	;
            -0.367997	10.206986	2.309218   -7.888274    ];

A_80_full = [-0.107611	0.120068	11.216902	-32.054340	0.007203	-0.521417	0.000000	-0.035677	;
              0.051078	-1.106194	143.825622	2.354381	-0.061683	-4.058344	-0.115620	0.000000	;
              0.002932	-0.031163	-0.553138	0.000000	-0.000434	0.076548	0.000000	0.000000	;
              0.000029	-0.000312	0.994466	0.000000	-0.000006	0.000766	-0.000000	-0.003562	;
              0.007009	-0.062513	-0.372725	0.008492	-0.114504	-12.965356	32.054132	-132.047097	;
              0.007921	-0.027753	-0.237175	0.000000	-0.019860	-1.497913	0.000000	0.400864	;
              0.000073	-0.000280	-0.002554	0.000000	-0.000231	0.985041	0.000000	-0.068530	;
              0.008348	0.004102	-0.110577	0.000000	0.044537	-0.027639	0.000000	-1.240159	];

B_80_full = [17.121858	64.081477	0.195110	0.000000	;
             134.590113 -549.254299	1.473395	0.000000	; 
             -2.514444	-3.888097	-0.028335	0.000000	;
             -0.025125	-0.038952	-0.000367	0.000363	;
              7.724684	-33.036748	32.929904	20.908660	;
              3.419041	-14.796149	17.017144	5.324643	;
              0.034593	-0.149404	0.168467	0.060633	;
             -0.539290	1.977847	2.320963	-10.056058	];
A_10_full_velt = [-32.06358 0 0;
                  -0.00136 32.0635 0;
                  -2.225631 -0.0201 0];
B_10_full_velt = [32.104 0 0;
                  0.048861 32.66 16.493;
                  7.175 0.081 0]; 
Ad_10_full_velt = [-3 0 0;
                    0 -3 0;
                    0 0 -3]; 
K_10_track = B_10_full_velt^-1*(A_10_full_velt-Ad_10_full_velt);
psi_10   = 0;
theta_10 = 3.9707*pi/180;
phi_10   = 0.03594*pi/180;
L_bv_10 = [cos(theta_10)*cos(psi_10), cos(theta_10)*sin(psi_10), -sin(theta_10);
           (sin(phi_10)*sin(theta_10)*cos(psi_10)-cos(phi_10)*sin(psi_10)), (sin(phi_10)*sin(theta_10)*sin(psi_10)+cos(phi_10)*cos(psi_10)), sin(phi_10)*cos(theta_10);
           (cos(phi_10)*sin(theta_10)*cos(psi_10)+sin(phi_10)*sin(psi_10)), (cos(phi_10)*sin(theta_10)*sin(psi_10)-sin(phi_10)*cos(psi_10)), cos(phi_10)*cos(theta_10)];
L_vb_10 = L_bv_10';
A_d_ang = [-3 0 0;
           0 -3 0;
           0 0 -3];
% A_d_ang = [-100 0 0;
%            0 -100 0;
%            0 0 -100];       
    
 C_ang = [1 0 0;
          0 1 0;    
          0 0 1];

Eig_10 = eig(A_10_full);
Eig_80 = eig(A_80_full);
 A_10_ang = [-1.3336 -0.5124 0.1399;
              0.1069 -0.3715 0;
             -0.1340 -0.0969  -0.3741 ];
 A_80_ang = [-1.4979 -0.2372 0.4009; 
              0.0765 -0.5531 0;
             -0.0276 -0.1106 -1.2402 ];
 B_10_ang = [-0.1712 16.8793 3.8113 ;
             -3.5108 -0.0394 0;
             -0.3680 2.3092 -7.8883];
 B_80_ang = [3.4190 17.0171 5.3246;
            -2.5144 -0.0283 0 ;
            -0.5393 2.3210 -10.0561];

K_10 = B_10_ang^-1*(A_10_ang-A_d_ang)*C_ang^-1; 
K_80 = B_80_ang^-1*(A_80_ang-A_d_ang)*C_ang^-1;
% Am = A_10_ang + B_10_ang - B_10_ang*K_10;
% Bm = [0; 0; 0];
% Cm = [1 0 0];
% Dm = 0;
% [b,a] = ss2tf(Am,Bm,Cm,Dm);
 R_ang = [1 0 0;
          0 1 0;
          0 0 1];
 Q_ang = [20 0 0;
          0 20 0;
          0 0 20];
[K_lqr_10,S_10,E_10] = lqr(A_10_ang,B_10_ang,Q_ang,R_ang,0);
[K_lqr_80,S_80,E_80] = lqr(A_80_ang,B_80_ang,Q_ang,R_ang,0);

%% Representing Observer Matrices
syms s Ke_ang_80 ke1_ang_80 ke2_ang_80 ke3_ang_80
syms Ke_ang_10 ke1_ang_10 ke2_ang_10 ke3_ang_10
A_10_full_ob = bsxfun(@times, A_10_full, [1.02; 1.04; 1.06; 1.08; 1.10; 1.12; 1.14; 1.16]);
A_80_full_ob = bsxfun(@times, A_80_full, [1.02; 1.04; 1.06; 1.08; 1.10; 1.12; 1.14; 1.16]);
B_10_full_ob = bsxfun(@times, B_10_full, [1.02; 1.04; 1.06; 1.08; 1.10; 1.12; 1.14; 1.16]);
B_80_full_ob = bsxfun(@times, B_80_full, [1.02; 1.04; 1.06; 1.08; 1.10; 1.12; 1.14; 1.16]);
A_10_ang_ob = bsxfun(@times, A_10_ang, [1.02; 1.04; 1.06]);
A_80_ang_ob = bsxfun(@times, A_80_ang, [1.02; 1.04; 1.06]);
B_10_ang_ob = bsxfun(@times, B_10_ang, [1.02; 1.04; 1.06]);
B_80_ang_ob = bsxfun(@times, B_80_ang, [1.02; 1.04; 1.06]);
C_ang_ob_p = [0 1 1];

Ke_ang_80 = [ke1_ang_80; ke2_ang_80; ke3_ang_80];
M_ob_ang_80 = A_80_ang_ob - Ke_ang_80 * C_ang_ob_p;
charM_ob_ang_80 = charpoly(M_ob_ang_80,s);
poles_Ad_80_ang = eig(A_80_ang_ob - B_80_ang_ob*K_lqr_80);
poles_Ad_80_ang_ob = poles_Ad_80_ang - 1;
Md_ob_ang_80 = (s - poles_Ad_80_ang_ob(1)) * (s - poles_Ad_80_ang_ob(2)) * (s - poles_Ad_80_ang_ob(3));
[C1_ob_ang_80,T_ang_80] = coeffs(charM_ob_ang_80, s);
[C2_ob_ang_80,T_ang_80] = coeffs(Md_ob_ang_80,    s);
[ke1_ang_80, ke2_ang_80, ke3_ang_80] = solve(C1_ob_ang_80 == C2_ob_ang_80, [ke1_ang_80 ke2_ang_80 ke3_ang_80]);
ke1_ang_80 = vpa(simplify(ke1_ang_80),6);
ke2_ang_80 = vpa(simplify(ke2_ang_80),6);
ke3_ang_80 = vpa(simplify(ke3_ang_80),6);
Ke_ang_80 = double(sym([ke1_ang_80; ke2_ang_80; ke3_ang_80]));

Ke_ang_10 = [ke1_ang_10; ke2_ang_10; ke3_ang_10];
M_ob_ang_10 = A_10_ang_ob - Ke_ang_10 * C_ang_ob_p;
charM_ob_ang_10 = charpoly(M_ob_ang_10,s);
poles_Ad_10_ang = eig(A_10_ang_ob - B_10_ang_ob*K_lqr_10);
poles_Ad_10_ang_ob = poles_Ad_10_ang - 1;
Md_ob_ang_10 = (s - poles_Ad_10_ang_ob(1)) * (s - poles_Ad_10_ang_ob(2)) * (s - poles_Ad_10_ang_ob(3));
[C1_ob_ang_10,T_ang_10] = coeffs(charM_ob_ang_10, s);
[C2_ob_ang_10,T_ang_10] = coeffs(Md_ob_ang_10,    s);
[ke1_ang_10, ke2_ang_10, ke3_ang_10] = solve(C1_ob_ang_10 == C2_ob_ang_10, [ke1_ang_10 ke2_ang_10 ke3_ang_10]);
ke1_ang_10 = vpa(simplify(ke1_ang_10),6);
ke2_ang_10 = vpa(simplify(ke2_ang_10),6);
ke3_ang_10 = vpa(simplify(ke3_ang_10),6);
Ke_ang_10 = double(sym([ke1_ang_10; ke2_ang_10; ke3_ang_10]));

% %% Trackings
% syms ki_ang_10 ki_ang_10m ky_ang_10 k1y_ang_10 k2y_ang_10 k3y_ang_10 
% ki_ang_10 = [0; 0; ki_ang_10m];
% ky_ang_10 = [k1y_ang_10 0 0;
%               0   k2y_ang_10 0;
%               0     0       k3y_ang_10];
% C_ang_10_y = [0 0 1];
% % My_ang_10 = A_10_ang - B_10_ang * ky_ang_10;
% My_ang_10 = [A_10_ang - B_10_ang * ky_ang_10 B_10_ang*ki_ang_10; -C_ang_10_y 0];
% charMy_ang_10 = charpoly(My_ang_10,s);
% Mdy_ang_10 = (s + 2)^3 * (s + 100);
% [C1y_ang_10,T_ang_10] = coeffs(charMy_ang_10, s);
% [C2y_ang_10,T_ang_10] = coeffs(Mdy_ang_10,    s);
% [k1y_ang_10, k2y_ang_10, k3y_ang_10, ki_ang_10m] = solve(C1y_ang_10 == C2y_ang_10, [k1y_ang_10 k2y_ang_10 k3y_ang_10 ki_ang_10m]);
% k1y_ang_10 = vpa(simplify(k1y_ang_10),6);
% k2y_ang_10 = vpa(simplify(k2y_ang_10),6);
% k3y_ang_10 = vpa(simplify(k3y_ang_10),6);
% ki_ang_10m = vpa(simplify(ki_ang_10m),6);
% ky_ang_10 = double(sym([k1y_ang_10 0 0;0   k2y_ang_10 0;0     0       k3y_ang_10]));
% ki_ang_10 = double(sym([0; 0; ki_ang_10m]));
%% Extra Work
syms Ke_full_80 ke1_full_80 ke2_full_80 ke3_full_80 ke4_full_80 ke5_full_80 ke6_full_80  ke7_full_80 ke8_full_80
syms Ke_full_10 ke1_full_10 ke2_full_10 ke3_full_10 ke4_full_10 ke5_full_10 ke6_full_10  ke7_full_10 ke8_full_10
 Q_full_10 = [10 0 0 0 0 0 0 0;
           0 1 0 0 0 0 0 0;
           0 0 100 0 0 0 0 0;
           0 0 0 1 0 0 0 0;
           0 0 0 0 10 0 0 0;
           0 0 0 0 0 1 0 0;
           0 0 0 0 0 0 1 0;
           0 0 0 0 0 0 0 1000];
 R_full_10 = [1 0 0 0;
           0 1 0 0;
           0 0 1 0;
           0 0 0 1];
Q_full_80 = [10 0 0 0 0 0 0 0;
           0 1 0 0 0 0 0 0;
           0 0 1 0 0 0 0 0;
           0 0 0 1 0 0 0 0;
           0 0 0 0 10 0 0 0;
           0 0 0 0 0 1 0 0;
           0 0 0 0 0 0 1 0;
           0 0 0 0 0 0 0 1];
 R_full_80 = [1 0 0 0;
           0 1 0 0;
           0 0 1 0;
           0 0 0 1];
[K_lqr_10_full,S_10_full,E_10_full] = lqr(A_10_full,B_10_full,Q_full_10,R_full_10,0);
[K_lqr_80_full,S_80_full,E_80_full] = lqr(A_80_full,B_80_full,Q_full_80,R_full_80,0);

C_full_ob_p = [0 0 0 0 0 1 0 0];
Ke_full_80 = [ke1_full_80; ke2_full_80; ke3_full_80; ke4_full_80; ke5_full_80; ke6_full_80; ke7_full_80; ke8_full_80];
M_ob_full_80 = A_80_full_ob - Ke_full_80 * C_full_ob_p;
charM_ob_full_80 = charpoly(M_ob_full_80,s);
poles_Ad_80_full = eig(A_80_full_ob - B_80_full_ob*K_lqr_80_full);
poles_Ad_80_full_ob = poles_Ad_80_full - 1;
Md_ob_full_80 = (s - poles_Ad_80_full_ob(1)) * (s - poles_Ad_80_full_ob(2)) * (s - poles_Ad_80_full_ob(3))...
    * (s - poles_Ad_80_full_ob(4)) * (s - poles_Ad_80_full_ob(5))...
    * (s - poles_Ad_80_full_ob(6)) * (s - poles_Ad_80_full_ob(7)) * (s - poles_Ad_80_full_ob(8));
[C1_ob_full_80,T_ang_80] = coeffs(charM_ob_full_80, s);
[C2_ob_full_80,T_ang_80] = coeffs(Md_ob_full_80,    s);
[ke1_full_80, ke2_full_80, ke3_full_80, ke4_full_80, ke5_full_80, ke6_full_80, ke7_full_80, ke8_full_80] = solve(C1_ob_full_80 == C2_ob_full_80,...
                      [ke1_full_80 ke2_full_80 ke3_full_80 ke4_full_80 ke5_full_80 ke6_full_80  ke7_full_80 ke8_full_80]);
ke1_full_80 = vpa(simplify(ke1_full_80),6);
ke2_full_80 = vpa(simplify(ke2_full_80),6);
ke3_full_80 = vpa(simplify(ke3_full_80),6);
ke4_full_80 = vpa(simplify(ke4_full_80),6);
ke5_full_80 = vpa(simplify(ke5_full_80),6);
ke6_full_80 = vpa(simplify(ke6_full_80),6);
ke7_full_80 = vpa(simplify(ke7_full_80),6);
ke8_full_80 = vpa(simplify(ke8_full_80),6);
Ke_full_80 = double(sym([ke1_full_80; ke2_full_80; ke3_full_80; ke4_full_80; ke5_full_80; ke6_full_80;  ke7_full_80; ke8_full_80]));

Ke_full_10 = [ke1_full_10; ke2_full_10; ke3_full_10; ke4_full_10; ke5_full_10; ke6_full_10; ke7_full_10; ke8_full_10];
M_ob_full_10 = A_10_full_ob - Ke_full_10 * C_full_ob_p;
charM_ob_full_10 = charpoly(M_ob_full_10,s);
poles_Ad_10_full = eig(A_10_full_ob - B_10_full_ob*K_lqr_10_full);
poles_Ad_10_full_ob = poles_Ad_10_full - 1;
Md_ob_full_10 = (s - poles_Ad_10_full_ob(1)) * (s - poles_Ad_10_full_ob(2)) * (s - poles_Ad_10_full_ob(3))...
    * (s - poles_Ad_10_full_ob(4)) * (s - poles_Ad_10_full_ob(5))...
    * (s - poles_Ad_10_full_ob(6)) * (s - poles_Ad_10_full_ob(7)) * (s - poles_Ad_10_full_ob(8));
[C1_ob_full_10,T_ang_10] = coeffs(charM_ob_full_10, s);
[C2_ob_full_10,T_ang_10] = coeffs(Md_ob_full_10,    s);
[ke1_full_10, ke2_full_10, ke3_full_10, ke4_full_10, ke5_full_10, ke6_full_10, ke7_full_10, ke8_full_10] = solve(C1_ob_full_10 == C2_ob_full_10,...
                      [ke1_full_10 ke2_full_10 ke3_full_10 ke4_full_10 ke5_full_10 ke6_full_10  ke7_full_10 ke8_full_10]);
ke1_full_10 = vpa(simplify(ke1_full_10),6);
ke2_full_10 = vpa(simplify(ke2_full_10),6);
ke3_full_10 = vpa(simplify(ke3_full_10),6);
ke4_full_10 = vpa(simplify(ke4_full_10),6);
ke5_full_10 = vpa(simplify(ke5_full_10),6);
ke6_full_10 = vpa(simplify(ke6_full_10),6);
ke7_full_10 = vpa(simplify(ke7_full_10),6);
ke8_full_10 = vpa(simplify(ke8_full_10),6);
Ke_full_10 = double(sym([ke1_full_10; ke2_full_10; ke3_full_10; ke4_full_10; ke5_full_10; ke6_full_10;  ke7_full_10; ke8_full_10]));
% plot3(position(:,3),position(:,1),position(:,2))
% grid minor
