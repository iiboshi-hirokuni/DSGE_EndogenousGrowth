%==========================================================================
%170128 dynare[filename_steadystate.m] added apprehension memo to m-file
%==========================================================================
function [ys,check] = EGver1_steadystate(ys,exo)

global M_ 

% パラメータ値の代入
NumberOfParameters = M_.param_nbr;
for ii = 1:NumberOfParameters
  paramname = deblank(M_.param_names(ii,:));
  eval([ paramname ' = M_.params(' int2str(ii) ');']);
end

check = 0;

options=optimset('Display','none');

%=====INVOKE FUNCTION TO GET FREE PARAMETER VALUE==========================

%disp('stop in before args1')
args1 = [hab betta zetainv zeta_k rho delta_z omega_a zeta_ainv alfa...
         lambda_a lambda_x xi_p lambda_p gamma_p omega_l xi_w lambda_w...
         gamma_w phi_r phi_pi phi_y gyss i_dyss...
         lss mu_ass u_kss q_kss deltass lambdass piss...
         lbar...
         ];%alpha, betaは関数名と同じで干渉するので避ける！！！
      
 f_EGver1_a =  @(x) f_EGver1(x,args1);

options = optimset('Display','none','TolFun',1e-20, 'TolX',1e-20);
x0 = 0.025;

 [ans1 FVEC INFO OUTPUT FJAC] = fsolve(f_EGver1_a ,x0, options);
  %INFO %3⇒OK
  %ans1
  %disp('RECALCULATE FREE PARAMETER VALUE')


    %DEFINE STEADY STATE VALUE---------------------------------------------
    delta_a  = ans1(1);

    sdfss = betta/mu_ass;
    r_nss = piss*mu_ass/betta;
    r_kss = mu_ass/betta+deltass-1;
    delta_primess = r_kss;
    mu_vss = mu_ass^((1-alfa)/lambda_a);
    deltatil_ass = mu_vss-1+delta_a;
    mcss = 1/(1+lambda_p);
    sss =1/(1+lambda_p)/(1+lambda_x);
    kss = (sss*alfa/r_kss)^(1/(1-alfa))*mu_ass;
    iss = (mu_ass-1+deltass)/mu_ass*kss;
    yss = (kss/mu_ass)^alfa;
    k_pss = mcss*yss/(1-betta*xi_p);
    f_pss = yss/(1-betta*xi_p);

    ass = (1-delta_a)*lambdass/(deltatil_ass+(1-delta_a)*lambdass);
    i_dss = i_dyss*yss;
    wss = (1-alfa)*sss*yss;

    gamma_ass = betta*lambda_x*sss*yss/(mu_vss-betta*(1-delta_a));
    p_vss = gamma_ass;
    jss = (1-delta_a)*(1-omega_a)*lambdass*p_vss/(1-(1-delta_a)*mu_ass/mu_vss...
           *(1-lambdass*(1-omega_a))*sdfss);

    i_ass = (1-delta_a)*omega_a*lambdass*(p_vss-mu_ass/mu_vss*sdfss*jss);

    phiss = (mu_vss-1+delta_z)/ass/mu_vss/i_dss;
    css = (1-gyss-i_dyss)*yss-iss-i_ass*(1/ass-1);
    lambda_css = (mu_ass-betta*hab)/(mu_ass-hab)/css;
    yyss =css+iss+gyss*yss;


%//INSTALL STEADY STATE VALUE-----------------------------------------------
    %FREE PARAMETER#2------------------------------------------------------
    b_k = mu_ass/betta+deltass-1;
    delta_k = deltass - b_k/(1+zeta_k);
    chi_z = phiss*ass*i_dss^(1-rho);
    lambda_zero = lambdass/i_ass^omega_a;
    gamma_l = lambda_css*wss/(1+lambda_w);
    %----------------------------------------------------------------------
    k_wss = gamma_l/(1-betta*xi_w);
    f_wss = lambda_css*wss/(1-betta*xi_w);


    %GIVE STEADY-STATE-VALUE TO EACH ENDOGENOUS VARIABLES------------------
    C = css;
    LAMBDA_C =lambda_css;
    SDF =sdfss;
    R_N =r_nss;
    W_O =wss;
    W =wss;
    L =lss;
    F_W =f_wss;
    K_W =k_wss;
    MU_A =mu_ass;
    MU_V =mu_vss;
    S =sss;
    MC =mcss;
    R_K =r_kss;
    U_K =1;
    Q_K =1;
    K =kss;
    I =iss;
    DELTA =deltass;
    DELTA_PRIME =delta_primess;
    DELTATIL_A =deltatil_ass;
    P_V =p_vss;
    GAMMA_A =gamma_ass;
    J =jss;
    LAMBDA =lambdass;
    PHI =phiss;
    I_A =i_ass;
    I_D =i_dss;
    PI_O =piss;
    PPI =piss;
    K_P =k_pss;
    F_P =f_pss;
    YY =yyss;
    A =ass;
    Y =yss;
    %//AR(1)SHOCK PROCESS VARIABLES#8
    Z_B =1;
    Z_L =1;
    Z_I =1;
    Z_G =1;
    Z_R =1;
    Z_P =1;
    Z_W =1;
    Z_LAMBDA =1;
    %//OBSERVED VARIABLES
    DY_OBS =mu_ass;
    DC_OBS =mu_ass;
    DI_OBS =mu_ass;
    DW_OBS =mu_ass;
    PI_OBS =piss;
    R_N_OBS =r_nss;
    L_OBS=lbar;
    

%FOLLOWING CODES NO CHANGE-------------------------------------------------

for iter = 1:length(M_.params) %update parameters set in the file
  eval([ 'M_.params(' num2str(iter) ') = ' M_.param_names(iter,:) ';' ])
end

NumberOfEndogenousVariables = M_.orig_endo_nbr; %auxiliary variables are set automatically
for ii = 1:NumberOfEndogenousVariables
  varname = deblank(M_.endo_names(ii,:));
  eval(['ys(' int2str(ii) ') = ' varname ';']);
end
