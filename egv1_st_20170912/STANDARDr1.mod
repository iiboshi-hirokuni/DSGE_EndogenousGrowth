%==========================================================================
% STANDARD DSGE MODEL
%2015.7.20 DAISUKE NAKAMURA
%RBC
%+HABIT FORMATION
%+CALVO WAGE
%+CALVO PRICE
%+ENDOGENOUS GROWTH TREND
%+INVESNTMENT SPECIFIC TECHNOLOGY
%+INVESTMENT ADJUSTMENT COST FUNCTION
%+CAPITAL DEPRECIATION FUNCTION
%170709 内生変数を大文字に変更
%170717 mu_zssのprior変更
%170912h priorをEGver1.modに合わせて変更
%==========================================================================


//DEFINE ENDOGENOUS VARIABLES#  ___________________________________________
    //ENDOGENOUS STRUCTURAL VA RIABLES#25
    var LAMBDA_C MU_Z C I Q_K  DELTA DELTA_PRIME SDF K L
        U_K PPI PPI_O W W_O K_W F_W K_P F_P R_K R_N Y MC;
    //AR(1)SHOCK PROCESS VARIABLES#8
    var Z_Z Z_B Z_L Z_I Z_G Z_R Z_P Z_W;
    //OBSERVED VARIABLES#7
    var DY_OBS DC_OBS DI_OBS DW_OBS R_N_OBS PI_OBS L_OBS;

//DEFINE EXOGENOUS VARIABLES(INCLUDING i.i.d SHOCKS)#9____________________
varexo EPS_Z EPS_B EPS_L EPS_I EPS_G EPS_R EPS_P EPS_W;

//DEFINE PARAMETERS#  _____________________________________________________
    //STRUCTURAL PARAMETERS#18<THESE VALUES ARE EXOGENOUSLY GIVEN>
    parameters mu_zss hab betta deltass zetainv zeta_k gamma_w xi_w
               lambda_w omega ppiss gyss alfa gamma_p xi_p lambda_p
               phi_r phi_pi phi_y lbar;
        //FREE PARAMETER#2<FOLLOWING PARAMS ARE ENDOGENOUSLY GIVEN>
        parameters b_k delta_k gamma_l;

    //STEADY STATE VALUE#
    parameters lambda_css css iss q_kss delta_primess sdfss kss lss u_kss
               ppi_oss wss w_oss k_wss f_wss k_pss f_pss r_kss r_nss
               yss mcss;

    //AR(1)SHOCK PROCESS INEARTIA COEFFICIENTS#8
    parameters rho_z rho_b rho_l rho_i rho_g rho_r rho_p rho_w;

//INSTALL VALUE OF PARAMETERS#16___________________________________________

    %STRUCTURAL PARAMTERS
//    betta     = 0.9975;
//    gyss      = 0.25;%2856;%data mean
//    alfa      = 0.40;%0.3970;%data mean
//    lambda_p  = 0.3;%
//    lambda_w  = 0.15;%
//    deltass   = 0.025;%0.078/4;%data mean

    mu_zss    = 1.005;
//    hab       = 0.85;
//    zetainv   = 4;
//    zeta_k    = 1.0;
//    gamma_w   = 0.33;
//    xi_w      = 0.4;

    omega     = 2;
    ppiss     = 1.002;
//    gamma_p   = 0.33;
//    xi_p      = 0.5;

//    phi_r     = 0.8;
//    phi_pi    = 1.7;
//    phi_y     = 0.08;

    %AR1 PROCESS PARAMTERS
    rho_z     = 0.5;
//    rho_b     = 0.5;
//    rho_l     = 0.5;
//    rho_i     = 0.5;
//    rho_g     = 0.5;
//    rho_r     = 0;%0.5;
//    rho_p     = 0.5;
//    rho_w     = 0.5;

    %OBSERVATION EQUATION PARAMETERS
//    lbar    =1.12;

%-----------------------------

    hab      = 0;
    betta    = 0.9975; 
    zetainv  = 4.0;
    zeta_k   = 1.0;
    rho      = 0.27;%0.6;★
    delta_z  = 0.025;
    omega_a  = 0.14;%0.80;★
    zeta_ainv= 12.0;
    alfa     = 0.40;

    lambda_a = 0.45;
    lambda_p = 0.30;%Kaihatsu and Kurozumi 0.20
    lambda_x = 0.30;%Ikeda and Kurozumi 0.75
    lambda_w = 0.15;%Kaihatsu and Kurozumi 0.20

    xi_p     = 0.5;
    gamma_p  = 0.33;
    omega_l  = 4.7;%〇
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
%@#include "EGver1_param.txt"%消す

    rho_r     = 0;%0.50;

%@#include "EGver1_param.txt"

//INSTALL STEADY STATE VALUE-----------------------------------------------
%ポイント！！：lss=1とおいて、そうなるようにgamma_lを求める！！
    %FREE PARAMETER#2------------------------------------------------------
    b_k     =mu_zss/betta-1+deltass;
    delta_k =deltass-b_k/(1+zeta_k);
    %----------------------------------------------------------------------
r_kss=b_k;
mcss=1/(1+lambda_p);
sdfss=betta/mu_zss;
r_nss=ppiss*mu_zss/betta;
wss=(1-alfa)*(1/(1+lambda_p)*(alfa/b_k)^alfa)^(1/(1-alfa));
delta_primess=b_k;

lss=1;
yss=(alfa/b_k/(1+lambda_p))^(alfa/(1-alfa));
kss=mu_zss*(alfa/b_k/(1+lambda_p))^(1/(1-alfa));
iss=(mu_zss-1+deltass)*(alfa/b_k/(1+lambda_p))^(1/(1-alfa));
css=(1-gyss)*yss-iss;
lambda_css=(mu_zss-betta*hab)/(mu_zss-hab)/css;
    %FREE PARAMETER--------------------------------------------------------
    gamma_l=1/(1+lambda_w)*lambda_css*wss/lss^omega;
    %----------------------------------------------------------------------
f_wss=lambda_css*wss*lss/(1-betta*xi_w);
k_wss=lss^omega*gamma_l/(1-betta*xi_w);
k_pss=mcss*yss/(1-betta*xi_p);
f_pss=yss/(1-betta*xi_p);
q_kss=1;
u_kss=1;
w_oss=wss;
ppi_oss=ppiss;


//MODEL STRUCTURE#25_______________________________________________________
model;
#B_k     =mu_zss/betta-1+deltass;
#Delta_k =deltass-B_k/(1+zeta_k);
#Wss=(1-alfa)*(1/(1+lambda_p)*(alfa/b_k)^alfa)^(1/(1-alfa));
#R_nss=ppiss*mu_zss/betta;
#Yss=(alfa/b_k/(1+lambda_p))^(alfa/(1-alfa));
#Kss=mu_zss*(alfa/B_k/(1+lambda_p))^(1/(1-alfa));
#Iss=(mu_zss-1+deltass)*(alfa/B_k/(1+lambda_p))^(1/(1-alfa));
#Css=(1-gyss)*Yss-Iss;
#Lambda_css=(mu_zss-betta*hab)/(mu_zss-hab)/Css;
#Gamma_l=1/(1+lambda_w)*Lambda_css*Wss/lss^omega;


    //Investment adjustment function
    #S=1/2*zetainv*(Z_Z*I/I(-1)-1)^2;
    //Differenciated Investment adjustment function
    #S_prime=1*zetainv*(Z_Z*I/I(-1)-1);
    //Differenciated Investment adjustment function lead
    #S_prime_ld=1*zetainv*(Z_Z(+1)*I(+1)/I-1);    

//1 MARGINAL UNITILITY OF CONSUMPTION
LAMBDA_C= Z_B*MU_Z/(MU_Z*C-hab*C(-1))
         -Z_B(+1)*betta*hab/(MU_Z(+1)*C(+1)-hab*C);

//2 STCHASTIC DISCOUNT FACTOR
SDF=betta*LAMBDA_C(+1)/LAMBDA_C/MU_Z(+1);

//3 EULER EQUATION
SDF=PPI(+1)/R_N;

//4 CAPITAL SUPPLY[1]:CAPITAL RENTAL COST
R_K=Q_K*DELTA_PRIME;

//5 CAPITAL SUPPLY[2]:TOBIN'S Q
Q_K=SDF*(R_K(+1)*U_K(+1)+Q_K(+1)*(1-DELTA(+1)));

//6 INVESTMENT DECISION
1= Q_K*Z_I*(1-S-S_prime*Z_Z*I/I(-1))
  +Z_I(+1)*SDF*Q_K(+1)*S_prime_ld*(Z_Z(+1)*I(+1)/I)^2*mu_zss;

//7 CAPITAL ACCUMULATION
K=(1-DELTA)*K(-1)/MU_Z+ Z_I*(1-S)*I;

//8 PRODUCTION FUNCTION
Y=(U_K*K(-1)/MU_Z)^alfa*L^(1-alfa);

//9 MARKET CLEARING
Y=C+I+gyss*Yss*Z_G;

//10 WAGE NKPC2
K_W= Z_B*Z_L*Gamma_l*L^(1+omega)
    +betta*xi_w*(PPI^gamma_w*ppiss^(1-gamma_w)/PPI(+1)*W/W(+1)/Z_Z(+1))
     ^(-(1+lambda_w)/lambda_w*(1+omega))*K_W(+1);

//11 WAGE NKPC1
F_W= LAMBDA_C*W*L
    +betta*xi_w*(PPI^gamma_w*ppiss^(1-gamma_w)/PPI(+1)*W/W(+1)/Z_Z(+1))
     ^(-1/lambda_w)*F_W(+1);

//12 WAGE NKPC3
W_O/W=((1+lambda_w*Z_W)*K_W/F_W)^(lambda_w/(lambda_w+omega+lambda_w*omega));

//13 GENERAL WAGE TRANSITION
W^(-1/lambda_w)=xi_w*(PPI(-1)^gamma_w*ppiss^(1-gamma_w)/PPI*W(-1)/Z_Z)^(-1/lambda_w)
                +(1-xi_w)*W_O^(-1/lambda_w);

//14 LABOR DEMAND
L=(1-alfa)*MC*Y/W;

//15 CAPITAL DEMAND
U_K*K(-1)=alfa*MC*Y/R_K*MU_Z;

//16 NKPC1
K_P=MC*Y+xi_p*SDF*(PPI^gamma_p*ppiss^(1-gamma_p)/PPI(+1))^(-(1+lambda_p)/lambda_p)*K_P(+1)*MU_Z(+1);

//17 NKPC2
F_P=   Y+xi_p*SDF*(PPI^gamma_p*ppiss^(1-gamma_p)/PPI(+1))^(-1/lambda_p)*F_P(+1)*MU_Z(+1);

//18 NKPC3
PPI_O/PPI=(1+lambda_p*Z_P)*K_P/F_P;

//19 GENERAL INFLATION RATE
PPI^(-1/lambda_p)= xi_p*(PPI(-1)^gamma_p*ppiss^(1-gamma_p))^(-1/lambda_p)
                  +(1-xi_p)*PPI_O^(-1/lambda_p);

//20 TAYLOR RULE
log(R_N)= phi_r*log(R_N(-1))
         +(1-phi_r)*(log(R_nss)+phi_pi*log(PPI/ppiss)+phi_y*log(Y/Yss))
         +log(Z_R);

//21 CAPITAL DEPRECIATION FUNCTION
DELTA=Delta_k+B_k*U_K^(1+zeta_k)/(1+zeta_k);

//22 DEFFRENCIATED CAPITAL DEPRECIATION FUNCTION
DELTA_PRIME=B_k*U_K^zeta_k;

//23 TREND COMPOSITE TECHNOLOGY
MU_Z=mu_zss*Z_Z;

    %AR1 SHOCK PROCESS-----------------------------------------------------
    
    //24[1] PERMANENT COMPOSITE TECHNOLOGY SHOCK
    log(Z_Z) = rho_z*log(Z_Z(-1))+EPS_Z;
    
    //25[2] PREFERENCE SHOCK
    log(Z_B)    = rho_b   *log(Z_B(-1))+EPS_B;
    
    //26[3] LABOR DISUTILITY SHOCK
    log(Z_L)    = rho_l   *log(Z_L(-1))+EPS_L;
    
    //27[4] TEMPORARY INVESTMENT TECHNOLOGY SHOCK
    log(Z_I) =    rho_i   *log(Z_I(-1))+EPS_I;
    
    //28[5] EXOGENOUS SPENDING SHOCK
    log(Z_G) =    rho_g   *log(Z_G(-1))+EPS_G;
    
    //29[6] MONETARY POLICY SHOCK
    log(Z_R) =    rho_r   *log(Z_R(-1))+EPS_R;

    //30[7] MONETARY POLICY SHOCK
    log(Z_P) =    rho_p   *log(Z_P(-1))+EPS_P;

    //31[8] MONETARY POLICY SHOCK
    log(Z_W) =    rho_w   *log(Z_W(-1))+EPS_W;

    %OBSERVATION EQUATIONS-------------------------------------------------
    //33 GDP GROWTH RATE
    DY_OBS    = (MU_Z*Y/Y(-1));

    //34 CONSUMPTION GROWTH RATE
    DC_OBS    = (MU_Z*C/C(-1));
   
    //35 INVESTMENT GROWTH RATE
    DI_OBS    = (MU_Z*I/I(-1));

    //36 NET GROWTH RATE OF REAL WAGE INDEX
    DW_OBS    = (MU_Z*W/W(-1));

    //37 NOMINAL INTEREST RATE
    R_N_OBS    = R_N;

    //38 INFLATION RATE
    PI_OBS    = PPI;

    //39 TOTAL LABOR SUPPLY
    L_OBS = lbar*L;

end;

//MODEL CHECK______________________________________________________________
resid(1);
check;
steady;
model_diagnostics;

//SHOCKS___________________________________________________________________
//shocks;
//var EPS_Z;stderr 1;
//var EPS_B   ;stderr 1;
//var EPS_L   ;stderr 1;
//var EPS_I   ;stderr 1;
//var EPS_G   ;stderr 1;
//var EPS_R   ;stderr 1;
//var EPS_P   ;stderr 1;
//var EPS_W   ;stderr 1;
//end;

//SIMULATION_______________________________________________________________
%stoch_simul(irf=40,pruning,loglinear,order=1,graph_format = fig,nodisplay)
%Y   C   I 
%R_K R_N W 
%L   PPI MU_Z;

//ESTIMATION_______________________________________________________________
    //DEFINE PRIOR DISTRIBUTION#-----------------------------------------
    estimated_params;
        //STRUCTURAL PARAMETERS#
       %hab       , ,     ,     ,beta_pdf ,0.700,0.10;%EGモデルとの比較のため
        omega     ,2,     ,     ,gamma_pdf,2.0  ,0.75;%Sugo-Ueda(2008)
        zeta_k    , ,     ,     ,gamma_pdf,1.0  ,0.1 ;
        zetainv   , ,     ,     ,gamma_pdf,4.000,1.5 ;%Sugo-Ueda(2008)
        lbar      , ,     ,     ,gamma_pdf,1.115,0.005;%data-mean
 
        ppiss     , ,     ,     ,gamma_pdf,1.003 ,0.001;%
       %mu_zss    , ,     ,     ,gamma_pdf,1.005 ,0.001;%
        gamma_p   , ,     ,     ,beta_pdf ,0.400 ,0.150;%Sugo-Ueda(2008)
        gamma_w   , ,     ,     ,beta_pdf ,0.400 ,0.150;%Sugo-Ueda(2008)
        xi_p      , ,     ,     ,beta_pdf ,0.375 ,0.100;%Kaihatsu-Kurozumi(2014)
        xi_w      , ,     ,     ,beta_pdf ,0.375 ,0.100;%Kaihatsu-Kurozumi(2014)

        phi_r    ,    ,     ,   ,beta_pdf ,0.800 ,0.100 ;%Iiboshi et al.(2006)
        phi_pi   ,    ,     ,   ,gamma_pdf,1.700 ,0.100 ;%Iiboshi et al.(2006)
        phi_y    ,    ,     ,   ,gamma_pdf,0.125 ,0.050 ;%Iiboshi et al.(2006)

        //SHOCK INERTIA COEFFICIENTS#11
%        rho_b    ,0.5,  , ,beta_pdf,0.5,0.1  ;%Kaihatsu-Kurozumi(2014)
        rho_b     , ,     ,     ,beta_pdf ,0.950,0.01,0,0.999;
        rho_l    ,0.5,  , ,beta_pdf,0.5,0.1  ;%Kaihatsu-Kurozumi(2014)
        rho_i    ,0.5,  , ,beta_pdf,0.5,0.2  ;%Kaihatsu-Kurozumi(2014)
        rho_g    ,0.5,  , ,beta_pdf,0.5,0.2  ;%Kaihatsu-Kurozumi(2014)
       %rho_r    ,0.5,  , ,beta_pdf,0.5,0.2  ;%Kaihatsu-Kurozumi(2014) 
        rho_z    ,0.5,  , ,beta_pdf,0.5,0.1  ;%Kaihatsu-Kurozumi(2014)
        rho_p    ,0.5,  , ,beta_pdf,0.5,0.1  ;%Kaihatsu-Kurozumi(2014) 
        rho_w    ,0.5,  , ,beta_pdf,0.5,0.1  ;%Kaihatsu-Kurozumi(2014)  
        
        //STANDARD ERRORS#11
        stderr EPS_B        ,0.1  ,,,inv_gamma_pdf, 0.5,inf;
        stderr EPS_L        ,1  ,,,inv_gamma_pdf, 2,inf;
        stderr EPS_I    ,0.5,,,inv_gamma_pdf,0.5,inf;%Kaihatsu-Kurozumi(2014)
        stderr EPS_G    ,0.5,,,inv_gamma_pdf,0.5,inf;%Kaihatsu-Kurozumi(2014)
        stderr EPS_R    ,0.5,,,inv_gamma_pdf,0.5,inf;%Kaihatsu-Kurozumi(2014)
        stderr EPS_Z    ,0.5,,,inv_gamma_pdf,0.5,inf;%Kaihatsu-Kurozumi(2014)
        stderr EPS_P    ,0.5,,,inv_gamma_pdf,0.5,inf;%Kaihatsu-Kurozumi(2014)
        stderr EPS_W    ,0.5,,,inv_gamma_pdf,0.5,inf;%Kaihatsu-Kurozumi(2014)   
   end;   

    //REDEFINE OBSERBED VARIABLES#8----------------------------------------
    varobs DY_OBS DC_OBS DI_OBS DW_OBS PI_OBS R_N_OBS L_OBS;

    //ESTIMATION-----------------------------------------------------------
    estimation(
        loglinear,
        prior_trunc=0,
        datafile='dataset_IK_log.xlsx',
        xls_sheet=Sheet6,     
        xls_range =B1:H136,
        mode_file = 'STANDARDr1_mode.mat',
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
        )
        Y   C   I 
        R_K R_N W 
        L   PPI MU_Z;

//HISTORICAL DECOMPOSITION_________________________________________________
shock_decomposition(parameter_set=posterior_mean)
DY_OBS DC_OBS DI_OBS DW_OBS PI_OBS R_N_OBS L_OBS MU_Z Y C I;

//WRITING HISTORICAL DECOMPOSITION RESULT__________________________________
name={'Technology Progress',...
      'Preference',...
      'Labor Disutility',...
      'Investment Adjustment Cost',...
      'Exogenous Spending',...
      'Monetary Policy',...
      'Price Markup',...
      'Wage Markup',...
      'Initial Value',...
      'Actual Value'};

box=[0 0 0 0 0 0 0 0 0 0];

%dy1------------------------------------------------------------------------
xlswrite('hist_dy_obs.xlsx',[box;reshape(oo_.shock_decomposition(32,:,:),10,135)']);
xlswrite('hist_dy_obs.xlsx',[name]);

%dc2
xlswrite('hist_dc_obs.xlsx',[box;reshape(oo_.shock_decomposition(33,:,:),10,135)']);
xlswrite('hist_dc_obs.xlsx',[name]);

%di3
xlswrite('hist_di_obs.xlsx',[box;reshape(oo_.shock_decomposition(34,:,:),10,135)']);
xlswrite('hist_di_obs.xlsx',[name]);

%dw4
xlswrite('hist_dw_obs.xlsx',[box;reshape(oo_.shock_decomposition(35,:,:),10,135)']);
xlswrite('hist_dw_obs.xlsx',[name]);

%r_n5
xlswrite('hist_r_n_obs.xlsx',[box;reshape(oo_.shock_decomposition(36,:,:),10,135)']);
xlswrite('hist_r_n_obs.xlsx',[name]);

%pi6
xlswrite('hist_pi_obs.xlsx',[box;reshape(oo_.shock_decomposition(37,:,:),10,135)']);
xlswrite('hist_pi_obs.xlsx',[name]);

%l7
xlswrite('hist_l_obs.xlsx',[box;reshape(oo_.shock_decomposition(38,:,:),10,135)']);
xlswrite('hist_l_obs.xlsx',[name]);

%y
xlswrite('hist_y_obs.xlsx',[box;reshape(oo_.shock_decomposition(22,:,:),10,135)']);
xlswrite('hist_y_obs.xlsx',[name]);

%c
xlswrite('hist_c_obs.xlsx',[box;reshape(oo_.shock_decomposition(3,:,:),10,135)']);
xlswrite('hist_c_obs.xlsx',[name]);

%i
xlswrite('hist_i_obs.xlsx',[box;reshape(oo_.shock_decomposition(4,:,:),10,135)']);
xlswrite('hist_i_obs.xlsx',[name]);

%mu_z
xlswrite('hist_mu_z_obs.xlsx',[box;reshape(oo_.shock_decomposition(2,:,:),10,135)']);
xlswrite('hist_mu_z_obs.xlsx',[name]);


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
var EPS_Z = 0.1^2;
end;

//IRFs_____________________________________________________________________
stoch_simul(irf=200,loglinear,order=1,graph_format = fig,nodisplay,
            spectral_density)
        Y   C   I 
        R_K R_N W 
        L   PPI MU_Z

        DY_OBS DC_OBS DI_OBS
        DW_OBS PI_OBS R_N_OBS
        L_OBS;
%B-------------------------------------------------------------------------
    name1={'Y_EPS_B',...
          'C_EPS_B',...
          'I_EPS_B',...
          'R_K_EPS_B',...
          'R_N_EPS_B',...
          'W_EPS_B',...
          'L_EPS_B',...
          'PI_EPS_B',...
          'MU_Z_EPS_B'};
    box1=[0 0 0 0 0 0 0 0 0];
    xlswrite('IRF_EPS_B_nonfiltered.xlsx',[box1;box1; oo_.irfs.Y_EPS_B' oo_.irfs.C_EPS_B' ....
              oo_.irfs.I_EPS_B' oo_.irfs.R_K_EPS_B' oo_.irfs.R_N_EPS_B' oo_.irfs.W_EPS_B' oo_.irfs.L_EPS_B'...
              oo_.irfs.PPI_EPS_B' oo_.irfs.MU_Z_EPS_B'] );
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
           'MU_Z_EPS_L'};
    box1=[0 0 0 0 0 0 0 0 0];
    xlswrite('IRF_EPS_L_nonfiltered.xlsx',[box1;box1; oo_.irfs.Y_EPS_L' oo_.irfs.C_EPS_L' ....
              oo_.irfs.I_EPS_L' oo_.irfs.R_K_EPS_L' oo_.irfs.R_N_EPS_L' oo_.irfs.W_EPS_L' oo_.irfs.L_EPS_L'...
              oo_.irfs.PPI_EPS_L' oo_.irfs.MU_Z_EPS_L'] );
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
          'MU_Z_EPS_I'};
    box1=[0 0 0 0 0 0 0 0 0];
    xlswrite('IRF_EPS_I_nonfiltered.xlsx',[box1;box1; oo_.irfs.Y_EPS_I' oo_.irfs.C_EPS_I' ....
              oo_.irfs.I_EPS_I' oo_.irfs.R_K_EPS_I' oo_.irfs.R_N_EPS_I' oo_.irfs.W_EPS_I' oo_.irfs.L_EPS_I'...
              oo_.irfs.PPI_EPS_I' oo_.irfs.MU_Z_EPS_I'] );
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
           'MU_Z_EPS_G'};
    box1=[0 0 0 0 0 0 0 0 0];
    xlswrite('IRF_EPS_G_nonfiltered.xlsx',[box1;box1; oo_.irfs.Y_EPS_G' oo_.irfs.C_EPS_G' ....
              oo_.irfs.I_EPS_G' oo_.irfs.R_K_EPS_G' oo_.irfs.R_N_EPS_G' oo_.irfs.W_EPS_G' oo_.irfs.L_EPS_G'...
              oo_.irfs.PPI_EPS_G' oo_.irfs.MU_Z_EPS_G'] );
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
           'MU_Z_EPS_R'};
    box1=[0 0 0 0 0 0 0 0 0];
    xlswrite('IRF_EPS_R_nonfiltered.xlsx',[box1;box1; oo_.irfs.Y_EPS_R' oo_.irfs.C_EPS_R' ....
              oo_.irfs.I_EPS_R' oo_.irfs.R_K_EPS_R' oo_.irfs.R_N_EPS_R' oo_.irfs.W_EPS_R' oo_.irfs.L_EPS_R'...
              oo_.irfs.PPI_EPS_R' oo_.irfs.MU_Z_EPS_R'] );
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
           'MU_Z_EPS_P'};
    box1=[0 0 0 0 0 0 0 0 0];
    xlswrite('IRF_EPS_P_nonfiltered.xlsx',[box1;box1; oo_.irfs.Y_EPS_P' oo_.irfs.C_EPS_P' ....
              oo_.irfs.I_EPS_P' oo_.irfs.R_K_EPS_P' oo_.irfs.R_N_EPS_P' oo_.irfs.W_EPS_P' oo_.irfs.L_EPS_P'...
              oo_.irfs.PPI_EPS_P' oo_.irfs.MU_Z_EPS_P'] );
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
           'MU_Z_EPS_W'};
    box1=[0 0 0 0 0 0 0 0 0];
    xlswrite('IRF_EPS_W_nonfiltered.xlsx',[box1;box1; oo_.irfs.Y_EPS_W' oo_.irfs.C_EPS_W' ....
              oo_.irfs.I_EPS_W' oo_.irfs.R_K_EPS_W' oo_.irfs.R_N_EPS_W' oo_.irfs.W_EPS_W' oo_.irfs.L_EPS_W'...
              oo_.irfs.PPI_EPS_W' oo_.irfs.MU_Z_EPS_W'] );
    xlswrite('IRF_EPS_W_nonfiltered.xlsx',[name7]);
%LAMBDA----------------------------------------------------------
    name8={'Y_EPS_Z',...
           'C_EPS_Z',...
           'I_EPS_Z',...
           'R_K_EPS_Z',...
           'R_N_EPS_Z',...
           'W_EPS_Z',...
           'L_EPS_Z',...
           'PI_EPS_Z',...
           'MU_Z_EPS_Z'};
    box1=[0 0 0 0 0 0 0 0 0];
    xlswrite('IRF_EPS_Z_nonfiltered.xlsx',[box1;box1; oo_.irfs.Y_EPS_Z' oo_.irfs.C_EPS_Z' ....
              oo_.irfs.I_EPS_Z' oo_.irfs.R_K_EPS_Z' oo_.irfs.R_N_EPS_Z' oo_.irfs.W_EPS_Z' oo_.irfs.L_EPS_Z'...
              oo_.irfs.PPI_EPS_Z' oo_.irfs.MU_Z_EPS_Z'] );
    xlswrite('IRF_EPS_Z_nonfiltered.xlsx',[name8]);

//IRFs[2,6]_______________________________________________________________
stoch_simul(irf=200,loglinear,order=1,graph_format = fig,nodisplay,
            spectral_density,bandpass_filter =[2,6])
        Y   C   I 
        R_K R_N W 
        L   PPI MU_Z

        DY_OBS DC_OBS DI_OBS
        DW_OBS PI_OBS R_N_OBS
        L_OBS;
        %Preference----------------------------------------------------------------
        xlswrite('IRF_EPS_B_filtered_2-6.xlsx',[box1;box1; oo_.irfs.Y_EPS_B' oo_.irfs.C_EPS_B' ....
                  oo_.irfs.I_EPS_B' oo_.irfs.R_K_EPS_B' oo_.irfs.R_N_EPS_B' oo_.irfs.W_EPS_B' oo_.irfs.L_EPS_B'...
                  oo_.irfs.PPI_EPS_B' oo_.irfs.MU_Z_EPS_B'] );
            xlswrite('IRF_EPS_B_filtered_2-6.xlsx',[name1]);

        %Labor Disutility----------------------------------------------------------
        xlswrite('IRF_EPS_L_filtered_2-6.xlsx',[box1;box1; oo_.irfs.Y_EPS_L' oo_.irfs.C_EPS_L' ....
                  oo_.irfs.I_EPS_L' oo_.irfs.R_K_EPS_L' oo_.irfs.R_N_EPS_L' oo_.irfs.W_EPS_L' oo_.irfs.L_EPS_L'...
                  oo_.irfs.PPI_EPS_L' oo_.irfs.MU_Z_EPS_L'] );
            xlswrite('IRF_EPS_L_filtered_2-6.xlsx',[name2]);

        %Investment Efficiency-----------------------------------------------------
        xlswrite('IRF_EPS_I_filtered_2-6.xlsx',[box1;box1; oo_.irfs.Y_EPS_I' oo_.irfs.C_EPS_I' ....
                  oo_.irfs.I_EPS_I' oo_.irfs.R_K_EPS_I' oo_.irfs.R_N_EPS_I' oo_.irfs.W_EPS_I' oo_.irfs.L_EPS_I'...
                  oo_.irfs.PPI_EPS_I' oo_.irfs.MU_Z_EPS_B'] );
            xlswrite('IRF_EPS_I_filtered_2-6.xlsx',[name3]);
        %G----------------------------------------------------------
        xlswrite('IRF_EPS_G_filtered_2-6.xlsx',[box1;box1; oo_.irfs.Y_EPS_G' oo_.irfs.C_EPS_G' ....
                  oo_.irfs.I_EPS_G' oo_.irfs.R_K_EPS_G' oo_.irfs.R_N_EPS_G' oo_.irfs.W_EPS_G' oo_.irfs.L_EPS_G'...
                  oo_.irfs.PPI_EPS_G' oo_.irfs.MU_Z_EPS_G'] );
            xlswrite('IRF_EPS_G_filtered_2-6.xlsx',[name4]);
        %R----------------------------------------------------------
        xlswrite('IRF_EPS_R_filtered_2-6.xlsx',[box1;box1; oo_.irfs.Y_EPS_R' oo_.irfs.C_EPS_R' ....
                  oo_.irfs.I_EPS_R' oo_.irfs.R_K_EPS_R' oo_.irfs.R_N_EPS_R' oo_.irfs.W_EPS_R' oo_.irfs.L_EPS_R'...
                  oo_.irfs.PPI_EPS_R' oo_.irfs.MU_Z_EPS_R'] );
            xlswrite('IRF_EPS_R_filtered_2-6.xlsx',[name5]);
        %P----------------------------------------------------------
        xlswrite('IRF_EPS_P_filtered_2-6.xlsx',[box1;box1; oo_.irfs.Y_EPS_P' oo_.irfs.C_EPS_P' ....
                  oo_.irfs.I_EPS_P' oo_.irfs.R_K_EPS_P' oo_.irfs.R_N_EPS_P' oo_.irfs.W_EPS_P' oo_.irfs.L_EPS_P'...
                  oo_.irfs.PPI_EPS_P' oo_.irfs.MU_Z_EPS_P'] );
            xlswrite('IRF_EPS_P_filtered_2-6.xlsx',[name6]);
        %W----------------------------------------------------------
        xlswrite('IRF_EPS_W_filtered_2-6.xlsx',[box1;box1; oo_.irfs.Y_EPS_W' oo_.irfs.C_EPS_W' ....
                  oo_.irfs.I_EPS_W' oo_.irfs.R_K_EPS_W' oo_.irfs.R_N_EPS_W' oo_.irfs.W_EPS_W' oo_.irfs.L_EPS_W'...
                  oo_.irfs.PPI_EPS_W' oo_.irfs.MU_Z_EPS_W'] );
            xlswrite('IRF_EPS_W_filtered_2-6.xlsx',[name7]);
        %LAMBDA----------------------------------------------------------
        xlswrite('IRF_EPS_Z_filtered_2-6.xlsx',[box1;box1; oo_.irfs.Y_EPS_Z' oo_.irfs.C_EPS_Z' ....
                  oo_.irfs.I_EPS_Z' oo_.irfs.R_K_EPS_Z' oo_.irfs.R_N_EPS_Z' oo_.irfs.W_EPS_Z' oo_.irfs.L_EPS_Z'...
                  oo_.irfs.PPI_EPS_Z' oo_.irfs.MU_Z_EPS_Z'] );
            xlswrite('IRF_EPS_Z_filtered_2-6.xlsx',[name8]);

//IRFs[6,32]_______________________________________________________________
stoch_simul(irf=200,loglinear,order=1,graph_format = fig,nodisplay,
            spectral_density,bandpass_filter =[6,32])
        Y   C   I 
        R_K R_N W 
        L   PPI MU_Z

        DY_OBS DC_OBS DI_OBS
        DW_OBS PI_OBS R_N_OBS
        L_OBS;
        %Preference----------------------------------------------------------------
        xlswrite('IRF_EPS_B_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_B' oo_.irfs.C_EPS_B' ....
                  oo_.irfs.I_EPS_B' oo_.irfs.R_K_EPS_B' oo_.irfs.R_N_EPS_B' oo_.irfs.W_EPS_B' oo_.irfs.L_EPS_B'...
                  oo_.irfs.PPI_EPS_B' oo_.irfs.MU_Z_EPS_B'] );
            xlswrite('IRF_EPS_B_filtered_6-32.xlsx',[name1]);

        %Labor Disutility----------------------------------------------------------
        xlswrite('IRF_EPS_L_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_L' oo_.irfs.C_EPS_L' ....
                  oo_.irfs.I_EPS_L' oo_.irfs.R_K_EPS_L' oo_.irfs.R_N_EPS_L' oo_.irfs.W_EPS_L' oo_.irfs.L_EPS_L'...
                  oo_.irfs.PPI_EPS_L' oo_.irfs.MU_Z_EPS_L'] );
            xlswrite('IRF_EPS_L_filtered_6-32.xlsx',[name2]);

        %Investment Efficiency-----------------------------------------------------
        xlswrite('IRF_EPS_I_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_I' oo_.irfs.C_EPS_I' ....
                  oo_.irfs.I_EPS_I' oo_.irfs.R_K_EPS_I' oo_.irfs.R_N_EPS_I' oo_.irfs.W_EPS_I' oo_.irfs.L_EPS_I'...
                  oo_.irfs.PPI_EPS_I' oo_.irfs.MU_Z_EPS_B'] );
            xlswrite('IRF_EPS_I_filtered_6-32.xlsx',[name3]);
        %G----------------------------------------------------------
        xlswrite('IRF_EPS_G_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_G' oo_.irfs.C_EPS_G' ....
                  oo_.irfs.I_EPS_G' oo_.irfs.R_K_EPS_G' oo_.irfs.R_N_EPS_G' oo_.irfs.W_EPS_G' oo_.irfs.L_EPS_G'...
                  oo_.irfs.PPI_EPS_G' oo_.irfs.MU_Z_EPS_G'] );
            xlswrite('IRF_EPS_G_filtered_6-32.xlsx',[name4]);
        %R----------------------------------------------------------
        xlswrite('IRF_EPS_R_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_R' oo_.irfs.C_EPS_R' ....
                  oo_.irfs.I_EPS_R' oo_.irfs.R_K_EPS_R' oo_.irfs.R_N_EPS_R' oo_.irfs.W_EPS_R' oo_.irfs.L_EPS_R'...
                  oo_.irfs.PPI_EPS_R' oo_.irfs.MU_Z_EPS_R'] );
            xlswrite('IRF_EPS_R_filtered_6-32.xlsx',[name5]);
        %P----------------------------------------------------------
        xlswrite('IRF_EPS_P_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_P' oo_.irfs.C_EPS_P' ....
                  oo_.irfs.I_EPS_P' oo_.irfs.R_K_EPS_P' oo_.irfs.R_N_EPS_P' oo_.irfs.W_EPS_P' oo_.irfs.L_EPS_P'...
                  oo_.irfs.PPI_EPS_P' oo_.irfs.MU_Z_EPS_P'] );
            xlswrite('IRF_EPS_P_filtered_6-32.xlsx',[name6]);
        %W----------------------------------------------------------
        xlswrite('IRF_EPS_W_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_W' oo_.irfs.C_EPS_W' ....
                  oo_.irfs.I_EPS_W' oo_.irfs.R_K_EPS_W' oo_.irfs.R_N_EPS_W' oo_.irfs.W_EPS_W' oo_.irfs.L_EPS_W'...
                  oo_.irfs.PPI_EPS_W' oo_.irfs.MU_Z_EPS_W'] );
            xlswrite('IRF_EPS_W_filtered_6-32.xlsx',[name7]);
        %LAMBDA----------------------------------------------------------
        xlswrite('IRF_EPS_Z_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_Z' oo_.irfs.C_EPS_Z' ....
                  oo_.irfs.I_EPS_Z' oo_.irfs.R_K_EPS_Z' oo_.irfs.R_N_EPS_Z' oo_.irfs.W_EPS_Z' oo_.irfs.L_EPS_Z'...
                  oo_.irfs.PPI_EPS_Z' oo_.irfs.MU_Z_EPS_Z'] );
            xlswrite('IRF_EPS_Z_filtered_6-32.xlsx',[name8]);

//IRFs[8,32]_______________________________________________________________
stoch_simul(irf=200,loglinear,order=1,graph_format = fig,nodisplay,
            spectral_density,bandpass_filter =[8,32])
        Y   C   I 
        R_K R_N W 
        L   PPI MU_Z

        DY_OBS DC_OBS DI_OBS
        DW_OBS PI_OBS R_N_OBS
        L_OBS;
        %Preference----------------------------------------------------------------
        xlswrite('IRF_EPS_B_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_B' oo_.irfs.C_EPS_B' ....
                  oo_.irfs.I_EPS_B' oo_.irfs.R_K_EPS_B' oo_.irfs.R_N_EPS_B' oo_.irfs.W_EPS_B' oo_.irfs.L_EPS_B'...
                  oo_.irfs.PPI_EPS_B' oo_.irfs.MU_Z_EPS_B'] );
            xlswrite('IRF_EPS_B_filtered_8-32.xlsx',[name1]);

        %Labor Disutility----------------------------------------------------------
        xlswrite('IRF_EPS_L_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_L' oo_.irfs.C_EPS_L' ....
                  oo_.irfs.I_EPS_L' oo_.irfs.R_K_EPS_L' oo_.irfs.R_N_EPS_L' oo_.irfs.W_EPS_L' oo_.irfs.L_EPS_L'...
                  oo_.irfs.PPI_EPS_L' oo_.irfs.MU_Z_EPS_L'] );
            xlswrite('IRF_EPS_L_filtered_8-32.xlsx',[name2]);

        %Investment Efficiency-----------------------------------------------------
        xlswrite('IRF_EPS_I_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_I' oo_.irfs.C_EPS_I' ....
                  oo_.irfs.I_EPS_I' oo_.irfs.R_K_EPS_I' oo_.irfs.R_N_EPS_I' oo_.irfs.W_EPS_I' oo_.irfs.L_EPS_I'...
                  oo_.irfs.PPI_EPS_I' oo_.irfs.MU_Z_EPS_B'] );
            xlswrite('IRF_EPS_I_filtered_8-32.xlsx',[name3]);
        %G----------------------------------------------------------
        xlswrite('IRF_EPS_G_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_G' oo_.irfs.C_EPS_G' ....
                  oo_.irfs.I_EPS_G' oo_.irfs.R_K_EPS_G' oo_.irfs.R_N_EPS_G' oo_.irfs.W_EPS_G' oo_.irfs.L_EPS_G'...
                  oo_.irfs.PPI_EPS_G' oo_.irfs.MU_Z_EPS_G'] );
            xlswrite('IRF_EPS_G_filtered_8-32.xlsx',[name4]);
        %R----------------------------------------------------------
        xlswrite('IRF_EPS_R_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_R' oo_.irfs.C_EPS_R' ....
                  oo_.irfs.I_EPS_R' oo_.irfs.R_K_EPS_R' oo_.irfs.R_N_EPS_R' oo_.irfs.W_EPS_R' oo_.irfs.L_EPS_R'...
                  oo_.irfs.PPI_EPS_R' oo_.irfs.MU_Z_EPS_R'] );
            xlswrite('IRF_EPS_R_filtered_8-32.xlsx',[name5]);
        %P----------------------------------------------------------
        xlswrite('IRF_EPS_P_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_P' oo_.irfs.C_EPS_P' ....
                  oo_.irfs.I_EPS_P' oo_.irfs.R_K_EPS_P' oo_.irfs.R_N_EPS_P' oo_.irfs.W_EPS_P' oo_.irfs.L_EPS_P'...
                  oo_.irfs.PPI_EPS_P' oo_.irfs.MU_Z_EPS_P'] );
            xlswrite('IRF_EPS_P_filtered_8-32.xlsx',[name6]);
        %W----------------------------------------------------------
        xlswrite('IRF_EPS_W_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_W' oo_.irfs.C_EPS_W' ....
                  oo_.irfs.I_EPS_W' oo_.irfs.R_K_EPS_W' oo_.irfs.R_N_EPS_W' oo_.irfs.W_EPS_W' oo_.irfs.L_EPS_W'...
                  oo_.irfs.PPI_EPS_W' oo_.irfs.MU_Z_EPS_W'] );
            xlswrite('IRF_EPS_W_filtered_8-32.xlsx',[name7]);
        %LAMBDA----------------------------------------------------------
        xlswrite('IRF_EPS_Z_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_Z' oo_.irfs.C_EPS_Z' ....
                  oo_.irfs.I_EPS_Z' oo_.irfs.R_K_EPS_Z' oo_.irfs.R_N_EPS_Z' oo_.irfs.W_EPS_Z' oo_.irfs.L_EPS_Z'...
                  oo_.irfs.PPI_EPS_Z' oo_.irfs.MU_Z_EPS_Z'] );
            xlswrite('IRF_EPS_Z_filtered_8-32.xlsx',[name8]);

//IRFs[32,inf]_______________________________________________________________
stoch_simul(irf=200,loglinear,order=1,graph_format = fig,nodisplay,
            spectral_density,bandpass_filter =[32,9999])
        Y   C   I 
        R_K R_N W 
        L   PPI MU_Z

        DY_OBS DC_OBS DI_OBS
        DW_OBS PI_OBS R_N_OBS
        L_OBS;
        %Preference----------------------------------------------------------------
        xlswrite('IRF_EPS_B_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_B' oo_.irfs.C_EPS_B' ....
                  oo_.irfs.I_EPS_B' oo_.irfs.R_K_EPS_B' oo_.irfs.R_N_EPS_B' oo_.irfs.W_EPS_B' oo_.irfs.L_EPS_B'...
                  oo_.irfs.PPI_EPS_B' oo_.irfs.MU_Z_EPS_B'] );
            xlswrite('IRF_EPS_B_filtered_32-.xlsx',[name1]);

        %Labor Disutility----------------------------------------------------------
        xlswrite('IRF_EPS_L_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_L' oo_.irfs.C_EPS_L' ....
                  oo_.irfs.I_EPS_L' oo_.irfs.R_K_EPS_L' oo_.irfs.R_N_EPS_L' oo_.irfs.W_EPS_L' oo_.irfs.L_EPS_L'...
                  oo_.irfs.PPI_EPS_L' oo_.irfs.MU_Z_EPS_L'] );
            xlswrite('IRF_EPS_L_filtered_32-.xlsx',[name2]);

        %Investment Efficiency-----------------------------------------------------
        xlswrite('IRF_EPS_I_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_I' oo_.irfs.C_EPS_I' ....
                  oo_.irfs.I_EPS_I' oo_.irfs.R_K_EPS_I' oo_.irfs.R_N_EPS_I' oo_.irfs.W_EPS_I' oo_.irfs.L_EPS_I'...
                  oo_.irfs.PPI_EPS_I' oo_.irfs.MU_Z_EPS_B'] );
            xlswrite('IRF_EPS_I_filtered_32-.xlsx',[name3]);
        %G----------------------------------------------------------
        xlswrite('IRF_EPS_G_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_G' oo_.irfs.C_EPS_G' ....
                  oo_.irfs.I_EPS_G' oo_.irfs.R_K_EPS_G' oo_.irfs.R_N_EPS_G' oo_.irfs.W_EPS_G' oo_.irfs.L_EPS_G'...
                  oo_.irfs.PPI_EPS_G' oo_.irfs.MU_Z_EPS_G'] );
            xlswrite('IRF_EPS_G_filtered_32-.xlsx',[name4]);
        %R----------------------------------------------------------
        xlswrite('IRF_EPS_R_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_R' oo_.irfs.C_EPS_R' ....
                  oo_.irfs.I_EPS_R' oo_.irfs.R_K_EPS_R' oo_.irfs.R_N_EPS_R' oo_.irfs.W_EPS_R' oo_.irfs.L_EPS_R'...
                  oo_.irfs.PPI_EPS_R' oo_.irfs.MU_Z_EPS_R'] );
            xlswrite('IRF_EPS_R_filtered_32-.xlsx',[name5]);
        %P----------------------------------------------------------
        xlswrite('IRF_EPS_P_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_P' oo_.irfs.C_EPS_P' ....
                  oo_.irfs.I_EPS_P' oo_.irfs.R_K_EPS_P' oo_.irfs.R_N_EPS_P' oo_.irfs.W_EPS_P' oo_.irfs.L_EPS_P'...
                  oo_.irfs.PPI_EPS_P' oo_.irfs.MU_Z_EPS_P'] );
            xlswrite('IRF_EPS_P_filtered_32-.xlsx',[name6]);
        %W----------------------------------------------------------
        xlswrite('IRF_EPS_W_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_W' oo_.irfs.C_EPS_W' ....
                  oo_.irfs.I_EPS_W' oo_.irfs.R_K_EPS_W' oo_.irfs.R_N_EPS_W' oo_.irfs.W_EPS_W' oo_.irfs.L_EPS_W'...
                  oo_.irfs.PPI_EPS_W' oo_.irfs.MU_Z_EPS_W'] );
            xlswrite('IRF_EPS_W_filtered_32-.xlsx',[name7]);
        %LAMBDA----------------------------------------------------------
        xlswrite('IRF_EPS_Z_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_Z' oo_.irfs.C_EPS_Z' ....
                  oo_.irfs.I_EPS_Z' oo_.irfs.R_K_EPS_Z' oo_.irfs.R_N_EPS_Z' oo_.irfs.W_EPS_Z' oo_.irfs.L_EPS_Z'...
                  oo_.irfs.PPI_EPS_Z' oo_.irfs.MU_Z_EPS_Z'] );
            xlswrite('IRF_EPS_Z_filtered_32-.xlsx',[name8]);