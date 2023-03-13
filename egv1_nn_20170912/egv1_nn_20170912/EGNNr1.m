%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'EGNNr1';
M_.dynare_version = '4.5.1';
oo_.dynare_version = '4.5.1';
options_.dynare_version = '4.5.1';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('EGNNr1.log');
M_.exo_names = 'EPS_B';
M_.exo_names_tex = 'EPS\_B';
M_.exo_names_long = 'EPS_B';
M_.exo_names = char(M_.exo_names, 'EPS_L');
M_.exo_names_tex = char(M_.exo_names_tex, 'EPS\_L');
M_.exo_names_long = char(M_.exo_names_long, 'EPS_L');
M_.exo_names = char(M_.exo_names, 'EPS_I');
M_.exo_names_tex = char(M_.exo_names_tex, 'EPS\_I');
M_.exo_names_long = char(M_.exo_names_long, 'EPS_I');
M_.exo_names = char(M_.exo_names, 'EPS_G');
M_.exo_names_tex = char(M_.exo_names_tex, 'EPS\_G');
M_.exo_names_long = char(M_.exo_names_long, 'EPS_G');
M_.exo_names = char(M_.exo_names, 'EPS_R');
M_.exo_names_tex = char(M_.exo_names_tex, 'EPS\_R');
M_.exo_names_long = char(M_.exo_names_long, 'EPS_R');
M_.exo_names = char(M_.exo_names, 'EPS_P');
M_.exo_names_tex = char(M_.exo_names_tex, 'EPS\_P');
M_.exo_names_long = char(M_.exo_names_long, 'EPS_P');
M_.exo_names = char(M_.exo_names, 'EPS_W');
M_.exo_names_tex = char(M_.exo_names_tex, 'EPS\_W');
M_.exo_names_long = char(M_.exo_names_long, 'EPS_W');
M_.exo_names = char(M_.exo_names, 'EPS_LAMBDA');
M_.exo_names_tex = char(M_.exo_names_tex, 'EPS\_LAMBDA');
M_.exo_names_long = char(M_.exo_names_long, 'EPS_LAMBDA');
M_.endo_names = 'Y';
M_.endo_names_tex = 'Y';
M_.endo_names_long = 'Y';
M_.endo_names = char(M_.endo_names, 'C');
M_.endo_names_tex = char(M_.endo_names_tex, 'C');
M_.endo_names_long = char(M_.endo_names_long, 'C');
M_.endo_names = char(M_.endo_names, 'I');
M_.endo_names_tex = char(M_.endo_names_tex, 'I');
M_.endo_names_long = char(M_.endo_names_long, 'I');
M_.endo_names = char(M_.endo_names, 'MU_A');
M_.endo_names_tex = char(M_.endo_names_tex, 'MU\_A');
M_.endo_names_long = char(M_.endo_names_long, 'MU_A');
M_.endo_names = char(M_.endo_names, 'LAMBDA_C');
M_.endo_names_tex = char(M_.endo_names_tex, 'LAMBDA\_C');
M_.endo_names_long = char(M_.endo_names_long, 'LAMBDA_C');
M_.endo_names = char(M_.endo_names, 'SDF');
M_.endo_names_tex = char(M_.endo_names_tex, 'SDF');
M_.endo_names_long = char(M_.endo_names_long, 'SDF');
M_.endo_names = char(M_.endo_names, 'R_N');
M_.endo_names_tex = char(M_.endo_names_tex, 'R\_N');
M_.endo_names_long = char(M_.endo_names_long, 'R_N');
M_.endo_names = char(M_.endo_names, 'W_O');
M_.endo_names_tex = char(M_.endo_names_tex, 'W\_O');
M_.endo_names_long = char(M_.endo_names_long, 'W_O');
M_.endo_names = char(M_.endo_names, 'W');
M_.endo_names_tex = char(M_.endo_names_tex, 'W');
M_.endo_names_long = char(M_.endo_names_long, 'W');
M_.endo_names = char(M_.endo_names, 'L');
M_.endo_names_tex = char(M_.endo_names_tex, 'L');
M_.endo_names_long = char(M_.endo_names_long, 'L');
M_.endo_names = char(M_.endo_names, 'F_W');
M_.endo_names_tex = char(M_.endo_names_tex, 'F\_W');
M_.endo_names_long = char(M_.endo_names_long, 'F_W');
M_.endo_names = char(M_.endo_names, 'K_W');
M_.endo_names_tex = char(M_.endo_names_tex, 'K\_W');
M_.endo_names_long = char(M_.endo_names_long, 'K_W');
M_.endo_names = char(M_.endo_names, 'MU_V');
M_.endo_names_tex = char(M_.endo_names_tex, 'MU\_V');
M_.endo_names_long = char(M_.endo_names_long, 'MU_V');
M_.endo_names = char(M_.endo_names, 'S');
M_.endo_names_tex = char(M_.endo_names_tex, 'S');
M_.endo_names_long = char(M_.endo_names_long, 'S');
M_.endo_names = char(M_.endo_names, 'MC');
M_.endo_names_tex = char(M_.endo_names_tex, 'MC');
M_.endo_names_long = char(M_.endo_names_long, 'MC');
M_.endo_names = char(M_.endo_names, 'R_K');
M_.endo_names_tex = char(M_.endo_names_tex, 'R\_K');
M_.endo_names_long = char(M_.endo_names_long, 'R_K');
M_.endo_names = char(M_.endo_names, 'U_K');
M_.endo_names_tex = char(M_.endo_names_tex, 'U\_K');
M_.endo_names_long = char(M_.endo_names_long, 'U_K');
M_.endo_names = char(M_.endo_names, 'Q_K');
M_.endo_names_tex = char(M_.endo_names_tex, 'Q\_K');
M_.endo_names_long = char(M_.endo_names_long, 'Q_K');
M_.endo_names = char(M_.endo_names, 'K');
M_.endo_names_tex = char(M_.endo_names_tex, 'K');
M_.endo_names_long = char(M_.endo_names_long, 'K');
M_.endo_names = char(M_.endo_names, 'DELTA');
M_.endo_names_tex = char(M_.endo_names_tex, 'DELTA');
M_.endo_names_long = char(M_.endo_names_long, 'DELTA');
M_.endo_names = char(M_.endo_names, 'DELTA_PRIME');
M_.endo_names_tex = char(M_.endo_names_tex, 'DELTA\_PRIME');
M_.endo_names_long = char(M_.endo_names_long, 'DELTA_PRIME');
M_.endo_names = char(M_.endo_names, 'DELTATIL_A');
M_.endo_names_tex = char(M_.endo_names_tex, 'DELTATIL\_A');
M_.endo_names_long = char(M_.endo_names_long, 'DELTATIL_A');
M_.endo_names = char(M_.endo_names, 'P_V');
M_.endo_names_tex = char(M_.endo_names_tex, 'P\_V');
M_.endo_names_long = char(M_.endo_names_long, 'P_V');
M_.endo_names = char(M_.endo_names, 'GAMMA_A');
M_.endo_names_tex = char(M_.endo_names_tex, 'GAMMA\_A');
M_.endo_names_long = char(M_.endo_names_long, 'GAMMA_A');
M_.endo_names = char(M_.endo_names, 'J');
M_.endo_names_tex = char(M_.endo_names_tex, 'J');
M_.endo_names_long = char(M_.endo_names_long, 'J');
M_.endo_names = char(M_.endo_names, 'LAMBDA');
M_.endo_names_tex = char(M_.endo_names_tex, 'LAMBDA');
M_.endo_names_long = char(M_.endo_names_long, 'LAMBDA');
M_.endo_names = char(M_.endo_names, 'PHI');
M_.endo_names_tex = char(M_.endo_names_tex, 'PHI');
M_.endo_names_long = char(M_.endo_names_long, 'PHI');
M_.endo_names = char(M_.endo_names, 'I_A');
M_.endo_names_tex = char(M_.endo_names_tex, 'I\_A');
M_.endo_names_long = char(M_.endo_names_long, 'I_A');
M_.endo_names = char(M_.endo_names, 'I_D');
M_.endo_names_tex = char(M_.endo_names_tex, 'I\_D');
M_.endo_names_long = char(M_.endo_names_long, 'I_D');
M_.endo_names = char(M_.endo_names, 'PI_O');
M_.endo_names_tex = char(M_.endo_names_tex, 'PI\_O');
M_.endo_names_long = char(M_.endo_names_long, 'PI_O');
M_.endo_names = char(M_.endo_names, 'PPI');
M_.endo_names_tex = char(M_.endo_names_tex, 'PPI');
M_.endo_names_long = char(M_.endo_names_long, 'PPI');
M_.endo_names = char(M_.endo_names, 'K_P');
M_.endo_names_tex = char(M_.endo_names_tex, 'K\_P');
M_.endo_names_long = char(M_.endo_names_long, 'K_P');
M_.endo_names = char(M_.endo_names, 'F_P');
M_.endo_names_tex = char(M_.endo_names_tex, 'F\_P');
M_.endo_names_long = char(M_.endo_names_long, 'F_P');
M_.endo_names = char(M_.endo_names, 'YY');
M_.endo_names_tex = char(M_.endo_names_tex, 'YY');
M_.endo_names_long = char(M_.endo_names_long, 'YY');
M_.endo_names = char(M_.endo_names, 'A');
M_.endo_names_tex = char(M_.endo_names_tex, 'A');
M_.endo_names_long = char(M_.endo_names_long, 'A');
M_.endo_names = char(M_.endo_names, 'Z_B');
M_.endo_names_tex = char(M_.endo_names_tex, 'Z\_B');
M_.endo_names_long = char(M_.endo_names_long, 'Z_B');
M_.endo_names = char(M_.endo_names, 'Z_L');
M_.endo_names_tex = char(M_.endo_names_tex, 'Z\_L');
M_.endo_names_long = char(M_.endo_names_long, 'Z_L');
M_.endo_names = char(M_.endo_names, 'Z_I');
M_.endo_names_tex = char(M_.endo_names_tex, 'Z\_I');
M_.endo_names_long = char(M_.endo_names_long, 'Z_I');
M_.endo_names = char(M_.endo_names, 'Z_G');
M_.endo_names_tex = char(M_.endo_names_tex, 'Z\_G');
M_.endo_names_long = char(M_.endo_names_long, 'Z_G');
M_.endo_names = char(M_.endo_names, 'Z_R');
M_.endo_names_tex = char(M_.endo_names_tex, 'Z\_R');
M_.endo_names_long = char(M_.endo_names_long, 'Z_R');
M_.endo_names = char(M_.endo_names, 'Z_P');
M_.endo_names_tex = char(M_.endo_names_tex, 'Z\_P');
M_.endo_names_long = char(M_.endo_names_long, 'Z_P');
M_.endo_names = char(M_.endo_names, 'Z_W');
M_.endo_names_tex = char(M_.endo_names_tex, 'Z\_W');
M_.endo_names_long = char(M_.endo_names_long, 'Z_W');
M_.endo_names = char(M_.endo_names, 'Z_LAMBDA');
M_.endo_names_tex = char(M_.endo_names_tex, 'Z\_LAMBDA');
M_.endo_names_long = char(M_.endo_names_long, 'Z_LAMBDA');
M_.endo_names = char(M_.endo_names, 'DY_OBS');
M_.endo_names_tex = char(M_.endo_names_tex, 'DY\_OBS');
M_.endo_names_long = char(M_.endo_names_long, 'DY_OBS');
M_.endo_names = char(M_.endo_names, 'DC_OBS');
M_.endo_names_tex = char(M_.endo_names_tex, 'DC\_OBS');
M_.endo_names_long = char(M_.endo_names_long, 'DC_OBS');
M_.endo_names = char(M_.endo_names, 'DI_OBS');
M_.endo_names_tex = char(M_.endo_names_tex, 'DI\_OBS');
M_.endo_names_long = char(M_.endo_names_long, 'DI_OBS');
M_.endo_names = char(M_.endo_names, 'DW_OBS');
M_.endo_names_tex = char(M_.endo_names_tex, 'DW\_OBS');
M_.endo_names_long = char(M_.endo_names_long, 'DW_OBS');
M_.endo_names = char(M_.endo_names, 'PI_OBS');
M_.endo_names_tex = char(M_.endo_names_tex, 'PI\_OBS');
M_.endo_names_long = char(M_.endo_names_long, 'PI_OBS');
M_.endo_names = char(M_.endo_names, 'R_N_OBS');
M_.endo_names_tex = char(M_.endo_names_tex, 'R\_N\_OBS');
M_.endo_names_long = char(M_.endo_names_long, 'R_N_OBS');
M_.endo_names = char(M_.endo_names, 'L_OBS');
M_.endo_names_tex = char(M_.endo_names_tex, 'L\_OBS');
M_.endo_names_long = char(M_.endo_names_long, 'L_OBS');
M_.endo_partitions = struct();
M_.param_names = 'hab';
M_.param_names_tex = 'hab';
M_.param_names_long = 'hab';
M_.param_names = char(M_.param_names, 'betta');
M_.param_names_tex = char(M_.param_names_tex, 'betta');
M_.param_names_long = char(M_.param_names_long, 'betta');
M_.param_names = char(M_.param_names, 'zetainv');
M_.param_names_tex = char(M_.param_names_tex, 'zetainv');
M_.param_names_long = char(M_.param_names_long, 'zetainv');
M_.param_names = char(M_.param_names, 'zeta_k');
M_.param_names_tex = char(M_.param_names_tex, 'zeta\_k');
M_.param_names_long = char(M_.param_names_long, 'zeta_k');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'delta_z');
M_.param_names_tex = char(M_.param_names_tex, 'delta\_z');
M_.param_names_long = char(M_.param_names_long, 'delta_z');
M_.param_names = char(M_.param_names, 'omega_a');
M_.param_names_tex = char(M_.param_names_tex, 'omega\_a');
M_.param_names_long = char(M_.param_names_long, 'omega_a');
M_.param_names = char(M_.param_names, 'zeta_ainv');
M_.param_names_tex = char(M_.param_names_tex, 'zeta\_ainv');
M_.param_names_long = char(M_.param_names_long, 'zeta_ainv');
M_.param_names = char(M_.param_names, 'alfa');
M_.param_names_tex = char(M_.param_names_tex, 'alfa');
M_.param_names_long = char(M_.param_names_long, 'alfa');
M_.param_names = char(M_.param_names, 'lambda_a');
M_.param_names_tex = char(M_.param_names_tex, 'lambda\_a');
M_.param_names_long = char(M_.param_names_long, 'lambda_a');
M_.param_names = char(M_.param_names, 'lambda_x');
M_.param_names_tex = char(M_.param_names_tex, 'lambda\_x');
M_.param_names_long = char(M_.param_names_long, 'lambda_x');
M_.param_names = char(M_.param_names, 'xi_p');
M_.param_names_tex = char(M_.param_names_tex, 'xi\_p');
M_.param_names_long = char(M_.param_names_long, 'xi_p');
M_.param_names = char(M_.param_names, 'lambda_p');
M_.param_names_tex = char(M_.param_names_tex, 'lambda\_p');
M_.param_names_long = char(M_.param_names_long, 'lambda_p');
M_.param_names = char(M_.param_names, 'gamma_p');
M_.param_names_tex = char(M_.param_names_tex, 'gamma\_p');
M_.param_names_long = char(M_.param_names_long, 'gamma_p');
M_.param_names = char(M_.param_names, 'omega_l');
M_.param_names_tex = char(M_.param_names_tex, 'omega\_l');
M_.param_names_long = char(M_.param_names_long, 'omega_l');
M_.param_names = char(M_.param_names, 'xi_w');
M_.param_names_tex = char(M_.param_names_tex, 'xi\_w');
M_.param_names_long = char(M_.param_names_long, 'xi_w');
M_.param_names = char(M_.param_names, 'lambda_w');
M_.param_names_tex = char(M_.param_names_tex, 'lambda\_w');
M_.param_names_long = char(M_.param_names_long, 'lambda_w');
M_.param_names = char(M_.param_names, 'gamma_w');
M_.param_names_tex = char(M_.param_names_tex, 'gamma\_w');
M_.param_names_long = char(M_.param_names_long, 'gamma_w');
M_.param_names = char(M_.param_names, 'phi_r');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_r');
M_.param_names_long = char(M_.param_names_long, 'phi_r');
M_.param_names = char(M_.param_names, 'phi_pi');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pi');
M_.param_names_long = char(M_.param_names_long, 'phi_pi');
M_.param_names = char(M_.param_names, 'phi_y');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_y');
M_.param_names_long = char(M_.param_names_long, 'phi_y');
M_.param_names = char(M_.param_names, 'gyss');
M_.param_names_tex = char(M_.param_names_tex, 'gyss');
M_.param_names_long = char(M_.param_names_long, 'gyss');
M_.param_names = char(M_.param_names, 'i_dyss');
M_.param_names_tex = char(M_.param_names_tex, 'i\_dyss');
M_.param_names_long = char(M_.param_names_long, 'i_dyss');
M_.param_names = char(M_.param_names, 'css');
M_.param_names_tex = char(M_.param_names_tex, 'css');
M_.param_names_long = char(M_.param_names_long, 'css');
M_.param_names = char(M_.param_names, 'lambda_css');
M_.param_names_tex = char(M_.param_names_tex, 'lambda\_css');
M_.param_names_long = char(M_.param_names_long, 'lambda_css');
M_.param_names = char(M_.param_names, 'sdfss');
M_.param_names_tex = char(M_.param_names_tex, 'sdfss');
M_.param_names_long = char(M_.param_names_long, 'sdfss');
M_.param_names = char(M_.param_names, 'r_nss');
M_.param_names_tex = char(M_.param_names_tex, 'r\_nss');
M_.param_names_long = char(M_.param_names_long, 'r_nss');
M_.param_names = char(M_.param_names, 'w_oss');
M_.param_names_tex = char(M_.param_names_tex, 'w\_oss');
M_.param_names_long = char(M_.param_names_long, 'w_oss');
M_.param_names = char(M_.param_names, 'wss');
M_.param_names_tex = char(M_.param_names_tex, 'wss');
M_.param_names_long = char(M_.param_names_long, 'wss');
M_.param_names = char(M_.param_names, 'lss');
M_.param_names_tex = char(M_.param_names_tex, 'lss');
M_.param_names_long = char(M_.param_names_long, 'lss');
M_.param_names = char(M_.param_names, 'f_wss');
M_.param_names_tex = char(M_.param_names_tex, 'f\_wss');
M_.param_names_long = char(M_.param_names_long, 'f_wss');
M_.param_names = char(M_.param_names, 'k_wss');
M_.param_names_tex = char(M_.param_names_tex, 'k\_wss');
M_.param_names_long = char(M_.param_names_long, 'k_wss');
M_.param_names = char(M_.param_names, 'mu_ass');
M_.param_names_tex = char(M_.param_names_tex, 'mu\_ass');
M_.param_names_long = char(M_.param_names_long, 'mu_ass');
M_.param_names = char(M_.param_names, 'mu_vss');
M_.param_names_tex = char(M_.param_names_tex, 'mu\_vss');
M_.param_names_long = char(M_.param_names_long, 'mu_vss');
M_.param_names = char(M_.param_names, 'sss');
M_.param_names_tex = char(M_.param_names_tex, 'sss');
M_.param_names_long = char(M_.param_names_long, 'sss');
M_.param_names = char(M_.param_names, 'mcss');
M_.param_names_tex = char(M_.param_names_tex, 'mcss');
M_.param_names_long = char(M_.param_names_long, 'mcss');
M_.param_names = char(M_.param_names, 'r_kss');
M_.param_names_tex = char(M_.param_names_tex, 'r\_kss');
M_.param_names_long = char(M_.param_names_long, 'r_kss');
M_.param_names = char(M_.param_names, 'u_kss');
M_.param_names_tex = char(M_.param_names_tex, 'u\_kss');
M_.param_names_long = char(M_.param_names_long, 'u_kss');
M_.param_names = char(M_.param_names, 'q_kss');
M_.param_names_tex = char(M_.param_names_tex, 'q\_kss');
M_.param_names_long = char(M_.param_names_long, 'q_kss');
M_.param_names = char(M_.param_names, 'kss');
M_.param_names_tex = char(M_.param_names_tex, 'kss');
M_.param_names_long = char(M_.param_names_long, 'kss');
M_.param_names = char(M_.param_names, 'iss');
M_.param_names_tex = char(M_.param_names_tex, 'iss');
M_.param_names_long = char(M_.param_names_long, 'iss');
M_.param_names = char(M_.param_names, 'deltass');
M_.param_names_tex = char(M_.param_names_tex, 'deltass');
M_.param_names_long = char(M_.param_names_long, 'deltass');
M_.param_names = char(M_.param_names, 'delta_primess');
M_.param_names_tex = char(M_.param_names_tex, 'delta\_primess');
M_.param_names_long = char(M_.param_names_long, 'delta_primess');
M_.param_names = char(M_.param_names, 'deltatil_ass');
M_.param_names_tex = char(M_.param_names_tex, 'deltatil\_ass');
M_.param_names_long = char(M_.param_names_long, 'deltatil_ass');
M_.param_names = char(M_.param_names, 'p_vss');
M_.param_names_tex = char(M_.param_names_tex, 'p\_vss');
M_.param_names_long = char(M_.param_names_long, 'p_vss');
M_.param_names = char(M_.param_names, 'gamma_ass');
M_.param_names_tex = char(M_.param_names_tex, 'gamma\_ass');
M_.param_names_long = char(M_.param_names_long, 'gamma_ass');
M_.param_names = char(M_.param_names, 'jss');
M_.param_names_tex = char(M_.param_names_tex, 'jss');
M_.param_names_long = char(M_.param_names_long, 'jss');
M_.param_names = char(M_.param_names, 'lambdass');
M_.param_names_tex = char(M_.param_names_tex, 'lambdass');
M_.param_names_long = char(M_.param_names_long, 'lambdass');
M_.param_names = char(M_.param_names, 'phiss');
M_.param_names_tex = char(M_.param_names_tex, 'phiss');
M_.param_names_long = char(M_.param_names_long, 'phiss');
M_.param_names = char(M_.param_names, 'i_ass');
M_.param_names_tex = char(M_.param_names_tex, 'i\_ass');
M_.param_names_long = char(M_.param_names_long, 'i_ass');
M_.param_names = char(M_.param_names, 'i_dss');
M_.param_names_tex = char(M_.param_names_tex, 'i\_dss');
M_.param_names_long = char(M_.param_names_long, 'i_dss');
M_.param_names = char(M_.param_names, 'pi_oss');
M_.param_names_tex = char(M_.param_names_tex, 'pi\_oss');
M_.param_names_long = char(M_.param_names_long, 'pi_oss');
M_.param_names = char(M_.param_names, 'piss');
M_.param_names_tex = char(M_.param_names_tex, 'piss');
M_.param_names_long = char(M_.param_names_long, 'piss');
M_.param_names = char(M_.param_names, 'k_pss');
M_.param_names_tex = char(M_.param_names_tex, 'k\_pss');
M_.param_names_long = char(M_.param_names_long, 'k_pss');
M_.param_names = char(M_.param_names, 'f_pss');
M_.param_names_tex = char(M_.param_names_tex, 'f\_pss');
M_.param_names_long = char(M_.param_names_long, 'f_pss');
M_.param_names = char(M_.param_names, 'yyss');
M_.param_names_tex = char(M_.param_names_tex, 'yyss');
M_.param_names_long = char(M_.param_names_long, 'yyss');
M_.param_names = char(M_.param_names, 'ass');
M_.param_names_tex = char(M_.param_names_tex, 'ass');
M_.param_names_long = char(M_.param_names_long, 'ass');
M_.param_names = char(M_.param_names, 'yss');
M_.param_names_tex = char(M_.param_names_tex, 'yss');
M_.param_names_long = char(M_.param_names_long, 'yss');
M_.param_names = char(M_.param_names, 'delta_k');
M_.param_names_tex = char(M_.param_names_tex, 'delta\_k');
M_.param_names_long = char(M_.param_names_long, 'delta_k');
M_.param_names = char(M_.param_names, 'b_k');
M_.param_names_tex = char(M_.param_names_tex, 'b\_k');
M_.param_names_long = char(M_.param_names_long, 'b_k');
M_.param_names = char(M_.param_names, 'chi_z');
M_.param_names_tex = char(M_.param_names_tex, 'chi\_z');
M_.param_names_long = char(M_.param_names_long, 'chi_z');
M_.param_names = char(M_.param_names, 'lambda_zero');
M_.param_names_tex = char(M_.param_names_tex, 'lambda\_zero');
M_.param_names_long = char(M_.param_names_long, 'lambda_zero');
M_.param_names = char(M_.param_names, 'delta_a');
M_.param_names_tex = char(M_.param_names_tex, 'delta\_a');
M_.param_names_long = char(M_.param_names_long, 'delta_a');
M_.param_names = char(M_.param_names, 'gamma_l');
M_.param_names_tex = char(M_.param_names_tex, 'gamma\_l');
M_.param_names_long = char(M_.param_names_long, 'gamma_l');
M_.param_names = char(M_.param_names, 'rho_b');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_b');
M_.param_names_long = char(M_.param_names_long, 'rho_b');
M_.param_names = char(M_.param_names, 'rho_l');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_l');
M_.param_names_long = char(M_.param_names_long, 'rho_l');
M_.param_names = char(M_.param_names, 'rho_i');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_i');
M_.param_names_long = char(M_.param_names_long, 'rho_i');
M_.param_names = char(M_.param_names, 'rho_g');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_g');
M_.param_names_long = char(M_.param_names_long, 'rho_g');
M_.param_names = char(M_.param_names, 'rho_r');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_r');
M_.param_names_long = char(M_.param_names_long, 'rho_r');
M_.param_names = char(M_.param_names, 'rho_p');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_p');
M_.param_names_long = char(M_.param_names_long, 'rho_p');
M_.param_names = char(M_.param_names, 'rho_w');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_w');
M_.param_names_long = char(M_.param_names_long, 'rho_w');
M_.param_names = char(M_.param_names, 'rho_lambda');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_lambda');
M_.param_names_long = char(M_.param_names_long, 'rho_lambda');
M_.param_names = char(M_.param_names, 'lbar');
M_.param_names_tex = char(M_.param_names_tex, 'lbar');
M_.param_names_long = char(M_.param_names_long, 'lbar');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 8;
M_.endo_nbr = 50;
M_.param_nbr = 73;
M_.orig_endo_nbr = 50;
M_.aux_vars = [];
options_.varobs = cell(1);
options_.varobs(1)  = {'DY_OBS'};
options_.varobs(2)  = {'DC_OBS'};
options_.varobs(3)  = {'DI_OBS'};
options_.varobs(4)  = {'DW_OBS'};
options_.varobs(5)  = {'PI_OBS'};
options_.varobs(6)  = {'R_N_OBS'};
options_.varobs(7)  = {'L_OBS'};
options_.varobs_id = [ 44 45 46 47 48 49 50  ];
M_.Sigma_e = zeros(8, 8);
M_.Correlation_matrix = eye(8, 8);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('EGNNr1_static');
erase_compiled_function('EGNNr1_dynamic');
M_.orig_eq_nbr = 50;
M_.eq_nbr = 50;
M_.ramsey_eq_nbr = 0;
M_.lead_lag_incidence = [
 0 20 70;
 1 21 71;
 2 22 72;
 3 23 0;
 0 24 73;
 0 25 0;
 4 26 0;
 0 27 0;
 5 28 74;
 0 29 0;
 0 30 75;
 0 31 76;
 6 32 0;
 0 33 77;
 0 34 0;
 0 35 78;
 0 36 79;
 0 37 80;
 7 38 0;
 0 39 81;
 0 40 0;
 8 41 82;
 0 42 0;
 0 43 83;
 0 44 84;
 0 45 0;
 0 46 0;
 0 47 0;
 0 48 0;
 0 49 0;
 9 50 85;
 0 51 86;
 0 52 87;
 10 53 0;
 11 54 0;
 12 55 88;
 13 56 0;
 14 57 89;
 15 58 0;
 16 59 0;
 17 60 0;
 18 61 0;
 19 62 0;
 0 63 0;
 0 64 0;
 0 65 0;
 0 66 0;
 0 67 0;
 0 68 0;
 0 69 0;]';
M_.nstatic = 18;
M_.nfwrd   = 13;
M_.npred   = 12;
M_.nboth   = 7;
M_.nsfwrd   = 20;
M_.nspred   = 19;
M_.ndynamic   = 32;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:8];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(50, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(8, 1);
M_.params = NaN(73, 1);
M_.NNZDerivatives = [235; -1; -1];
warning('off','all') 
M_.params( 1 ) = 0;
hab = M_.params( 1 );
M_.params( 2 ) = 0.9975;
betta = M_.params( 2 );
M_.params( 3 ) = 4.0;
zetainv = M_.params( 3 );
M_.params( 4 ) = 1.0;
zeta_k = M_.params( 4 );
M_.params( 5 ) = 0.27;
rho = M_.params( 5 );
M_.params( 6 ) = 0.025;
delta_z = M_.params( 6 );
M_.params( 7 ) = 0.14;
omega_a = M_.params( 7 );
M_.params( 8 ) = 3.0;
zeta_ainv = M_.params( 8 );
M_.params( 9 ) = 0.40;
alfa = M_.params( 9 );
M_.params( 10 ) = 0.45;
lambda_a = M_.params( 10 );
M_.params( 11 ) = 0.30;
lambda_x = M_.params( 11 );
M_.params( 12 ) = 0;
xi_p = M_.params( 12 );
M_.params( 13 ) = 0.30;
lambda_p = M_.params( 13 );
M_.params( 14 ) = 0.33;
gamma_p = M_.params( 14 );
M_.params( 15 ) = 4.7;
omega_l = M_.params( 15 );
M_.params( 16 ) = 0;
xi_w = M_.params( 16 );
M_.params( 17 ) = 0.15;
lambda_w = M_.params( 17 );
M_.params( 18 ) = 0.20;
gamma_w = M_.params( 18 );
M_.params( 19 ) = 0.26;
phi_r = M_.params( 19 );
M_.params( 20 ) = 2.35;
phi_pi = M_.params( 20 );
M_.params( 21 ) = 0.035;
phi_y = M_.params( 21 );
M_.params( 22 ) = 0.25;
gyss = M_.params( 22 );
M_.params( 23 ) = 0.05;
i_dyss = M_.params( 23 );
M_.params( 30 ) = 1;
lss = M_.params( 30 );
M_.params( 33 ) = 1.005;
mu_ass = M_.params( 33 );
M_.params( 38 ) = 1;
u_kss = M_.params( 38 );
M_.params( 39 ) = 1;
q_kss = M_.params( 39 );
M_.params( 42 ) = 0.025;
deltass = M_.params( 42 );
M_.params( 48 ) = 0.025;
lambdass = M_.params( 48 );
M_.params( 53 ) = 1.002;
piss = M_.params( 53 );
M_.params( 65 ) = 0.50;
rho_b = M_.params( 65 );
M_.params( 66 ) = 0.50;
rho_l = M_.params( 66 );
M_.params( 67 ) = 0.50;
rho_i = M_.params( 67 );
M_.params( 68 ) = 0.50;
rho_g = M_.params( 68 );
M_.params( 69 ) = 0;
rho_r = M_.params( 69 );
M_.params( 70 ) = 0.50;
rho_p = M_.params( 70 );
M_.params( 71 ) = 0.50;
rho_w = M_.params( 71 );
M_.params( 72 ) = 0.50;
rho_lambda = M_.params( 72 );
M_.params( 73 ) = 1.07;
lbar = M_.params( 73 );
resid(1);
oo_.dr.eigval = check(M_,options_,oo_);
steady;
model_diagnostics(M_,options_,oo_);
global estim_params_
estim_params_.var_exo = [];
estim_params_.var_endo = [];
estim_params_.corrx = [];
estim_params_.corrn = [];
estim_params_.param_vals = [];
estim_params_.param_vals = [estim_params_.param_vals; 15, NaN, NaN, NaN, 2, 2.000, 0.750, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 4, NaN, NaN, NaN, 2, 1.000, 0.100, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 3, NaN, NaN, NaN, 2, 4.000, 1.500, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 8, NaN, NaN, NaN, 2, 3.000, 0.500, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 48, NaN, NaN, NaN, 1, 0.025, 0.003, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 7, NaN, NaN, NaN, 2, 0.500, 0.010, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 5, NaN, NaN, NaN, 1, 0.600, 0.100, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 73, NaN, NaN, NaN, 2, 1.115, 0.005, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 53, NaN, NaN, NaN, 2, 1.003, 0.001, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 14, NaN, NaN, NaN, 1, 0.400, 0.150, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 18, NaN, NaN, NaN, 1, 0.400, 0.150, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 19, NaN, NaN, NaN, 1, 0.800, 0.200, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 20, NaN, NaN, NaN, 2, 1.700, 0.200, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 21, NaN, NaN, NaN, 2, 0.125, 0.050, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 65, NaN, NaN, NaN, 1, 0.950, 0.01, 0, 0.999, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 66, NaN, NaN, NaN, 1, 0.500, 0.100, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 67, NaN, NaN, NaN, 1, 0.500, 0.200, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 68, NaN, NaN, NaN, 1, 0.500, 0.200, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 72, NaN, NaN, NaN, 1, 0.500, 0.100, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 70, NaN, NaN, NaN, 1, 0.500, 0.200, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 71, NaN, NaN, NaN, 1, 0.500, 0.200, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 1, 0.1, NaN, NaN, 4, 0.5, Inf, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 2, 1, NaN, NaN, 4, 2, Inf, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 3, 0.5, NaN, NaN, 4, 0.5, Inf, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 4, 0.5, NaN, NaN, 4, 0.5, Inf, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 5, 0.5, NaN, NaN, 4, 0.5, Inf, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 8, 0.5, NaN, NaN, 4, 0.5, Inf, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 6, 0.5, NaN, NaN, 4, 0.5, Inf, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 7, 0.5, NaN, NaN, 4, 0.5, Inf, NaN, NaN, NaN ];
options_.loglinear = 1;
options_.mh_drop = 0.20;
options_.mh_jscale = 0.350;
options_.mh_nblck = 3;
options_.mh_replic = 12500;
options_.mode_check.status = 1;
options_.mode_compute = 5;
options_.plot_priors = 0;
options_.presample = 0;
options_.prior_trunc = 0;
options_.datafile = 'dataset_IK_log.xlsx';
options_.xls_range = 'B1:H136';
options_.xls_sheet = 'Sheet6';
options_.graph_format = char('fig');
options_.first_obs = 1;
options_.order = 1;
var_list_ = char();
oo_recursive_=dynare_estimation(var_list_);
options_.no_graph.shock_decomposition = 1;
options_.parameter_set = 'posterior_mean';
var_list_ = char('MU_A','Y','C','I','I_D','DY_OBS','DC_OBS','DI_OBS','DW_OBS','PI_OBS','R_N_OBS','L_OBS','YY');
[oo_,M_]= shock_decomposition(M_,oo_,options_,var_list_,bayestopt_,estim_params_);
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
xlswrite('hist_dy_obs.xlsx',[box;reshape(oo_.shock_decomposition(44,:,:),10,135)']);
xlswrite('hist_dy_obs.xlsx',[name]);
xlswrite('hist_dc_obs.xlsx',[box;reshape(oo_.shock_decomposition(45,:,:),10,135)']);
xlswrite('hist_dc_obs.xlsx',[name]);
xlswrite('hist_di_obs.xlsx',[box;reshape(oo_.shock_decomposition(46,:,:),10,135)']);
xlswrite('hist_di_obs.xlsx',[name]);
xlswrite('hist_dw_obs.xlsx',[box;reshape(oo_.shock_decomposition(47,:,:),10,135)']);
xlswrite('hist_dw_obs.xlsx',[name]);
xlswrite('hist_pi_obs.xlsx',[box;reshape(oo_.shock_decomposition(48,:,:),10,135)']);
xlswrite('hist_pi_obs.xlsx',[name]);
xlswrite('hist_r_n_obs.xlsx',[box;reshape(oo_.shock_decomposition(49,:,:),10,135)']);
xlswrite('hist_r_n_obs.xlsx',[name]);
xlswrite('hist_l_obs.xlsx',[box;reshape(oo_.shock_decomposition(50,:,:),10,135)']);
xlswrite('hist_l_obs.xlsx',[name]);
xlswrite('hist_y_obs.xlsx',[box;reshape(oo_.shock_decomposition(1,:,:),10,135)']);
xlswrite('hist_y_obs.xlsx',[name]);
xlswrite('hist_yy_obs.xlsx',[box;reshape(oo_.shock_decomposition(34,:,:),10,135)']);
xlswrite('hist_yy_obs.xlsx',[name]);
xlswrite('hist_c_obs.xlsx',[box;reshape(oo_.shock_decomposition(2,:,:),10,135)']);
xlswrite('hist_c_obs.xlsx',[name]);
xlswrite('hist_i_obs.xlsx',[box;reshape(oo_.shock_decomposition(3,:,:),10,135)']);
xlswrite('hist_i_obs.xlsx',[name]);
xlswrite('hist_mu_a.xlsx',[box;reshape(oo_.shock_decomposition(4,:,:),10,135)']);
xlswrite('hist_mu_a.xlsx',[name]);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 0.01;
M_.Sigma_e(2, 2) = 0.01;
M_.Sigma_e(3, 3) = 0.01;
M_.Sigma_e(4, 4) = 0.01;
M_.Sigma_e(5, 5) = 0.01;
M_.Sigma_e(6, 6) = 0.01;
M_.Sigma_e(7, 7) = 0.01;
M_.Sigma_e(8, 8) = 0.01;
options_.SpectralDensity.trigger = 1;
options_.irf = 200;
options_.loglinear = 1;
options_.nodisplay = 1;
options_.order = 1;
options_.graph_format = char('fig');
var_list_ = char('Y','C','I','R_K','R_N','W','L','PPI','MU_A','DY_OBS','DC_OBS','DI_OBS','DW_OBS','PI_OBS','R_N_OBS','L_OBS','YY');
info = stoch_simul(var_list_);
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
options_.SpectralDensity.trigger = 1;
options_.bandpass.indicator = 1;
options_.irf = 200;
options_.loglinear = 1;
options_.nodisplay = 1;
options_.order = 1;
options_.graph_format = char('fig');
options_.bandpass.passband = [2;6;];
var_list_ = char('Y','C','I','R_K','R_N','W','L','PPI','MU_A','DY_OBS','DC_OBS','DI_OBS','DW_OBS','PI_OBS','R_N_OBS','L_OBS','YY');
info = stoch_simul(var_list_);
xlswrite('IRF_EPS_B_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_B' oo_.irfs.C_EPS_B' ....
                  oo_.irfs.I_EPS_B' oo_.irfs.R_K_EPS_B' oo_.irfs.R_N_EPS_B' oo_.irfs.W_EPS_B' oo_.irfs.L_EPS_B'...
                  oo_.irfs.PPI_EPS_B' oo_.irfs.MU_A_EPS_B' oo_.irfs.YY_EPS_B'] );
xlswrite('IRF_EPS_B_filtered_2-8.xlsx',[name1]);
xlswrite('IRF_EPS_L_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_L' oo_.irfs.C_EPS_L' ....
                  oo_.irfs.I_EPS_L' oo_.irfs.R_K_EPS_L' oo_.irfs.R_N_EPS_L' oo_.irfs.W_EPS_L' oo_.irfs.L_EPS_L'...
                  oo_.irfs.PPI_EPS_L' oo_.irfs.MU_A_EPS_L' oo_.irfs.YY_EPS_L'] );
xlswrite('IRF_EPS_L_filtered_2-8.xlsx',[name2]);
xlswrite('IRF_EPS_I_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_I' oo_.irfs.C_EPS_I' ....
                  oo_.irfs.I_EPS_I' oo_.irfs.R_K_EPS_I' oo_.irfs.R_N_EPS_I' oo_.irfs.W_EPS_I' oo_.irfs.L_EPS_I'...
                  oo_.irfs.PPI_EPS_I' oo_.irfs.MU_A_EPS_I' oo_.irfs.YY_EPS_I'] );
xlswrite('IRF_EPS_I_filtered_2-8.xlsx',[name3]);
xlswrite('IRF_EPS_G_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_G' oo_.irfs.C_EPS_G' ....
                  oo_.irfs.I_EPS_G' oo_.irfs.R_K_EPS_G' oo_.irfs.R_N_EPS_G' oo_.irfs.W_EPS_G' oo_.irfs.L_EPS_G'...
                  oo_.irfs.PPI_EPS_G' oo_.irfs.MU_A_EPS_G' oo_.irfs.YY_EPS_G'] );
xlswrite('IRF_EPS_G_filtered_2-8.xlsx',[name4]);
xlswrite('IRF_EPS_R_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_R' oo_.irfs.C_EPS_R' ....
                  oo_.irfs.I_EPS_R' oo_.irfs.R_K_EPS_R' oo_.irfs.R_N_EPS_R' oo_.irfs.W_EPS_R' oo_.irfs.L_EPS_R'...
                  oo_.irfs.PPI_EPS_R' oo_.irfs.MU_A_EPS_R' oo_.irfs.YY_EPS_R'] );
xlswrite('IRF_EPS_R_filtered_2-8.xlsx',[name5]);
xlswrite('IRF_EPS_P_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_P' oo_.irfs.C_EPS_P' ....
                  oo_.irfs.I_EPS_P' oo_.irfs.R_K_EPS_P' oo_.irfs.R_N_EPS_P' oo_.irfs.W_EPS_P' oo_.irfs.L_EPS_P'...
                  oo_.irfs.PPI_EPS_P' oo_.irfs.MU_A_EPS_P' oo_.irfs.YY_EPS_P'] );
xlswrite('IRF_EPS_P_filtered_2-8.xlsx',[name6]);
xlswrite('IRF_EPS_W_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_W' oo_.irfs.C_EPS_W' ....
                  oo_.irfs.I_EPS_W' oo_.irfs.R_K_EPS_W' oo_.irfs.R_N_EPS_W' oo_.irfs.W_EPS_W' oo_.irfs.L_EPS_W'...
                  oo_.irfs.PPI_EPS_W' oo_.irfs.MU_A_EPS_W' oo_.irfs.YY_EPS_W'] );
xlswrite('IRF_EPS_W_filtered_2-8.xlsx',[name7]);
xlswrite('IRF_EPS_LAMBDA_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_LAMBDA' oo_.irfs.C_EPS_LAMBDA' ....
                  oo_.irfs.I_EPS_LAMBDA' oo_.irfs.R_K_EPS_LAMBDA' oo_.irfs.R_N_EPS_LAMBDA' oo_.irfs.W_EPS_LAMBDA' oo_.irfs.L_EPS_LAMBDA'...
                  oo_.irfs.PPI_EPS_LAMBDA' oo_.irfs.MU_A_EPS_LAMBDA' oo_.irfs.YY_EPS_LAMBDA'] );
xlswrite('IRF_EPS_LAMBDA_filtered_2-8.xlsx',[name8]);
options_.SpectralDensity.trigger = 1;
options_.bandpass.indicator = 1;
options_.irf = 200;
options_.loglinear = 1;
options_.nodisplay = 1;
options_.order = 1;
options_.graph_format = char('fig');
options_.bandpass.passband = [6;32;];
var_list_ = char('Y','C','I','R_K','R_N','W','L','PPI','MU_A','DY_OBS','DC_OBS','DI_OBS','DW_OBS','PI_OBS','R_N_OBS','L_OBS','YY');
info = stoch_simul(var_list_);
xlswrite('IRF_EPS_B_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_B' oo_.irfs.C_EPS_B' ....
                  oo_.irfs.I_EPS_B' oo_.irfs.R_K_EPS_B' oo_.irfs.R_N_EPS_B' oo_.irfs.W_EPS_B' oo_.irfs.L_EPS_B'...
                  oo_.irfs.PPI_EPS_B' oo_.irfs.MU_A_EPS_B' oo_.irfs.YY_EPS_B'] );
xlswrite('IRF_EPS_B_filtered_6-32.xlsx',[name1]);
xlswrite('IRF_EPS_L_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_L' oo_.irfs.C_EPS_L' ....
                  oo_.irfs.I_EPS_L' oo_.irfs.R_K_EPS_L' oo_.irfs.R_N_EPS_L' oo_.irfs.W_EPS_L' oo_.irfs.L_EPS_L'...
                  oo_.irfs.PPI_EPS_L' oo_.irfs.MU_A_EPS_L' oo_.irfs.YY_EPS_L'] );
xlswrite('IRF_EPS_L_filtered_6-32.xlsx',[name2]);
xlswrite('IRF_EPS_I_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_I' oo_.irfs.C_EPS_I' ....
                  oo_.irfs.I_EPS_I' oo_.irfs.R_K_EPS_I' oo_.irfs.R_N_EPS_I' oo_.irfs.W_EPS_I' oo_.irfs.L_EPS_I'...
                  oo_.irfs.PPI_EPS_I' oo_.irfs.MU_A_EPS_I' oo_.irfs.YY_EPS_I'] );
xlswrite('IRF_EPS_I_filtered_6-32.xlsx',[name3]);
xlswrite('IRF_EPS_G_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_G' oo_.irfs.C_EPS_G' ....
                  oo_.irfs.I_EPS_G' oo_.irfs.R_K_EPS_G' oo_.irfs.R_N_EPS_G' oo_.irfs.W_EPS_G' oo_.irfs.L_EPS_G'...
                  oo_.irfs.PPI_EPS_G' oo_.irfs.MU_A_EPS_G' oo_.irfs.YY_EPS_G'] );
xlswrite('IRF_EPS_G_filtered_6-32.xlsx',[name4]);
xlswrite('IRF_EPS_R_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_R' oo_.irfs.C_EPS_R' ....
                  oo_.irfs.I_EPS_R' oo_.irfs.R_K_EPS_R' oo_.irfs.R_N_EPS_R' oo_.irfs.W_EPS_R' oo_.irfs.L_EPS_R'...
                  oo_.irfs.PPI_EPS_R' oo_.irfs.MU_A_EPS_R' oo_.irfs.YY_EPS_R'] );
xlswrite('IRF_EPS_R_filtered_6-32.xlsx',[name5]);
xlswrite('IRF_EPS_P_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_P' oo_.irfs.C_EPS_P' ....
                  oo_.irfs.I_EPS_P' oo_.irfs.R_K_EPS_P' oo_.irfs.R_N_EPS_P' oo_.irfs.W_EPS_P' oo_.irfs.L_EPS_P'...
                  oo_.irfs.PPI_EPS_P' oo_.irfs.MU_A_EPS_P' oo_.irfs.YY_EPS_P'] );
xlswrite('IRF_EPS_P_filtered_6-32.xlsx',[name6]);
xlswrite('IRF_EPS_W_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_W' oo_.irfs.C_EPS_W' ....
                  oo_.irfs.I_EPS_W' oo_.irfs.R_K_EPS_W' oo_.irfs.R_N_EPS_W' oo_.irfs.W_EPS_W' oo_.irfs.L_EPS_W'...
                  oo_.irfs.PPI_EPS_W' oo_.irfs.MU_A_EPS_W' oo_.irfs.YY_EPS_W'] );
xlswrite('IRF_EPS_W_filtered_6-32.xlsx',[name7]);
xlswrite('IRF_EPS_LAMBDA_filtered_6-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_LAMBDA' oo_.irfs.C_EPS_LAMBDA' ....
                  oo_.irfs.I_EPS_LAMBDA' oo_.irfs.R_K_EPS_LAMBDA' oo_.irfs.R_N_EPS_LAMBDA' oo_.irfs.W_EPS_LAMBDA' oo_.irfs.L_EPS_LAMBDA'...
                  oo_.irfs.PPI_EPS_LAMBDA' oo_.irfs.MU_A_EPS_LAMBDA' oo_.irfs.YY_EPS_LAMBDA'] );
xlswrite('IRF_EPS_LAMBDA_filtered_6-32.xlsx',[name8]);
options_.SpectralDensity.trigger = 1;
options_.bandpass.indicator = 1;
options_.irf = 200;
options_.loglinear = 1;
options_.nodisplay = 1;
options_.order = 1;
options_.graph_format = char('fig');
options_.bandpass.passband = [8;32;];
var_list_ = char('Y','C','I','R_K','R_N','W','L','PPI','MU_A','DY_OBS','DC_OBS','DI_OBS','DW_OBS','PI_OBS','R_N_OBS','L_OBS','YY');
info = stoch_simul(var_list_);
xlswrite('IRF_EPS_B_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_B' oo_.irfs.C_EPS_B' ....
                  oo_.irfs.I_EPS_B' oo_.irfs.R_K_EPS_B' oo_.irfs.R_N_EPS_B' oo_.irfs.W_EPS_B' oo_.irfs.L_EPS_B'...
                  oo_.irfs.PPI_EPS_B' oo_.irfs.MU_A_EPS_B' oo_.irfs.YY_EPS_B'] );
xlswrite('IRF_EPS_B_filtered_8-32.xlsx',[name1]);
xlswrite('IRF_EPS_L_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_L' oo_.irfs.C_EPS_L' ....
                  oo_.irfs.I_EPS_L' oo_.irfs.R_K_EPS_L' oo_.irfs.R_N_EPS_L' oo_.irfs.W_EPS_L' oo_.irfs.L_EPS_L'...
                  oo_.irfs.PPI_EPS_L' oo_.irfs.MU_A_EPS_L' oo_.irfs.YY_EPS_L'] );
xlswrite('IRF_EPS_L_filtered_8-32.xlsx',[name2]);
xlswrite('IRF_EPS_I_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_I' oo_.irfs.C_EPS_I' ....
                  oo_.irfs.I_EPS_I' oo_.irfs.R_K_EPS_I' oo_.irfs.R_N_EPS_I' oo_.irfs.W_EPS_I' oo_.irfs.L_EPS_I'...
                  oo_.irfs.PPI_EPS_I' oo_.irfs.MU_A_EPS_I' oo_.irfs.YY_EPS_I'] );
xlswrite('IRF_EPS_I_filtered_8-32.xlsx',[name3]);
xlswrite('IRF_EPS_G_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_G' oo_.irfs.C_EPS_G' ....
                  oo_.irfs.I_EPS_G' oo_.irfs.R_K_EPS_G' oo_.irfs.R_N_EPS_G' oo_.irfs.W_EPS_G' oo_.irfs.L_EPS_G'...
                  oo_.irfs.PPI_EPS_G' oo_.irfs.MU_A_EPS_G' oo_.irfs.YY_EPS_G'] );
xlswrite('IRF_EPS_G_filtered_8-32.xlsx',[name4]);
xlswrite('IRF_EPS_R_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_R' oo_.irfs.C_EPS_R' ....
                  oo_.irfs.I_EPS_R' oo_.irfs.R_K_EPS_R' oo_.irfs.R_N_EPS_R' oo_.irfs.W_EPS_R' oo_.irfs.L_EPS_R'...
                  oo_.irfs.PPI_EPS_R' oo_.irfs.MU_A_EPS_R' oo_.irfs.YY_EPS_R'] );
xlswrite('IRF_EPS_R_filtered_8-32.xlsx',[name5]);
xlswrite('IRF_EPS_P_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_P' oo_.irfs.C_EPS_P' ....
                  oo_.irfs.I_EPS_P' oo_.irfs.R_K_EPS_P' oo_.irfs.R_N_EPS_P' oo_.irfs.W_EPS_P' oo_.irfs.L_EPS_P'...
                  oo_.irfs.PPI_EPS_P' oo_.irfs.MU_A_EPS_P' oo_.irfs.YY_EPS_P'] );
xlswrite('IRF_EPS_P_filtered_8-32.xlsx',[name6]);
xlswrite('IRF_EPS_W_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_W' oo_.irfs.C_EPS_W' ....
                  oo_.irfs.I_EPS_W' oo_.irfs.R_K_EPS_W' oo_.irfs.R_N_EPS_W' oo_.irfs.W_EPS_W' oo_.irfs.L_EPS_W'...
                  oo_.irfs.PPI_EPS_W' oo_.irfs.MU_A_EPS_W' oo_.irfs.YY_EPS_W'] );
xlswrite('IRF_EPS_W_filtered_8-32.xlsx',[name7]);
xlswrite('IRF_EPS_LAMBDA_filtered_8-32.xlsx',[box1;box1; oo_.irfs.Y_EPS_LAMBDA' oo_.irfs.C_EPS_LAMBDA' ....
                  oo_.irfs.I_EPS_LAMBDA' oo_.irfs.R_K_EPS_LAMBDA' oo_.irfs.R_N_EPS_LAMBDA' oo_.irfs.W_EPS_LAMBDA' oo_.irfs.L_EPS_LAMBDA'...
                  oo_.irfs.PPI_EPS_LAMBDA' oo_.irfs.MU_A_EPS_LAMBDA' oo_.irfs.YY_EPS_LAMBDA'] );
xlswrite('IRF_EPS_LAMBDA_filtered_8-32.xlsx',[name8]);
options_.SpectralDensity.trigger = 1;
options_.bandpass.indicator = 1;
options_.irf = 200;
options_.loglinear = 1;
options_.nodisplay = 1;
options_.order = 1;
options_.graph_format = char('fig');
options_.bandpass.passband = [32;9999;];
var_list_ = char('Y','C','I','R_K','R_N','W','L','PPI','MU_A','DY_OBS','DC_OBS','DI_OBS','DW_OBS','PI_OBS','R_N_OBS','L_OBS','YY');
info = stoch_simul(var_list_);
xlswrite('IRF_EPS_B_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_B' oo_.irfs.C_EPS_B' ....
                  oo_.irfs.I_EPS_B' oo_.irfs.R_K_EPS_B' oo_.irfs.R_N_EPS_B' oo_.irfs.W_EPS_B' oo_.irfs.L_EPS_B'...
                  oo_.irfs.PPI_EPS_B' oo_.irfs.MU_A_EPS_B' oo_.irfs.YY_EPS_B'] );
xlswrite('IRF_EPS_B_filtered_32-.xlsx',[name1]);
xlswrite('IRF_EPS_L_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_L' oo_.irfs.C_EPS_L' ....
                  oo_.irfs.I_EPS_L' oo_.irfs.R_K_EPS_L' oo_.irfs.R_N_EPS_L' oo_.irfs.W_EPS_L' oo_.irfs.L_EPS_L'...
                  oo_.irfs.PPI_EPS_L' oo_.irfs.MU_A_EPS_L' oo_.irfs.YY_EPS_L'] );
xlswrite('IRF_EPS_L_filtered_32-.xlsx',[name2]);
xlswrite('IRF_EPS_I_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_I' oo_.irfs.C_EPS_I' ....
                  oo_.irfs.I_EPS_I' oo_.irfs.R_K_EPS_I' oo_.irfs.R_N_EPS_I' oo_.irfs.W_EPS_I' oo_.irfs.L_EPS_I'...
                  oo_.irfs.PPI_EPS_I' oo_.irfs.MU_A_EPS_I' oo_.irfs.YY_EPS_I'] );
xlswrite('IRF_EPS_I_filtered_32-.xlsx',[name3]);
xlswrite('IRF_EPS_G_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_G' oo_.irfs.C_EPS_G' ....
                  oo_.irfs.I_EPS_G' oo_.irfs.R_K_EPS_G' oo_.irfs.R_N_EPS_G' oo_.irfs.W_EPS_G' oo_.irfs.L_EPS_G'...
                  oo_.irfs.PPI_EPS_G' oo_.irfs.MU_A_EPS_G' oo_.irfs.YY_EPS_G'] );
xlswrite('IRF_EPS_G_filtered_32-.xlsx',[name4]);
xlswrite('IRF_EPS_R_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_R' oo_.irfs.C_EPS_R' ....
                  oo_.irfs.I_EPS_R' oo_.irfs.R_K_EPS_R' oo_.irfs.R_N_EPS_R' oo_.irfs.W_EPS_R' oo_.irfs.L_EPS_R'...
                  oo_.irfs.PPI_EPS_R' oo_.irfs.MU_A_EPS_R' oo_.irfs.YY_EPS_R'] );
xlswrite('IRF_EPS_R_filtered_32-.xlsx',[name5]);
xlswrite('IRF_EPS_P_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_P' oo_.irfs.C_EPS_P' ....
                  oo_.irfs.I_EPS_P' oo_.irfs.R_K_EPS_P' oo_.irfs.R_N_EPS_P' oo_.irfs.W_EPS_P' oo_.irfs.L_EPS_P'...
                  oo_.irfs.PPI_EPS_P' oo_.irfs.MU_A_EPS_P' oo_.irfs.YY_EPS_P'] );
xlswrite('IRF_EPS_P_filtered_32-.xlsx',[name6]);
xlswrite('IRF_EPS_W_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_W' oo_.irfs.C_EPS_W' ....
                  oo_.irfs.I_EPS_W' oo_.irfs.R_K_EPS_W' oo_.irfs.R_N_EPS_W' oo_.irfs.W_EPS_W' oo_.irfs.L_EPS_W'...
                  oo_.irfs.PPI_EPS_W' oo_.irfs.MU_A_EPS_W' oo_.irfs.YY_EPS_W'] );
xlswrite('IRF_EPS_W_filtered_32-.xlsx',[name7]);
xlswrite('IRF_EPS_LAMBDA_filtered_32-.xlsx',[box1;box1; oo_.irfs.Y_EPS_LAMBDA' oo_.irfs.C_EPS_LAMBDA' ....
                  oo_.irfs.I_EPS_LAMBDA' oo_.irfs.R_K_EPS_LAMBDA' oo_.irfs.R_N_EPS_LAMBDA' oo_.irfs.W_EPS_LAMBDA' oo_.irfs.L_EPS_LAMBDA'...
                  oo_.irfs.PPI_EPS_LAMBDA' oo_.irfs.MU_A_EPS_LAMBDA' oo_.irfs.YY_EPS_LAMBDA'] );
xlswrite('IRF_EPS_LAMBDA_filtered_32-.xlsx',[name8]);
save('EGNNr1_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('EGNNr1_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('EGNNr1_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('EGNNr1_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('EGNNr1_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('EGNNr1_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('EGNNr1_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
