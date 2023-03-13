%==========================================================================
%170129 function to get free parameter value by calcuration
% delta_a is free parameter to keep R&D inv per GDP 5~7%
%==========================================================================
function [resid] = f_EGver1(x,args)

hab       = args(1);
betta     = args(2);
zetainv   = args(3);
zeta_k    = args(4);
rho       = args(5);
delta_z   = args(6);
omega_a   = args(7);
zeta_ainv = args(8);
alfa      = args(9);
lambda_a  = args(10);
lambda_x  = args(11);
xi_p      = args(12);
lambda_p  = args(13);
gamma_p   = args(14);
omega_l   = args(15);
xi_w      = args(16);
lambda_w  = args(17);
gamma_w   = args(18);
phi_r     = args(19);
phi_pi    = args(20);
phi_y     = args(21);
gyss      = args(22);
i_dyss    = args(23);
lss       = args(24);
mu_ass    = args(25);
u_kss     = args(26);
q_kss     = args(27);
deltass   = args(28);
lambdass  = args(29);
piss      = args(30);
lbar      = args(31);       
    
    %===================
    delta_a  = x(1);
    %===================
    
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

    
%=========================================================================
%resid(1) = -ass+(1-delta_a)*omega_a*lambdass*(p_vss-mu_ass/mu_vss*sdfss*jss);
resid(1) = -jss+i_dss/((1-delta_z)*betta/ass*(1-(1-delta_z)/mu_vss));