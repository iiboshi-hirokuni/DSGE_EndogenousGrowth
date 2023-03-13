%==========================================================================
%170704 É~ÉXèCê≥
%170819 é˚ë©óppriorí≤êÆ
%170902 hist_decomp_y Å® hist_decomp_yy
%170902 bandpass 2-6,6-32,32-999
%170912h hab <- 0, EPS_LêÑíË, rho_bÇÃprior sdïœçX
%==========================================================================

warning('off','all') %NO DISPLAY WARNINGS

//DEFINE ENDOGENOUS VARIABLES#  ___________________________________________
    //ENDOGENOUS STRUCTURAL VARIABLES#35
    var Y C I MU_A LAMBDA_C SDF R_N W_O W L F_W K_W MU_V S MC R_K U_K Q_K K 
        DELTA DELTA_PRIME DELTATIL_A P_V GAMMA_A J LAMBDA PHI I_A I_D 
        PI_O PPI K_P F_P YY A ;
    //AR(1)SHOCK PROCESS VARIABLES#8(36~44)
    var Z_B Z_L Z_I Z_G Z_R Z_P Z_W Z_LAMBDA;
    //OBSERVED VARIABLES#(44~50)
    var DY_OBS DC_OBS DI_OBS DW_OBS PI_OBS R_N_OBS L_OBS;

//DEFINE EXOGENOUS VARIABLES(INCLUDING i.i.d SHOCKS)#8_____________________
varexo EPS_B EPS_L EPS_I EPS_G EPS_R EPS_P EPS_W EPS_LAMBDA;

//DEFINE PARAMETERS#  _____________________________________________________
    //STRUCTURAL PARAMETERS#18<THESE VALUES ARE EXOGENOUSLY GIVEN>
    parameters hab betta zetainv zeta_k rho delta_z omega_a zeta_ainv
               alfa lambda_a lambda_x xi_p lambda_p gamma_p omega_l xi_w
               lambda_w gamma_w phi_r phi_pi phi_y;
    parameters gyss i_dyss; 
    parameters css lambda_css sdfss r_nss w_oss wss lss f_wss k_wss mu_ass
               mu_vss sss mcss r_kss u_kss q_kss kss iss deltass
              delta_primess deltatil_ass p_vss gamma_ass jss lambdass phiss
              i_ass i_dss pi_oss piss k_pss f_pss yyss ass yss;
        //FREE PARAMETER#2<FOLLOWING PARAMS ARE ENDOGENOUSLY GIVEN>
        parameters delta_k b_k chi_z lambda_zero delta_a gamma_l;

    //AR(1)SHOCK PROCESS INEARTIA COEFFICIENTS#8
    parameters rho_b rho_l rho_i rho_g rho_r rho_p rho_w rho_lambda;

    //MEASUREMENT EQUATION PARAMETERS
    parameters lbar;

//INSTALL VALUE OF PARAMETERS#16___________________________________________

    %STRUCTURAL PARAMTERS
    %hab      = 0.85;%ÅZ
    hab      = 0;
    betta    = 0.9975; 
    zetainv  = 4.0;
    zeta_k   = 1.0;
    rho      = 0.27;%0.6;Åö
    delta_z  = 0.025;
    omega_a  = 0.14;%0.80;Åö
    zeta_ainv= 12.0;
    alfa     = 0.40;

    lambda_a = 0.45;
    lambda_p = 0.30;%Kaihatsu and Kurozumi 0.20
    lambda_x = 0.30;%Ikeda and Kurozumi 0.75
    lambda_w = 0.15;%Kaihatsu and Kurozumi 0.20

    xi_p     = 0.5;
    gamma_p  = 0.33;
    omega_l  = 4.7;%ÅZ
    xi_w     = 0.25;
    gamma_w  = 0.20;
    phi_r    = 0.26;
    phi_pi   = 2.35;
    phi_y    = 0.035;
    gyss     = 0.25;
    i_dyss   = 0.05;

    mu_ass   = 1.005;

    lss      = 1;
    u_kss    = 1;
    q_kss    = 1;

    deltass  = 0.025;
    lambdass = 0.025;
    piss     = 1.002;
   
    %AR1 PROCESS PARAMTERS
    rho_b     = 0.99;
    rho_l     = 0.50;
    rho_i     = 0.50;
    rho_g     = 0.50;
    rho_p     = 0.50;
    rho_w     = 0.50;
    rho_lambda= 0.50;
    %OBSERVATION EQUATION PARAMETERS
    lbar      = 1.07;
%@#include "EGver1_param.txt"%è¡Ç∑

    rho_r     = 0;%0.50;

//ISNTALL ESTIMATED PARAMETER VALUES & STEADY STATE------------------------
%load_params_and_steady_state();

//MODEL STRUCTURE#25_______________________________________________________
model;
    #Sdfss = betta/mu_ass;
    #R_nss = piss*mu_ass/betta;
    #R_kss = mu_ass/betta+deltass-1;
    #Delta_primess = R_kss;
    #Mu_vss = mu_ass^((1-alfa)/lambda_a);
    #Deltatil_ass = Mu_vss-1+delta_a;
    #Mcss = 1/(1+lambda_p);
    #Sss =1/(1+lambda_p)/(1+lambda_x);
    #Kss = (Sss*alfa/R_kss)^(1/(1-alfa))*mu_ass;
    #Iss = (mu_ass-1+deltass)/mu_ass*Kss;
    #Yss = (Kss/mu_ass)^alfa;
    #K_pss = Mcss*Yss/(1-betta*xi_p);
    #F_pss = Yss/(1-betta*xi_p);
    #Ass = (1-delta_a)*lambdass/(Deltatil_ass+(1-delta_a)*lambdass);
    #I_dss = i_dyss*Yss;
    #Wss = (1-alfa)*Sss*Yss;
    #Gamma_ass = betta*lambda_x*Sss*Yss/(Mu_vss-betta*(1-delta_a));
    #P_vss = Gamma_ass;
    #Jss = (1-delta_a)*(1-omega_a)*lambdass*P_vss/(1-(1-delta_a)*mu_ass/Mu_vss
           *(1-lambdass*(1-omega_a))*Sdfss);
    #I_ass = (1-delta_a)*omega_a*lambdass*(P_vss-mu_ass/Mu_vss*Sdfss*Jss);
    #Phiss = (Mu_vss-1+delta_z)/Ass/Mu_vss/I_dss;
    #Css = (1-gyss-i_dyss)*Yss-Iss-I_ass*(1/Ass-1);
    #Lambda_css = (mu_ass-betta*hab)/(mu_ass-hab)/Css;
    #Yyss =Css+Iss+gyss*Yss;
    #B_k = mu_ass/betta+deltass-1;
    #Delta_k = deltass - B_k/(1+zeta_k);
    #Chi_z = Phiss*Ass*I_dss^(1-rho);
    #Lambda_zero = lambdass/I_ass^omega_a;
    #Gamma_l = Lambda_css*Wss/(1+lambda_w);

    //Investment adjustment function
    #S_f = 1/2*zetainv*(I/I(-1)*MU_A(-1)/mu_ass-1)^2;
    //Differenciated Investment adjustment function
    #S_f_prime = zetainv*(I/I(-1)*MU_A(-1)/mu_ass-1);
    //Differenciated Investment adjustment function lead
    #S_f_prime_ld = zetainv*(I(+1)/I*MU_A/mu_ass-1); 

    //R&D investment adjustment function
    #S_a =1/2*zeta_ainv*(DELTATIL_A/DELTATIL_A(-1)*MU_V(-1)/mu_vss-1)^2;
    #S_a_prime = zeta_ainv*(DELTATIL_A/DELTATIL_A(-1)*MU_V(-1)/mu_vss-1);
    #S_a_prime_ld = zeta_ainv*(DELTATIL_A(+1)/DELTATIL_A*MU_V/mu_vss-1);
    
//[1]
LAMBDA_C = Z_B*MU_A(-1)/(C*MU_A(-1)-hab*C(-1))
          -betta*hab*Z_B(+1)/(C(+1)*MU_A-hab*C);
//[2]
MU_A*SDF = betta*LAMBDA_C(+1)/LAMBDA_C;
//[3]
SDF = PPI(+1)/R_N;
//[4]
R_K = Q_K*DELTA_PRIME;
//[5]
1=Z_I*Q_K*(1-S_f-S_f_prime*(I*MU_A/I(-1)/mu_ass))
  +mu_vss*SDF*Q_K(+1)*Z_I(+1)*S_f_prime_ld*(I(+1)*MU_A/I/mu_ass)^2;
//[6]
Q_K=SDF*(R_K(+1)*U_K(+1)+Q_K(+1)*(1-DELTA(+1)));
//[7]
DELTA=Delta_k+B_k*U_K^(1+zeta_k)/(1+zeta_k);
//[8]
DELTA_PRIME=B_k*U_K^zeta_k;
//[9]
PHI=Chi_z/A(-1)/I_D^(1-rho);
//[10]
I_D=(1-delta_z)*MU_A*(1/A-(1-delta_z)/MU_V/A(-1))*SDF*J(+1);
//[11]
LAMBDA=Lambda_zero*Z_LAMBDA*I_A^omega_a;
//[12]
DELTATIL_A=(1-delta_a)*LAMBDA*(1/A(-1)-1);
//[13]
I_A   = (1-delta_a)*omega_a*LAMBDA  *(P_V  -MU_A  /MU_V  *SDF  *J(+1));

//[14]
J=(1-delta_a)*( (1-omega_a)*LAMBDA*P_V
               +MU_A/MU_V*(1-LAMBDA*(1-omega_a))*SDF*J(+1));
//[15]
MU_V=(1-delta_a)+(1-S_a)*DELTATIL_A;
//[16]
MU_A=MU_V^(lambda_a/(1-alfa));
//[17]
Y=(U_K*K(-1)/MU_A(-1))^alfa*L^(1-alfa);
//[18]
R_K=alfa*S*MU_A(-1)*Y/U_K/K(-1);

//[19]
W=(1-alfa)*S*Y/L;

//[20]
P_V=GAMMA_A*(1-S_a-S_a_prime*(DELTATIL_A*MU_V(-1)/DELTATIL_A(-1)/mu_vss))
    +mu_vss*MU_V*MU_A*SDF*GAMMA_A(+1)*S_a_prime*(DELTATIL_A(+1)*MU_V/DELTATIL_A/mu_vss)^2;

//[21]
GAMMA_A*MU_V/MU_A=SDF*((1-delta_a)*GAMMA_A(+1) + lambda_x*S(+1)*Y(+1));

//[22]
MC=(1+lambda_x)*S;

//[23]
K_P=MC*Y+xi_p*MU_A*SDF*(PPI^gamma_p*piss^(1-gamma_p)/PPI(+1))^(-(1+lambda_p)/lambda_p)*K_P(+1);

//[24]
F_P=Y+xi_p*MU_A*SDF*(PPI^gamma_p*piss^(1-gamma_p)/PPI(+1))^(-(1+lambda_p)/lambda_p)*F_P(+1);

//[25]
PI_O/PPI=(1+lambda_p*Z_P)*K_P/F_P;

//[26]
1=xi_p*(PPI(-1)^gamma_p*piss^(1-gamma_p)/PPI)^(-1/lambda_p)
  +(1-xi_p)*(PI_O/PPI)^(-1/lambda_p);

//[27]
K_W=Gamma_l*Z_B*Z_L*L^(1+omega_l)+betta*xi_w*(PPI^gamma_w*piss^(1-gamma_w)
/PPI(+1)*W/W(+1)*mu_ass/MU_A)^(-(1+lambda_w)/lambda_w*(1+omega_l))*K_W(+1);

//[28]
F_W=LAMBDA_C*W*L+betta*xi_w*(PPI^gamma_w*piss^(1-gamma_w)
/PPI(+1)*W/W(+1)*mu_ass/MU_A)^(-1/lambda_w)*F_W(+1);

//[29]Åö
W_O/W=((1+lambda_w*Z_W)*K_W/F_W)^(lambda_w/(lambda_w+omega_l+lambda_w*omega_l));

//[30]Åö
1=xi_w*(PPI(-1)^gamma_w*piss^(1-gamma_w)/PPI*W(-1)/W*mu_ass/MU_A(-1))^(-1/lambda_w)
 +(1-xi_w)*(W_O/W)^(-1/lambda_w);

//[31]
Y=C+I+I_A*(1/A(-1)-1)+I_D+gyss*Yss*Z_G;

//[32]
log(R_N)=phi_r*log(R_N(-1))+(1-phi_r)*(log(r_nss)+phi_pi*log(PPI/piss)
                                       +phi_y*log(YY/Yyss))
      +log(Z_R);
//[33]
YY=C+I+gyss*Yss*Z_G;

//[34]
K=(1-DELTA)*K(-1)/MU_A(-1)+Z_I*(1-S_f)*I;

//[35]
1/A=(1-delta_z)/MU_V(-1)/A(-1)+PHI*I_D;

%-------AR
//[36]PREFERENCE
log(Z_B)=rho_b*log(Z_B(-1))+EPS_B;
//[37]LABOR DISUTILITY
log(Z_L)=rho_l*log(Z_L(-1))+EPS_L;
//[38]INVESTMENT EFFICIENCY
log(Z_I)=rho_i*log(Z_I(-1))+EPS_I;
//[39]EXOGENOUS SPENDING
log(Z_G)=rho_g*log(Z_G(-1))+EPS_G;
//[40]MONETARY POLICY
log(Z_R)=rho_r*log(Z_R(-1))+EPS_R;
//[41]PRICE MARKUP
log(Z_P)=rho_p*log(Z_P(-1))+EPS_P;
//[42]WAGE MARKUP
log(Z_W)=rho_w*log(Z_W(-1))+EPS_W;
//[43]SUCCESS RATE
log(Z_LAMBDA)=rho_lambda*log(Z_LAMBDA(-1))+EPS_LAMBDA;

%------OBS
//[44]
DY_OBS    = MU_A(-1)*YY/YY(-1);
//[45]
DC_OBS    = MU_A(-1)*C/C(-1);
//[46]
DI_OBS    = MU_A(-1)*I/I(-1);
//[47]
DW_OBS    = MU_A(-1)*W/W(-1);
//[48]
R_N_OBS   = R_N;
//[49]
PI_OBS    = PPI;
//[50]
L_OBS     = lbar*L;

end;

//MODEL CHECK______________________________________________________________
resid(1);
check;
steady;
model_diagnostics;

//SHOCKS___________________________________________________________________
//shocks;
//var EPS_B = 0.1^2;
//var EPS_L = 5^2;
//var EPS_I = 0.1^2;
//var EPS_G = 0.1^2;
//var EPS_R = 0.1^2;
//var EPS_P = 0.1^2;
//var EPS_W = 0.1^2;
//var EPS_LAMBDA = 0.1^2;
//end;

//SIMULATION_______________________________________________________________
%YY   C    I
%R_N PPI  W
%L   Z_LAMBDA  MU_A;

//ESTIMATION_______________________________________________________________
    //DEFINE PRIOR DISTRIBUTION#-----------------------------------------
    estimated_params;
        %hab       , ,     ,     ,beta_pdf ,0.700,0.100;
        omega_l   , ,     ,     ,gamma_pdf,2.000,0.750;
        zeta_k    , ,     ,     ,gamma_pdf,1.000,0.100;
        zetainv   , ,     ,     ,gamma_pdf,4.000,1.500;
        zeta_ainv , ,     ,     ,gamma_pdf,3.000,1.500;
       %mu_ass    , ,     ,     ,gamma_pdf,1.005,0.001;
        lambdass  , ,     ,     ,beta_pdf ,0.025,0.003;
        omega_a   , ,     ,     ,gamma_pdf,0.500,0.075;
        rho       , ,     ,     ,beta_pdf ,0.600,0.100;
        lbar      , ,     ,     ,gamma_pdf,1.115,0.005;%Hirose(2012),data-mean
       %i_dyss    , ,     ,     ,beta_pdf ,0.050,0.010; 
        piss      , ,     ,     ,gamma_pdf,1.003,0.001;
       %lambda_x  , ,     ,     ,gamma_pdf,0.750,0.250;

        gamma_p   , ,     ,     ,beta_pdf ,0.400,0.150;%Hirose(2012)
        gamma_w   , ,     ,     ,beta_pdf ,0.400,0.150;%Hirose(2012)
        xi_p      , ,     ,     ,beta_pdf ,0.375,0.100;%Hirose(2012)
        xi_w      , ,     ,     ,beta_pdf ,0.375,0.100;%Hirose(2012)

        phi_r    , ,     ,     ,beta_pdf ,0.80  ,0.100 ;%Hirose(2012) 
        phi_pi   , ,     ,     ,gamma_pdf,1.700 ,0.100 ;%Hirose(2012)
        phi_y    , ,     ,     ,gamma_pdf,0.125 ,0.050 ;%Hirose(2012)

        //SHOCK INERTIA COEFFICIENTS#11
        rho_b     , ,     ,     ,beta_pdf ,0.950,0.01,0,0.999;
        rho_l     , ,     ,     ,beta_pdf ,0.500,0.100;
        rho_i     , ,     ,     ,beta_pdf ,0.500,0.200;
        rho_g     , ,     ,     ,beta_pdf ,0.500,0.200;
        rho_lambda, ,     ,     ,beta_pdf ,0.500,0.100;%Åö
        rho_p     , ,     ,     ,beta_pdf ,0.500,0.100;
        rho_w     , ,     ,     ,beta_pdf ,0.500,0.100;
          
        //STANDARD ERRORS#8
        stderr EPS_B        ,0.1  ,,,inv_gamma_pdf, 0.5,inf;
        stderr EPS_L        ,1  ,,,inv_gamma_pdf, 2,inf;
        stderr EPS_I        ,0.5  ,,,inv_gamma_pdf, 0.5,inf;
        stderr EPS_G        ,0.5  ,,,inv_gamma_pdf, 0.5,inf;
        stderr EPS_R        ,0.5  ,,,inv_gamma_pdf, 0.5,inf;
        stderr EPS_LAMBDA   ,0.5  ,,,inv_gamma_pdf, 0.5,inf;
        stderr EPS_P        ,0.5  ,,,inv_gamma_pdf, 0.5,inf;
        stderr EPS_W        ,0.5  ,,,inv_gamma_pdf, 0.5,inf;
    end;   

    //REDEFINE OBSERBED VARIABLES#8----------------------------------------
    varobs DY_OBS DC_OBS DI_OBS DW_OBS PI_OBS R_N_OBS L_OBS;

    //ESTIMATION-----------------------------------------------------------
    estimation(
        loglinear,
        prior_trunc=0,
        datafile='dataset_IK_log.xlsx',
        xls_sheet=Sheet6,     
        xls_range =B1:H136,%1980Q2-1998Q4
        mode_file = 'EGver1_mode.mat',
        mode_compute=5,
        %load_mh_file,
        mode_check,
        graph_format = fig,
        plot_priors=0,
        first_obs=1,
        presample=0,
        mh_replic=12500,%200000,
        mh_nblocks=3,
        mh_jscale=0.350,
        mh_drop=0.20%,
       %bayesian_irf,
       %forecast=100,
        %irf=40,
        %nodisplay
        );//Y   C    I

//SAVE ESTIMATED PARAMETER & STEADY STATE VALUES___________________________
%save_params_and_steady_state(DSGEr6_params_steady_state,init);

//HISTORICAL DECOMPOSITION_________________________________________________
shock_decomposition(parameter_set=posterior_mean,nograph)
MU_A Y C I I_D DY_OBS DC_OBS DI_OBS DW_OBS PI_OBS R_N_OBS L_OBS YY;

//WRITING HISTORICAL DECOMPOSITION RESULT__________________________________
name={'Preference',...
      'Labor Disutility',...
      'Investment Adjustment Cost',...
      'Exogenous Spending',...
      'Monetary Policy',...
      'Price Markup',...
      'Wage Markup',...
      'Success Rate',...
      'Initial Value',...
      'Actual Value'};

box=[0 0 0 0 0 0 0 0 0 0];

%DY_OBS DC_OBS DI_OBS DW_OBS PI_OBS R_N_OBS L_OBS
%dy1------------------------------------------------------------------------
xlswrite('hist_dy_obs.xlsx',[box;reshape(oo_.shock_decomposition(44,:,:),10,135)']);
xlswrite('hist_dy_obs.xlsx',[name]);

%dc2
xlswrite('hist_dc_obs.xlsx',[box;reshape(oo_.shock_decomposition(45,:,:),10,135)']);
xlswrite('hist_dc_obs.xlsx',[name]);

%di3
xlswrite('hist_di_obs.xlsx',[box;reshape(oo_.shock_decomposition(46,:,:),10,135)']);
xlswrite('hist_di_obs.xlsx',[name]);

%dw4
xlswrite('hist_dw_obs.xlsx',[box;reshape(oo_.shock_decomposition(47,:,:),10,135)']);
xlswrite('hist_dw_obs.xlsx',[name]);

%pi6
xlswrite('hist_pi_obs.xlsx',[box;reshape(oo_.shock_decomposition(48,:,:),10,135)']);
xlswrite('hist_pi_obs.xlsx',[name]);

%r_n5
xlswrite('hist_r_n_obs.xlsx',[box;reshape(oo_.shock_decomposition(49,:,:),10,135)']);
xlswrite('hist_r_n_obs.xlsx',[name]);

%l7
xlswrite('hist_l_obs.xlsx',[box;reshape(oo_.shock_decomposition(50,:,:),10,135)']);
xlswrite('hist_l_obs.xlsx',[name]);

%y
xlswrite('hist_y_obs.xlsx',[box;reshape(oo_.shock_decomposition(1,:,:),10,135)']);
xlswrite('hist_y_obs.xlsx',[name]);

%yy
xlswrite('hist_yy_obs.xlsx',[box;reshape(oo_.shock_decomposition(34,:,:),10,135)']);
xlswrite('hist_yy_obs.xlsx',[name]);

%c
xlswrite('hist_c_obs.xlsx',[box;reshape(oo_.shock_decomposition(2,:,:),10,135)']);
xlswrite('hist_c_obs.xlsx',[name]);

%i
xlswrite('hist_i_obs.xlsx',[box;reshape(oo_.shock_decomposition(3,:,:),10,135)']);
xlswrite('hist_i_obs.xlsx',[name]);

%mu_a
xlswrite('hist_mu_a.xlsx',[box;reshape(oo_.shock_decomposition(4,:,:),10,135)']);
xlswrite('hist_mu_a.xlsx',[name]);

%==========================================================================
//SHOCKS___________________________________________________________________
shocks;
var EPS_B = 0.1^2;
var EPS_L = 0.1^2;
var EPS_I = 0.1^2;
var EPS_G = 0.1^2;
var EPS_R = 0.1^2;
var EPS_P = 0.1^2;
var EPS_W = 0.1^2;
var EPS_LAMBDA = 0.1^2;
end;

//IRFs_____________________________________________________________________
stoch_simul(irf=200,loglinear,order=1,graph_format = fig,nodisplay,
            spectral_density)
        Y   C   I 
        R_K R_N W 
        L   PPI MU_A

        DY_OBS DC_OBS DI_OBS
        DW_OBS PI_OBS R_N_OBS
        L_OBS YY;
%B-------------------------------------------------------------------------
    name1={'Y_EPS_B',...
          'C_EPS_B',...
          'I_EPS_B',...
          'R_K_EPS_B',...
          'R_N_EPS_B',...
          'W_EPS_B',...
          'L_EPS_B',...
          'PI_EPS_B',...
          'MU_A_EPS_B',...
          'YY_EPS_B'};
    box1=[0 0 0 0 0 0 0 0 0 0];
    xlswrite('IRF_EPS_B_nonfiltered.xlsx',[box1;box1; oo_.irfs.Y_EPS_B' oo_.irfs.C_EPS_B' ....
              oo_.irfs.I_EPS_B' oo_.irfs.R_K_EPS_B' oo_.irfs.R_N_EPS_B' oo_.irfs.W_EPS_B' oo_.irfs.L_EPS_B'...
              oo_.irfs.PPI_EPS_B' oo_.irfs.MU_A_EPS_B' oo_.irfs.YY_EPS_B'] );
    xlswrite('IRF_EPS_B_nonfiltered.xlsx',[name1]);

%L-------------------------------------------------------------------------
    name2={'Y_EPS_L',...
           'C_EPS_L',...
           'I_EPS_L',...
           'R_K_EPS_L',...
           'R_N_EPS_L',...
           'W_EPS_L',...
           'L_EPS_L',...
           'PI_EPS_L',...
           'MU_A_EPS_L',...
           'YY_EPS_L'};
    box1=[0 0 0 0 0 0 0 0 0 0];
    xlswrite('IRF_EPS_L_nonfiltered.xlsx',[box1;box1; oo_.irfs.Y_EPS_L' oo_.irfs.C_EPS_L' ....
              oo_.irfs.I_EPS_L' oo_.irfs.R_K_EPS_L' oo_.irfs.R_N_EPS_L' oo_.irfs.W_EPS_L' oo_.irfs.L_EPS_L'...
              oo_.irfs.PPI_EPS_L' oo_.irfs.MU_A_EPS_L' oo_.irfs.YY_EPS_L'] );
    xlswrite('IRF_EPS_L_nonfiltered.xlsx',[name2]);

%I-------------------------------------------------------------------------
    name3={'Y_EPS_I',...
          'C_EPS_I',...
          'I_EPS_I',...
          'R_K_EPS_I',...
          'R_N_EPS_I',...
          'W_EPS_I',...
          'L_EPS_I',...
          'PI_EPS_I',...
          'MU_A_EPS_I',...
          'YY_EPS_I'};
    box1=[0 0 0 0 0 0 0 0 0 0];
    xlswrite('IRF_EPS_I_nonfiltered.xlsx',[box1;box1; oo_.irfs.Y_EPS_I' oo_.irfs.C_EPS_I' ....
              oo_.irfs.I_EPS_I' oo_.irfs.R_K_EPS_I' oo_.irfs.R_N_EPS_I' oo_.irfs.W_EPS_I' oo_.irfs.L_EPS_I'...
              oo_.irfs.PPI_EPS_I' oo_.irfs.MU_A_EPS_I' oo_.irfs.YY_EPS_I'] );
    xlswrite('IRF_EPS_I_nonfiltered.xlsx',[name3]);

%G-------------------------------------------------------------------------
    name4={'Y_EPS_G',...
           'C_EPS_G',...
           'I_EPS_G',...
           'R_K_EPS_G',...
           'R_N_EPS_G',...
           'W_EPS_G',...
           'L_EPS_G',...
           'PI_EPS_G',...
           'MU_A_EPS_G', YY_EPS_G};
    box1=[0 0 0 0 0 0 0 0 0 0];
    xlswrite('IRF_EPS_G_nonfiltered.xlsx',[box1;box1; oo_.irfs.Y_EPS_G' oo_.irfs.C_EPS_G' ....
              oo_.irfs.I_EPS_G' oo_.irfs.R_K_EPS_G' oo_.irfs.R_N_EPS_G' oo_.irfs.W_EPS_G' oo_.irfs.L_EPS_G'...
              oo_.irfs.PPI_EPS_G' oo_.irfs.MU_A_EPS_G' oo_.irfs.YY_EPS_G'] );
    xlswrite('IRF_EPS_G_nonfiltered.xlsx',[name4]);

%R-------------------------------------------------------------------------
    name5={'Y_EPS_R',...
           'C_EPS_R',...
           'I_EPS_R',...
           'R_K_EPS_R',...
           'R_N_EPS_R',...
           'W_EPS_R',...
           'L_EPS_R',...
           'PI_EPS_R',...
           'MU_A_EPS_R', YY_EPS_R};
    box1=[0 0 0 0 0 0 0 0 0 0];
    xlswrite('IRF_EPS_R_nonfiltered.xlsx',[box1;box1; oo_.irfs.Y_EPS_R' oo_.irfs.C_EPS_R' ....
              oo_.irfs.I_EPS_R' oo_.irfs.R_K_EPS_R' oo_.irfs.R_N_EPS_R' oo_.irfs.W_EPS_R' oo_.irfs.L_EPS_R'...
              oo_.irfs.PPI_EPS_R' oo_.irfs.MU_A_EPS_R' oo_.irfs.YY_EPS_R'] );
    xlswrite('IRF_EPS_R_nonfiltered.xlsx',[name5]);

%P----------------------------------------------------------
    name6={'Y_EPS_P',...
           'C_EPS_P',...
           'I_EPS_P',...
           'R_K_EPS_P',...
           'R_N_EPS_P',...
           'W_EPS_P',...
           'L_EPS_P',...
           'PI_EPS_P',...
           'MU_A_EPS_P', YY_EPS_P};
    box1=[0 0 0 0 0 0 0 0 0 0];
    xlswrite('IRF_EPS_P_nonfiltered.xlsx',[box1;box1; oo_.irfs.Y_EPS_P' oo_.irfs.C_EPS_P' ....
              oo_.irfs.I_EPS_P' oo_.irfs.R_K_EPS_P' oo_.irfs.R_N_EPS_P' oo_.irfs.W_EPS_P' oo_.irfs.L_EPS_P'...
              oo_.irfs.PPI_EPS_P' oo_.irfs.MU_A_EPS_P' oo_.irfs.YY_EPS_P'] );
    xlswrite('IRF_EPS_P_nonfiltered.xlsx',[name6]);

%W----------------------------------------------------------
    name7={'Y_EPS_W',...
           'C_EPS_W',...
           'I_EPS_W',...
           'R_K_EPS_W',...
           'R_N_EPS_W',...
           'W_EPS_W',...
           'L_EPS_W',...
           'PI_EPS_W',...
           'MU_A_EPS_W', YY_EPS_W};
    box1=[0 0 0 0 0 0 0 0 0 0];
    xlswrite('IRF_EPS_W_nonfiltered.xlsx',[box1;box1; oo_.irfs.Y_EPS_W' oo_.irfs.C_EPS_W' ....
              oo_.irfs.I_EPS_W' oo_.irfs.R_K_EPS_W' oo_.irfs.R_N_EPS_W' oo_.irfs.W_EPS_W' oo_.irfs.L_EPS_W'...
              oo_.irfs.PPI_EPS_W' oo_.irfs.MU_A_EPS_W' oo_.irfs.YY_EPS_W'] );
    xlswrite('IRF_EPS_W_nonfiltered.xlsx',[name7]);
%LAMBDA----------------------------------------------------------
    name8={'Y_EPS_LAMBDA',...
           'C_EPS_LAMBDA',...
           'I_EPS_LAMBDA',...
           'R_K_EPS_LAMBDA',...
           'R_N_EPS_LAMBDA',...
           'W_EPS_LAMBDA',...
           'L_EPS_LAMBDA',...
           'PI_EPS_LAMBDA',...
           'MU_A_EPS_LAMBDA', YY_EPS_LAMBDA};
    box1=[0 0 0 0 0 0 0 0 0 0];
    xlswrite('IRF_EPS_LAMBDA_nonfiltered.xlsx',[box1;box1; oo_.irfs.Y_EPS_LAMBDA' oo_.irfs.C_EPS_LAMBDA' ....
              oo_.irfs.I_EPS_LAMBDA' oo_.irfs.R_K_EPS_LAMBDA' oo_.irfs.R_N_EPS_LAMBDA' oo_.irfs.W_EPS_LAMBDA' oo_.irfs.L_EPS_LAMBDA'...
              oo_.irfs.PPI_EPS_LAMBDA' oo_.irfs.MU_A_EPS_LAMBDA' oo_.irfs.YY_EPS_LAMBDA'] );
    xlswrite('IRF_EPS_LAMBDA_nonfiltered.xlsx',[name8]);

//IRFs[2,8]_______________________________________________________________
stoch_simul(irf=200,loglinear,order=1,graph_format = fig,nodisplay,
            spectral_density,bandpass_filter =[2,6])
        Y   C   I 
        R_K R_N W 
        L   PPI MU_A

        DY_OBS DC_OBS DI_OBS
        DW_OBS PI_OBS R_N_OBS
        L_OBS YY;
        %Preference----------------------------------------------------------------
        xlswrite('IRF_EPS_B_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_B' oo_.irfs.C_EPS_B' ....
                  oo_.irfs.I_EPS_B' oo_.irfs.R_K_EPS_B' oo_.irfs.R_N_EPS_B' oo_.irfs.W_EPS_B' oo_.irfs.L_EPS_B'...
                  oo_.irfs.PPI_EPS_B' oo_.irfs.MU_A_EPS_B' oo_.irfs.YY_EPS_B'] );
            xlswrite('IRF_EPS_B_filtered_2-8.xlsx',[name1]);

        %Labor Disutility----------------------------------------------------------
        xlswrite('IRF_EPS_L_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_L' oo_.irfs.C_EPS_L' ....
                  oo_.irfs.I_EPS_L' oo_.irfs.R_K_EPS_L' oo_.irfs.R_N_EPS_L' oo_.irfs.W_EPS_L' oo_.irfs.L_EPS_L'...
                  oo_.irfs.PPI_EPS_L' oo_.irfs.MU_A_EPS_L' oo_.irfs.YY_EPS_L'] );
            xlswrite('IRF_EPS_L_filtered_2-8.xlsx',[name2]);

        %Investment Efficiency-----------------------------------------------------
        xlswrite('IRF_EPS_I_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_I' oo_.irfs.C_EPS_I' ....
                  oo_.irfs.I_EPS_I' oo_.irfs.R_K_EPS_I' oo_.irfs.R_N_EPS_I' oo_.irfs.W_EPS_I' oo_.irfs.L_EPS_I'...
                  oo_.irfs.PPI_EPS_I' oo_.irfs.MU_A_EPS_I' oo_.irfs.YY_EPS_I'] );
            xlswrite('IRF_EPS_I_filtered_2-8.xlsx',[name3]);
        %G----------------------------------------------------------
        xlswrite('IRF_EPS_G_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_G' oo_.irfs.C_EPS_G' ....
                  oo_.irfs.I_EPS_G' oo_.irfs.R_K_EPS_G' oo_.irfs.R_N_EPS_G' oo_.irfs.W_EPS_G' oo_.irfs.L_EPS_G'...
                  oo_.irfs.PPI_EPS_G' oo_.irfs.MU_A_EPS_G' oo_.irfs.YY_EPS_G'] );
            xlswrite('IRF_EPS_G_filtered_2-8.xlsx',[name4]);
        %R----------------------------------------------------------
        xlswrite('IRF_EPS_R_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_R' oo_.irfs.C_EPS_R' ....
                  oo_.irfs.I_EPS_R' oo_.irfs.R_K_EPS_R' oo_.irfs.R_N_EPS_R' oo_.irfs.W_EPS_R' oo_.irfs.L_EPS_R'...
                  oo_.irfs.PPI_EPS_R' oo_.irfs.MU_A_EPS_R' oo_.irfs.YY_EPS_R'] );
            xlswrite('IRF_EPS_R_filtered_2-8.xlsx',[name5]);
        %P----------------------------------------------------------
        xlswrite('IRF_EPS_P_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_P' oo_.irfs.C_EPS_P' ....
                  oo_.irfs.I_EPS_P' oo_.irfs.R_K_EPS_P' oo_.irfs.R_N_EPS_P' oo_.irfs.W_EPS_P' oo_.irfs.L_EPS_P'...
                  oo_.irfs.PPI_EPS_P' oo_.irfs.MU_A_EPS_P' oo_.irfs.YY_EPS_P'] );
            xlswrite('IRF_EPS_P_filtered_2-8.xlsx',[name6]);
        %W----------------------------------------------------------
        xlswrite('IRF_EPS_W_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_W' oo_.irfs.C_EPS_W' ....
                  oo_.irfs.I_EPS_W' oo_.irfs.R_K_EPS_W' oo_.irfs.R_N_EPS_W' oo_.irfs.W_EPS_W' oo_.irfs.L_EPS_W'...
                  oo_.irfs.PPI_EPS_W' oo_.irfs.MU_A_EPS_W' oo_.irfs.YY_EPS_W'] );
            xlswrite('IRF_EPS_W_filtered_2-8.xlsx',[name7]);
        %LAMBDA----------------------------------------------------------
        xlswrite('IRF_EPS_LAMBDA_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_LAMBDA' oo_.irfs.C_EPS_LAMBDA' ....
                  oo_.irfs.I_EPS_LAMBDA' oo_.irfs.R_K_EPS_LAMBDA' oo_.irfs.R_N_EPS_LAMBDA' oo_.irfs.W_EPS_LAMBDA' oo_.irfs.L_EPS_LAMBDA'...
                  oo_.irfs.PPI_EPS_LAMBDA' oo_.irfs.MU_A_EPS_LAMBDA' oo_.irfs.YY_EPS_LAMBDA'] );
            xlswrite('IRF_EPS_LAMBDA_filtered_2-8.xlsx',[name8]);

//IRFs[6,32]_______________________________________________________________
stoch_simul(irf=200,loglinear,order=1,graph_format = fig,nodisplay,
            spectral_density,bandpass_filter =[6,32])
        Y   C   I 
        R_K R_N W 
        L   PPI MU_A

        DY_OBS DC_OBS DI_OBS
        DW_OBS PI_OBS R_N_OBS
        L_OBS YY;
        %Preference----------------------------------------------------------------
        xlswrite('IRF_EPS_B_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_B' oo_.irfs.C_EPS_B' ....
                  oo_.irfs.I_EPS_B' oo_.irfs.R_K_EPS_B' oo_.irfs.R_N_EPS_B' oo_.irfs.W_EPS_B' oo_.irfs.L_EPS_B'...
                  oo_.irfs.PPI_EPS_B' oo_.irfs.MU_A_EPS_B' oo_.irfs.YY_EPS_B'] );
            xlswrite('IRF_EPS_B_filtered_6-32.xlsx',[name1]);

        %Labor Disutility----------------------------------------------------------
        xlswrite('IRF_EPS_L_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_L' oo_.irfs.C_EPS_L' ....
                  oo_.irfs.I_EPS_L' oo_.irfs.R_K_EPS_L' oo_.irfs.R_N_EPS_L' oo_.irfs.W_EPS_L' oo_.irfs.L_EPS_L'...
                  oo_.irfs.PPI_EPS_L' oo_.irfs.MU_A_EPS_L' oo_.irfs.YY_EPS_L'] );
            xlswrite('IRF_EPS_L_filtered_6-32.xlsx',[name2]);

        %Investment Efficiency-----------------------------------------------------
        xlswrite('IRF_EPS_I_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_I' oo_.irfs.C_EPS_I' ....
                  oo_.irfs.I_EPS_I' oo_.irfs.R_K_EPS_I' oo_.irfs.R_N_EPS_I' oo_.irfs.W_EPS_I' oo_.irfs.L_EPS_I'...
                  oo_.irfs.PPI_EPS_I' oo_.irfs.MU_A_EPS_I' oo_.irfs.YY_EPS_I'] );
            xlswrite('IRF_EPS_I_filtered_6-32.xlsx',[name3]);
        %G----------------------------------------------------------
        xlswrite('IRF_EPS_G_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_G' oo_.irfs.C_EPS_G' ....
                  oo_.irfs.I_EPS_G' oo_.irfs.R_K_EPS_G' oo_.irfs.R_N_EPS_G' oo_.irfs.W_EPS_G' oo_.irfs.L_EPS_G'...
                  oo_.irfs.PPI_EPS_G' oo_.irfs.MU_A_EPS_G' oo_.irfs.YY_EPS_G'] );
            xlswrite('IRF_EPS_G_filtered_6-32.xlsx',[name4]);
        %R----------------------------------------------------------
        xlswrite('IRF_EPS_R_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_R' oo_.irfs.C_EPS_R' ....
                  oo_.irfs.I_EPS_R' oo_.irfs.R_K_EPS_R' oo_.irfs.R_N_EPS_R' oo_.irfs.W_EPS_R' oo_.irfs.L_EPS_R'...
                  oo_.irfs.PPI_EPS_R' oo_.irfs.MU_A_EPS_R' oo_.irfs.YY_EPS_R'] );
            xlswrite('IRF_EPS_R_filtered_6-32.xlsx',[name5]);
        %P----------------------------------------------------------
        xlswrite('IRF_EPS_P_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_P' oo_.irfs.C_EPS_P' ....
                  oo_.irfs.I_EPS_P' oo_.irfs.R_K_EPS_P' oo_.irfs.R_N_EPS_P' oo_.irfs.W_EPS_P' oo_.irfs.L_EPS_P'...
                  oo_.irfs.PPI_EPS_P' oo_.irfs.MU_A_EPS_P' oo_.irfs.YY_EPS_P'] );
            xlswrite('IRF_EPS_P_filtered_6-32.xlsx',[name6]);
        %W----------------------------------------------------------
        xlswrite('IRF_EPS_W_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_W' oo_.irfs.C_EPS_W' ....
                  oo_.irfs.I_EPS_W' oo_.irfs.R_K_EPS_W' oo_.irfs.R_N_EPS_W' oo_.irfs.W_EPS_W' oo_.irfs.L_EPS_W'...
                  oo_.irfs.PPI_EPS_W' oo_.irfs.MU_A_EPS_W' oo_.irfs.YY_EPS_W'] );
            xlswrite('IRF_EPS_W_filtered_6-32.xlsx',[name7]);
        %LAMBDA----------------------------------------------------------
        xlswrite('IRF_EPS_LAMBDA_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_LAMBDA' oo_.irfs.C_EPS_LAMBDA' ....
                  oo_.irfs.I_EPS_LAMBDA' oo_.irfs.R_K_EPS_LAMBDA' oo_.irfs.R_N_EPS_LAMBDA' oo_.irfs.W_EPS_LAMBDA' oo_.irfs.L_EPS_LAMBDA'...
                  oo_.irfs.PPI_EPS_LAMBDA' oo_.irfs.MU_A_EPS_LAMBDA' oo_.irfs.YY_EPS_LAMBDA'] );
            xlswrite('IRF_EPS_LAMBDA_filtered_6-32.xlsx',[name8]);

//IRFs[8,32]_______________________________________________________________
stoch_simul(irf=200,loglinear,order=1,graph_format = fig,nodisplay,
            spectral_density,bandpass_filter =[8,32])
        Y   C   I 
        R_K R_N W 
        L   PPI MU_A

        DY_OBS DC_OBS DI_OBS
        DW_OBS PI_OBS R_N_OBS
        L_OBS YY;
        %Preference----------------------------------------------------------------
        xlswrite('IRF_EPS_B_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_B' oo_.irfs.C_EPS_B' ....
                  oo_.irfs.I_EPS_B' oo_.irfs.R_K_EPS_B' oo_.irfs.R_N_EPS_B' oo_.irfs.W_EPS_B' oo_.irfs.L_EPS_B'...
                  oo_.irfs.PPI_EPS_B' oo_.irfs.MU_A_EPS_B' oo_.irfs.YY_EPS_B'] );
            xlswrite('IRF_EPS_B_filtered_8-32.xlsx',[name1]);

        %Labor Disutility----------------------------------------------------------
        xlswrite('IRF_EPS_L_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_L' oo_.irfs.C_EPS_L' ....
                  oo_.irfs.I_EPS_L' oo_.irfs.R_K_EPS_L' oo_.irfs.R_N_EPS_L' oo_.irfs.W_EPS_L' oo_.irfs.L_EPS_L'...
                  oo_.irfs.PPI_EPS_L' oo_.irfs.MU_A_EPS_L' oo_.irfs.YY_EPS_L'] );
            xlswrite('IRF_EPS_L_filtered_8-32.xlsx',[name2]);

        %Investment Efficiency-----------------------------------------------------
        xlswrite('IRF_EPS_I_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_I' oo_.irfs.C_EPS_I' ....
                  oo_.irfs.I_EPS_I' oo_.irfs.R_K_EPS_I' oo_.irfs.R_N_EPS_I' oo_.irfs.W_EPS_I' oo_.irfs.L_EPS_I'...
                  oo_.irfs.PPI_EPS_I' oo_.irfs.MU_A_EPS_I' oo_.irfs.YY_EPS_I'] );
            xlswrite('IRF_EPS_I_filtered_8-32.xlsx',[name3]);
        %G----------------------------------------------------------
        xlswrite('IRF_EPS_G_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_G' oo_.irfs.C_EPS_G' ....
                  oo_.irfs.I_EPS_G' oo_.irfs.R_K_EPS_G' oo_.irfs.R_N_EPS_G' oo_.irfs.W_EPS_G' oo_.irfs.L_EPS_G'...
                  oo_.irfs.PPI_EPS_G' oo_.irfs.MU_A_EPS_G' oo_.irfs.YY_EPS_G'] );
            xlswrite('IRF_EPS_G_filtered_8-32.xlsx',[name4]);
        %R----------------------------------------------------------
        xlswrite('IRF_EPS_R_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_R' oo_.irfs.C_EPS_R' ....
                  oo_.irfs.I_EPS_R' oo_.irfs.R_K_EPS_R' oo_.irfs.R_N_EPS_R' oo_.irfs.W_EPS_R' oo_.irfs.L_EPS_R'...
                  oo_.irfs.PPI_EPS_R' oo_.irfs.MU_A_EPS_R' oo_.irfs.YY_EPS_R'] );
            xlswrite('IRF_EPS_R_filtered_8-32.xlsx',[name5]);
        %P----------------------------------------------------------
        xlswrite('IRF_EPS_P_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_P' oo_.irfs.C_EPS_P' ....
                  oo_.irfs.I_EPS_P' oo_.irfs.R_K_EPS_P' oo_.irfs.R_N_EPS_P' oo_.irfs.W_EPS_P' oo_.irfs.L_EPS_P'...
                  oo_.irfs.PPI_EPS_P' oo_.irfs.MU_A_EPS_P' oo_.irfs.YY_EPS_P'] );
            xlswrite('IRF_EPS_P_filtered_8-32.xlsx',[name6]);
        %W----------------------------------------------------------
        xlswrite('IRF_EPS_W_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_W' oo_.irfs.C_EPS_W' ....
                  oo_.irfs.I_EPS_W' oo_.irfs.R_K_EPS_W' oo_.irfs.R_N_EPS_W' oo_.irfs.W_EPS_W' oo_.irfs.L_EPS_W'...
                  oo_.irfs.PPI_EPS_W' oo_.irfs.MU_A_EPS_W' oo_.irfs.YY_EPS_W'] );
            xlswrite('IRF_EPS_W_filtered_8-32.xlsx',[name7]);
        %LAMBDA----------------------------------------------------------
        xlswrite('IRF_EPS_LAMBDA_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_LAMBDA' oo_.irfs.C_EPS_LAMBDA' ....
                  oo_.irfs.I_EPS_LAMBDA' oo_.irfs.R_K_EPS_LAMBDA' oo_.irfs.R_N_EPS_LAMBDA' oo_.irfs.W_EPS_LAMBDA' oo_.irfs.L_EPS_LAMBDA'...
                  oo_.irfs.PPI_EPS_LAMBDA' oo_.irfs.MU_A_EPS_LAMBDA' oo_.irfs.YY_EPS_LAMBDA'] );
            xlswrite('IRF_EPS_LAMBDA_filtered_8-32.xlsx',[name8]);

//IRFs[8,inf]_______________________________________________________________
stoch_simul(irf=200,loglinear,order=1,graph_format = fig,nodisplay,
            spectral_density,bandpass_filter =[32,9999])
        Y   C   I 
        R_K R_N W 
        L   PPI MU_A

        DY_OBS DC_OBS DI_OBS
        DW_OBS PI_OBS R_N_OBS
        L_OBS YY;
        %Preference----------------------------------------------------------------
        xlswrite('IRF_EPS_B_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_B' oo_.irfs.C_EPS_B' ....
                  oo_.irfs.I_EPS_B' oo_.irfs.R_K_EPS_B' oo_.irfs.R_N_EPS_B' oo_.irfs.W_EPS_B' oo_.irfs.L_EPS_B'...
                  oo_.irfs.PPI_EPS_B' oo_.irfs.MU_A_EPS_B' oo_.irfs.YY_EPS_B'] );
            xlswrite('IRF_EPS_B_filtered_32-.xlsx',[name1]);

        %Labor Disutility----------------------------------------------------------
        xlswrite('IRF_EPS_L_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_L' oo_.irfs.C_EPS_L' ....
                  oo_.irfs.I_EPS_L' oo_.irfs.R_K_EPS_L' oo_.irfs.R_N_EPS_L' oo_.irfs.W_EPS_L' oo_.irfs.L_EPS_L'...
                  oo_.irfs.PPI_EPS_L' oo_.irfs.MU_A_EPS_L' oo_.irfs.YY_EPS_L'] );
            xlswrite('IRF_EPS_L_filtered_32-.xlsx',[name2]);

        %Investment Efficiency-----------------------------------------------------
        xlswrite('IRF_EPS_I_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_I' oo_.irfs.C_EPS_I' ....
                  oo_.irfs.I_EPS_I' oo_.irfs.R_K_EPS_I' oo_.irfs.R_N_EPS_I' oo_.irfs.W_EPS_I' oo_.irfs.L_EPS_I'...
                  oo_.irfs.PPI_EPS_I' oo_.irfs.MU_A_EPS_I' oo_.irfs.YY_EPS_I'] );
            xlswrite('IRF_EPS_I_filtered_32-.xlsx',[name3]);
        %G----------------------------------------------------------
        xlswrite('IRF_EPS_G_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_G' oo_.irfs.C_EPS_G' ....
                  oo_.irfs.I_EPS_G' oo_.irfs.R_K_EPS_G' oo_.irfs.R_N_EPS_G' oo_.irfs.W_EPS_G' oo_.irfs.L_EPS_G'...
                  oo_.irfs.PPI_EPS_G' oo_.irfs.MU_A_EPS_G' oo_.irfs.YY_EPS_G'] );
            xlswrite('IRF_EPS_G_filtered_32-.xlsx',[name4]);
        %R----------------------------------------------------------
        xlswrite('IRF_EPS_R_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_R' oo_.irfs.C_EPS_R' ....
                  oo_.irfs.I_EPS_R' oo_.irfs.R_K_EPS_R' oo_.irfs.R_N_EPS_R' oo_.irfs.W_EPS_R' oo_.irfs.L_EPS_R'...
                  oo_.irfs.PPI_EPS_R' oo_.irfs.MU_A_EPS_R' oo_.irfs.YY_EPS_R'] );
            xlswrite('IRF_EPS_R_filtered_32-.xlsx',[name5]);
        %P----------------------------------------------------------
        xlswrite('IRF_EPS_P_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_P' oo_.irfs.C_EPS_P' ....
                  oo_.irfs.I_EPS_P' oo_.irfs.R_K_EPS_P' oo_.irfs.R_N_EPS_P' oo_.irfs.W_EPS_P' oo_.irfs.L_EPS_P'...
                  oo_.irfs.PPI_EPS_P' oo_.irfs.MU_A_EPS_P' oo_.irfs.YY_EPS_P'] );
            xlswrite('IRF_EPS_P_filtered_32-.xlsx',[name6]);
        %W----------------------------------------------------------
        xlswrite('IRF_EPS_W_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_W' oo_.irfs.C_EPS_W' ....
                  oo_.irfs.I_EPS_W' oo_.irfs.R_K_EPS_W' oo_.irfs.R_N_EPS_W' oo_.irfs.W_EPS_W' oo_.irfs.L_EPS_W'...
                  oo_.irfs.PPI_EPS_W' oo_.irfs.MU_A_EPS_W' oo_.irfs.YY_EPS_W'] );
            xlswrite('IRF_EPS_W_filtered_32-.xlsx',[name7]);
        %LAMBDA----------------------------------------------------------
        xlswrite('IRF_EPS_LAMBDA_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_LAMBDA' oo_.irfs.C_EPS_LAMBDA' ....
                  oo_.irfs.I_EPS_LAMBDA' oo_.irfs.R_K_EPS_LAMBDA' oo_.irfs.R_N_EPS_LAMBDA' oo_.irfs.W_EPS_LAMBDA' oo_.irfs.L_EPS_LAMBDA'...
                  oo_.irfs.PPI_EPS_LAMBDA' oo_.irfs.MU_A_EPS_LAMBDA' oo_.irfs.YY_EPS_LAMBDA'] );
            xlswrite('IRF_EPS_LAMBDA_filtered_32-.xlsx',[name8]);