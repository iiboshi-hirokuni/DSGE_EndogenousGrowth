%==========================================================================
%170128 dynare[filename_steadystate.m] added apprehension memo to m-file
%==========================================================================
function [ys,check] = STANDARDR1_steadystate(ys,exo)

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
% args1 = [mu_zss hab betta deltass zetainv zeta_k gamma_w xi_w ...
%          lambda_w omega ppiss gyss alfa gamma_p xi_p lambda_p ...
%          phi_r phi_pi phi_y lbar ...
%          ];%alfa, betaは関数名と同じで干渉するので避ける！！！
      

%//INSTALL STEADY STATE VALUE-----------------------------------------------
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

    %GIVE STEADY-STATE-VALUE TO EACH ENDOGENOUS VARIABLES------------------
LAMBDA_C    = lambda_css;
MU_Z        = mu_zss;
C           = css;
I           = iss;
Q_K         = q_kss;
DELTA       = deltass;
DELTA_PRIME = delta_primess;
SDF         = sdfss;
K           = kss;
L           = lss;
U_K         = u_kss;
PPI         = ppiss;
PPI_O       = ppi_oss;
W           = wss;
W_O         = w_oss;
K_W         = k_wss;
F_W         = f_wss;
K_P         = k_pss;
F_P         = f_pss;
R_K         = r_kss;
R_N         = r_nss;
Y           = yss;
MC          = 1/(1+lambda_p);

DY_OBS      = mu_zss;
DC_OBS      = mu_zss;
DI_OBS      = mu_zss;
DW_OBS      = mu_zss;
R_N_OBS     = r_nss;
PI_OBS      = ppiss;
L_OBS       = lbar;

Z_Z         =1;
Z_B         =1;
Z_L         =1;
Z_I         =1;
Z_G         =1;
Z_R         =1;
Z_P         =1;
Z_W         =1;
    

%FOLLOWING CODES NO CHANGE-------------------------------------------------

for iter = 1:length(M_.params) %update parameters set in the file
  eval([ 'M_.params(' num2str(iter) ') = ' M_.param_names(iter,:) ';' ])
end

NumberOfEndogenousVariables = M_.orig_endo_nbr; %auxiliary variables are set automatically
for ii = 1:NumberOfEndogenousVariables
  varname = deblank(M_.endo_names(ii,:));
  eval(['ys(' int2str(ii) ') = ' varname ';']);
end
