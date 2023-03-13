function [residual, g1, g2, g3] = EGver1_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 50, 1);

%
% Model equations
%

Sdfss__ = params(2)/params(33);
R_kss__ = params(33)/params(2)+params(42)-1;
Mu_vss__ = params(33)^((1-params(9))/params(10));
Deltatil_ass__ = Mu_vss__-1+params(63);
Sss__ = 1/(1+params(13))/(1+params(11));
Kss__ = params(33)*(params(9)*Sss__/R_kss__)^(1/(1-params(9)));
Iss__ = (params(42)+params(33)-1)/params(33)*Kss__;
Yss__ = (Kss__/params(33))^params(9);
Ass__ = (1-params(63))*params(48)/((1-params(63))*params(48)+Deltatil_ass__);
I_dss__ = Yss__*params(23);
Wss__ = Yss__*(1-params(9))*Sss__;
Gamma_ass__ = Yss__*Sss__*params(2)*params(11)/(Mu_vss__-params(2)*(1-params(63)));
P_vss__ = Gamma_ass__;
Jss__ = params(48)*(1-params(63))*(1-params(7))*P_vss__/(1-params(33)*(1-params(63))/Mu_vss__*(1-params(48)*(1-params(7)))*Sdfss__);
I_ass__ = params(48)*(1-params(63))*params(7)*(P_vss__-Sdfss__*params(33)/Mu_vss__*Jss__);
Phiss__ = (Mu_vss__-1+params(6))/Ass__/Mu_vss__/I_dss__;
Css__ = Yss__*(1-params(22)-params(23))-Iss__-I_ass__*(1/Ass__-1);
Lambda_css__ = (params(33)-params(2)*params(1))/(params(33)-params(1))/Css__;
Yyss__ = Iss__+Css__+Yss__*params(22);
B_k__ = params(33)/params(2)+params(42)-1;
Delta_k__ = params(42)-B_k__/(1+params(4));
Chi_z__ = Ass__*Phiss__*I_dss__^(1-params(5));
Lambda_zero__ = params(48)/I_ass__^params(7);
Gamma_l__ = Lambda_css__*Wss__/(1+params(17));
S_f__ = 0.5*params(3)*(y(4)/params(33)-1)^2;
S_f_prime__ = params(3)*(y(4)/params(33)-1);
S_f_prime_ld__ = params(3)*(y(4)/params(33)-1);
S_a__ = 0.5*params(8)*(y(13)/params(34)-1)^2;
S_a_prime__ = params(8)*(y(13)/params(34)-1);
T195 = y(3)*y(4)/y(3)/params(33);
T204 = T195^2;
T230 = y(29)^(1-params(5));
T237 = (1-params(6))/y(13)/y(35);
T249 = y(28)^params(7);
T253 = 1/y(35)-1;
T258 = y(4)/y(13);
T285 = (y(17)*y(19)/y(4))^params(9);
T287 = y(10)^(1-params(9));
T306 = y(22)*y(13)/y(22)/params(34);
T315 = T306^2;
T337 = params(53)^(1-params(14));
T338 = y(31)^params(14)*T337;
T339 = T338/y(31);
T342 = T339^((-(1+params(13)))/params(13));
T343 = y(6)*params(12)*y(4)*T342;
T359 = (-1)/params(13);
T374 = y(10)^(1+params(15));
T381 = params(53)^(1-params(18));
T382 = y(31)^params(18)*T381;
T386 = params(33)*y(9)*T382/y(31)/y(9);
T387 = T386/y(4);
T392 = params(2)*params(16)*T387^((1+params(15))*(-(1+params(17)))/params(17));
T399 = (-1)/params(17);
T400 = T387^T399;
lhs =y(5);
rhs =y(4)*y(36)/(y(4)*y(2)-params(1)*y(2))-params(2)*params(1)*y(36)/(y(4)*y(2)-params(1)*y(2));
residual(1)= lhs-rhs;
lhs =y(4)*y(6);
rhs =params(2)*y(5)/y(5);
residual(2)= lhs-rhs;
lhs =y(6);
rhs =y(31)/y(7);
residual(3)= lhs-rhs;
lhs =y(16);
rhs =y(18)*y(21);
residual(4)= lhs-rhs;
lhs =1;
rhs =y(18)*y(38)*(1-S_f__-S_f_prime__*T195)+y(38)*y(18)*params(34)*y(6)*S_f_prime_ld__*T204;
residual(5)= lhs-rhs;
lhs =y(18);
rhs =y(6)*(y(16)*y(17)+y(18)*(1-y(20)));
residual(6)= lhs-rhs;
lhs =y(20);
rhs =Delta_k__+B_k__*y(17)^(1+params(4))/(1+params(4));
residual(7)= lhs-rhs;
lhs =y(21);
rhs =B_k__*y(17)^params(4);
residual(8)= lhs-rhs;
lhs =y(27);
rhs =Chi_z__/y(35)/T230;
residual(9)= lhs-rhs;
lhs =y(29);
rhs =y(6)*y(4)*(1-params(6))*(1/y(35)-T237)*y(25);
residual(10)= lhs-rhs;
lhs =y(26);
rhs =Lambda_zero__*y(43)*T249;
residual(11)= lhs-rhs;
lhs =y(22);
rhs =(1-params(63))*y(26)*T253;
residual(12)= lhs-rhs;
lhs =y(28);
rhs =(1-params(63))*params(7)*y(26)*(y(23)-y(25)*y(6)*T258);
residual(13)= lhs-rhs;
lhs =y(25);
rhs =(1-params(63))*(y(23)*(1-params(7))*y(26)+y(25)*y(6)*T258*(1-(1-params(7))*y(26)));
residual(14)= lhs-rhs;
lhs =y(13);
rhs =1-params(63)+y(22)*(1-S_a__);
residual(15)= lhs-rhs;
lhs =y(4);
rhs =y(13)^(params(10)/(1-params(9)));
residual(16)= lhs-rhs;
lhs =y(1);
rhs =T285*T287;
residual(17)= lhs-rhs;
lhs =y(16);
rhs =y(1)*y(4)*params(9)*y(14)/y(17)/y(19);
residual(18)= lhs-rhs;
lhs =y(9);
rhs =y(1)*(1-params(9))*y(14)/y(10);
residual(19)= lhs-rhs;
lhs =y(23);
rhs =y(24)*(1-S_a__-S_a_prime__*T306)+S_a_prime__*y(24)*y(6)*y(4)*y(13)*params(34)*T315;
residual(20)= lhs-rhs;
lhs =y(13)*y(24)/y(4);
rhs =y(6)*((1-params(63))*y(24)+y(1)*params(11)*y(14));
residual(21)= lhs-rhs;
lhs =y(15);
rhs =(1+params(11))*y(14);
residual(22)= lhs-rhs;
lhs =y(32);
rhs =y(1)*y(15)+y(32)*T343;
residual(23)= lhs-rhs;
lhs =y(33);
rhs =y(1)+T343*y(33);
residual(24)= lhs-rhs;
lhs =y(30)/y(31);
rhs =y(32)*(1+params(13)*y(41))/y(33);
residual(25)= lhs-rhs;
lhs =1;
rhs =params(12)*T339^T359+(1-params(12))*(y(30)/y(31))^T359;
residual(26)= lhs-rhs;
lhs =y(12);
rhs =y(36)*Gamma_l__*y(37)*T374+y(12)*T392;
residual(27)= lhs-rhs;
lhs =y(11);
rhs =y(10)*y(5)*y(9)+y(11)*params(2)*params(16)*T400;
residual(28)= lhs-rhs;
lhs =y(8)/y(9);
rhs =(y(12)*(1+params(17)*y(42))/y(11))^(params(17)/(params(17)+params(15)+params(17)*params(15)));
residual(29)= lhs-rhs;
lhs =1;
rhs =params(16)*T400+(1-params(16))*(y(8)/y(9))^T399;
residual(30)= lhs-rhs;
lhs =y(1);
rhs =y(29)+y(3)+y(2)+y(28)*T253+Yss__*params(22)*y(39);
residual(31)= lhs-rhs;
lhs =log(y(7));
rhs =log(y(7))*params(19)+(1-params(19))*(log(params(27))+params(20)*log(y(31)/params(53))+params(21)*log(y(34)/Yyss__))+log(y(40));
residual(32)= lhs-rhs;
lhs =y(34);
rhs =y(3)+y(2)+Yss__*params(22)*y(39);
residual(33)= lhs-rhs;
lhs =y(19);
rhs =(1-y(20))*y(19)/y(4)+y(3)*y(38)*(1-S_f__);
residual(34)= lhs-rhs;
lhs =1/y(35);
rhs =T237+y(27)*y(29);
residual(35)= lhs-rhs;
lhs =log(y(36));
rhs =log(y(36))*params(65)+x(1);
residual(36)= lhs-rhs;
lhs =log(y(37));
rhs =log(y(37))*params(66)+x(2);
residual(37)= lhs-rhs;
lhs =log(y(38));
rhs =log(y(38))*params(67)+x(3);
residual(38)= lhs-rhs;
lhs =log(y(39));
rhs =log(y(39))*params(68)+x(4);
residual(39)= lhs-rhs;
lhs =log(y(40));
rhs =log(y(40))*params(69)+x(5);
residual(40)= lhs-rhs;
lhs =log(y(41));
rhs =log(y(41))*params(70)+x(6);
residual(41)= lhs-rhs;
lhs =log(y(42));
rhs =log(y(42))*params(71)+x(7);
residual(42)= lhs-rhs;
lhs =log(y(43));
rhs =log(y(43))*params(72)+x(8);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(4)*y(34)/y(34);
residual(44)= lhs-rhs;
lhs =y(45);
rhs =y(4)*y(2)/y(2);
residual(45)= lhs-rhs;
lhs =y(46);
rhs =y(3)*y(4)/y(3);
residual(46)= lhs-rhs;
lhs =y(47);
rhs =y(4)*y(9)/y(9);
residual(47)= lhs-rhs;
lhs =y(49);
rhs =y(7);
residual(48)= lhs-rhs;
lhs =y(48);
rhs =y(31);
residual(49)= lhs-rhs;
lhs =y(50);
rhs =y(10)*params(73);
residual(50)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(50, 50);

  %
  % Jacobian matrix
  %

T565 = 1/params(33);
T602 = getPowerDeriv(y(17)*y(19)/y(4),params(9),1);
T625 = getPowerDeriv(T387,(1+params(15))*(-(1+params(17)))/params(17),1);
T630 = getPowerDeriv(T387,T399,1);
T679 = getPowerDeriv(y(8)/y(9),T399,1);
T707 = getPowerDeriv(y(12)*(1+params(17)*y(42))/y(11),params(17)/(params(17)+params(15)+params(17)*params(15)),1);
T718 = (-((-(1-params(6)))/(y(13)*y(13))/y(35)));
T735 = 1/params(34);
T739 = (-(0.5*params(8)*T735*2*(y(13)/params(34)-1)));
T865 = getPowerDeriv(y(30)/y(31),T359,1);
T875 = (y(31)*T337*getPowerDeriv(y(31),params(14),1)-T338)/(y(31)*y(31));
T878 = y(6)*params(12)*y(4)*T875*getPowerDeriv(T339,(-(1+params(13)))/params(13),1);
T900 = params(33)*y(9)*(y(31)*T381*getPowerDeriv(y(31),params(18),1)-T382)/(y(31)*y(31))/y(9)/y(4);
T937 = (-1)/(y(35)*y(35))-(-((1-params(6))/y(13)))/(y(35)*y(35));
  g1(1,2)=(-((-(y(4)*y(36)*(y(4)-params(1))))/((y(4)*y(2)-params(1)*y(2))*(y(4)*y(2)-params(1)*y(2)))-(-(params(2)*params(1)*y(36)*(y(4)-params(1))))/((y(4)*y(2)-params(1)*y(2))*(y(4)*y(2)-params(1)*y(2)))));
  g1(1,4)=(-((y(36)*(y(4)*y(2)-params(1)*y(2))-y(4)*y(36)*y(2))/((y(4)*y(2)-params(1)*y(2))*(y(4)*y(2)-params(1)*y(2)))-(-(y(2)*params(2)*params(1)*y(36)))/((y(4)*y(2)-params(1)*y(2))*(y(4)*y(2)-params(1)*y(2)))));
  g1(1,5)=1;
  g1(1,36)=(-(y(4)/(y(4)*y(2)-params(1)*y(2))-params(2)*params(1)/(y(4)*y(2)-params(1)*y(2))));
  g1(2,4)=y(6);
  g1(2,6)=y(4);
  g1(3,6)=1;
  g1(3,7)=(-((-y(31))/(y(7)*y(7))));
  g1(3,31)=(-(1/y(7)));
  g1(4,16)=1;
  g1(4,18)=(-y(21));
  g1(4,21)=(-y(18));
  g1(5,4)=(-(y(18)*y(38)*((-(0.5*params(3)*T565*2*(y(4)/params(33)-1)))-(T195*params(3)*T565+S_f_prime__*T565))+T204*y(38)*y(18)*params(34)*y(6)*params(3)*T565+y(38)*y(18)*params(34)*y(6)*S_f_prime_ld__*T565*2*T195));
  g1(5,6)=(-(T204*S_f_prime_ld__*y(38)*params(34)*y(18)));
  g1(5,18)=(-(y(38)*(1-S_f__-S_f_prime__*T195)+T204*S_f_prime_ld__*y(38)*params(34)*y(6)));
  g1(5,38)=(-(y(18)*(1-S_f__-S_f_prime__*T195)+T204*y(18)*params(34)*y(6)*S_f_prime_ld__));
  g1(6,6)=(-(y(16)*y(17)+y(18)*(1-y(20))));
  g1(6,16)=(-(y(6)*y(17)));
  g1(6,17)=(-(y(6)*y(16)));
  g1(6,18)=1-y(6)*(1-y(20));
  g1(6,20)=(-(y(6)*(-y(18))));
  g1(7,17)=(-(B_k__*getPowerDeriv(y(17),1+params(4),1)/(1+params(4))));
  g1(7,20)=1;
  g1(8,17)=(-(B_k__*getPowerDeriv(y(17),params(4),1)));
  g1(8,21)=1;
  g1(9,27)=1;
  g1(9,29)=(-((-(Chi_z__/y(35)*getPowerDeriv(y(29),1-params(5),1)))/(T230*T230)));
  g1(9,35)=(-((-Chi_z__)/(y(35)*y(35))/T230));
  g1(10,4)=(-(y(25)*y(6)*(1-params(6))*(1/y(35)-T237)));
  g1(10,6)=(-(y(4)*(1-params(6))*(1/y(35)-T237)*y(25)));
  g1(10,13)=(-(y(25)*y(6)*y(4)*(1-params(6))*T718));
  g1(10,25)=(-(y(6)*y(4)*(1-params(6))*(1/y(35)-T237)));
  g1(10,29)=1;
  g1(10,35)=(-(y(25)*y(6)*y(4)*(1-params(6))*T937));
  g1(11,26)=1;
  g1(11,28)=(-(Lambda_zero__*y(43)*getPowerDeriv(y(28),params(7),1)));
  g1(11,43)=(-(Lambda_zero__*T249));
  g1(12,22)=1;
  g1(12,26)=(-((1-params(63))*T253));
  g1(12,35)=(-((1-params(63))*y(26)*(-1)/(y(35)*y(35))));
  g1(13,4)=(-((1-params(63))*params(7)*y(26)*(-(y(25)*y(6)*1/y(13)))));
  g1(13,6)=(-((1-params(63))*params(7)*y(26)*(-(y(25)*T258))));
  g1(13,13)=(-((1-params(63))*params(7)*y(26)*(-(y(25)*y(6)*(-y(4))/(y(13)*y(13))))));
  g1(13,23)=(-((1-params(63))*params(7)*y(26)));
  g1(13,25)=(-((1-params(63))*params(7)*y(26)*(-(y(6)*T258))));
  g1(13,26)=(-((1-params(63))*params(7)*(y(23)-y(25)*y(6)*T258)));
  g1(13,28)=1;
  g1(14,4)=(-((1-params(63))*y(25)*y(6)*(1-(1-params(7))*y(26))*1/y(13)));
  g1(14,6)=(-((1-params(63))*y(25)*T258*(1-(1-params(7))*y(26))));
  g1(14,13)=(-((1-params(63))*y(25)*y(6)*(1-(1-params(7))*y(26))*(-y(4))/(y(13)*y(13))));
  g1(14,23)=(-((1-params(63))*(1-params(7))*y(26)));
  g1(14,25)=1-(1-params(63))*y(6)*T258*(1-(1-params(7))*y(26));
  g1(14,26)=(-((1-params(63))*((1-params(7))*y(23)+y(25)*y(6)*T258*(-(1-params(7))))));
  g1(15,13)=1-y(22)*T739;
  g1(15,22)=(-(1-S_a__));
  g1(16,4)=1;
  g1(16,13)=(-(getPowerDeriv(y(13),params(10)/(1-params(9)),1)));
  g1(17,1)=1;
  g1(17,4)=(-(T287*(-(y(17)*y(19)))/(y(4)*y(4))*T602));
  g1(17,10)=(-(T285*getPowerDeriv(y(10),1-params(9),1)));
  g1(17,17)=(-(T287*T602*y(19)/y(4)));
  g1(17,19)=(-(T287*T602*y(17)/y(4)));
  g1(18,1)=(-(y(4)*params(9)*y(14)/y(17)/y(19)));
  g1(18,4)=(-(y(1)*params(9)*y(14)/y(17)/y(19)));
  g1(18,14)=(-(y(1)*params(9)*y(4)/y(17)/y(19)));
  g1(18,16)=1;
  g1(18,17)=(-((-(y(1)*y(4)*params(9)*y(14)))/(y(17)*y(17))/y(19)));
  g1(18,19)=(-((-(y(1)*y(4)*params(9)*y(14)/y(17)))/(y(19)*y(19))));
  g1(19,1)=(-((1-params(9))*y(14)/y(10)));
  g1(19,9)=1;
  g1(19,10)=(-((-(y(1)*(1-params(9))*y(14)))/(y(10)*y(10))));
  g1(19,14)=(-((1-params(9))*y(1)/y(10)));
  g1(20,4)=(-(T315*S_a_prime__*y(24)*y(6)*y(13)*params(34)));
  g1(20,6)=(-(T315*S_a_prime__*y(24)*y(4)*y(13)*params(34)));
  g1(20,13)=(-(y(24)*(T739-(T306*params(8)*T735+S_a_prime__*T735))+T315*(y(24)*y(6)*y(4)*y(13)*params(34)*params(8)*T735+S_a_prime__*y(24)*y(6)*y(4)*params(34))+S_a_prime__*y(24)*y(6)*y(4)*y(13)*params(34)*T735*2*T306));
  g1(20,23)=1;
  g1(20,24)=(-(1-S_a__-S_a_prime__*T306+T315*S_a_prime__*y(6)*y(4)*y(13)*params(34)));
  g1(21,1)=(-(y(6)*params(11)*y(14)));
  g1(21,4)=(-(y(13)*y(24)))/(y(4)*y(4));
  g1(21,6)=(-((1-params(63))*y(24)+y(1)*params(11)*y(14)));
  g1(21,13)=y(24)/y(4);
  g1(21,14)=(-(y(6)*params(11)*y(1)));
  g1(21,24)=y(13)/y(4)-(1-params(63))*y(6);
  g1(22,14)=(-(1+params(11)));
  g1(22,15)=1;
  g1(23,1)=(-y(15));
  g1(23,4)=(-(y(32)*T342*params(12)*y(6)));
  g1(23,6)=(-(y(32)*params(12)*y(4)*T342));
  g1(23,15)=(-y(1));
  g1(23,31)=(-(y(32)*T878));
  g1(23,32)=1-T343;
  g1(24,1)=(-1);
  g1(24,4)=(-(y(33)*T342*params(12)*y(6)));
  g1(24,6)=(-(y(33)*params(12)*y(4)*T342));
  g1(24,31)=(-(y(33)*T878));
  g1(24,33)=1-T343;
  g1(25,30)=1/y(31);
  g1(25,31)=(-y(30))/(y(31)*y(31));
  g1(25,32)=(-((1+params(13)*y(41))/y(33)));
  g1(25,33)=(-((-(y(32)*(1+params(13)*y(41))))/(y(33)*y(33))));
  g1(25,41)=(-(params(13)*y(32)/y(33)));
  g1(26,30)=(-((1-params(12))*1/y(31)*T865));
  g1(26,31)=(-(params(12)*T875*getPowerDeriv(T339,T359,1)+(1-params(12))*T865*(-y(30))/(y(31)*y(31))));
  g1(27,4)=(-(y(12)*params(2)*params(16)*(-T386)/(y(4)*y(4))*T625));
  g1(27,10)=(-(y(36)*Gamma_l__*y(37)*getPowerDeriv(y(10),1+params(15),1)));
  g1(27,12)=1-T392;
  g1(27,31)=(-(y(12)*params(2)*params(16)*T625*T900));
  g1(27,36)=(-(T374*Gamma_l__*y(37)));
  g1(27,37)=(-(y(36)*Gamma_l__*T374));
  g1(28,4)=(-(y(11)*params(2)*params(16)*(-T386)/(y(4)*y(4))*T630));
  g1(28,5)=(-(y(10)*y(9)));
  g1(28,9)=(-(y(5)*y(10)));
  g1(28,10)=(-(y(5)*y(9)));
  g1(28,11)=1-params(2)*params(16)*T400;
  g1(28,31)=(-(y(11)*params(2)*params(16)*T630*T900));
  g1(29,8)=1/y(9);
  g1(29,9)=(-y(8))/(y(9)*y(9));
  g1(29,11)=(-((-(y(12)*(1+params(17)*y(42))))/(y(11)*y(11))*T707));
  g1(29,12)=(-(T707*(1+params(17)*y(42))/y(11)));
  g1(29,42)=(-(T707*params(17)*y(12)/y(11)));
  g1(30,4)=(-(params(16)*(-T386)/(y(4)*y(4))*T630));
  g1(30,8)=(-((1-params(16))*1/y(9)*T679));
  g1(30,9)=(-((1-params(16))*T679*(-y(8))/(y(9)*y(9))));
  g1(30,31)=(-(params(16)*T630*T900));
  g1(31,1)=1;
  g1(31,2)=(-1);
  g1(31,3)=(-1);
  g1(31,28)=(-T253);
  g1(31,29)=(-1);
  g1(31,35)=(-(y(28)*(-1)/(y(35)*y(35))));
  g1(31,39)=(-(Yss__*params(22)));
  g1(32,7)=1/y(7)-params(19)*1/y(7);
  g1(32,31)=(-((1-params(19))*params(20)*1/params(53)/(y(31)/params(53))));
  g1(32,34)=(-((1-params(19))*params(21)*1/Yyss__/(y(34)/Yyss__)));
  g1(32,40)=(-(1/y(40)));
  g1(33,2)=(-1);
  g1(33,3)=(-1);
  g1(33,34)=1;
  g1(33,39)=(-(Yss__*params(22)));
  g1(34,3)=(-(y(38)*(1-S_f__)));
  g1(34,4)=(-((-((1-y(20))*y(19)))/(y(4)*y(4))+y(3)*y(38)*(-(0.5*params(3)*T565*2*(y(4)/params(33)-1)))));
  g1(34,19)=1-(1-y(20))/y(4);
  g1(34,20)=(-((-y(19))/y(4)));
  g1(34,38)=(-(y(3)*(1-S_f__)));
  g1(35,13)=T718;
  g1(35,27)=(-y(29));
  g1(35,29)=(-y(27));
  g1(35,35)=T937;
  g1(36,36)=1/y(36)-params(65)*1/y(36);
  g1(37,37)=1/y(37)-params(66)*1/y(37);
  g1(38,38)=1/y(38)-params(67)*1/y(38);
  g1(39,39)=1/y(39)-params(68)*1/y(39);
  g1(40,40)=1/y(40)-params(69)*1/y(40);
  g1(41,41)=1/y(41)-params(70)*1/y(41);
  g1(42,42)=1/y(42)-params(71)*1/y(42);
  g1(43,43)=1/y(43)-params(72)*1/y(43);
  g1(44,4)=(-1);
  g1(44,44)=1;
  g1(45,4)=(-1);
  g1(45,45)=1;
  g1(46,4)=(-1);
  g1(46,46)=1;
  g1(47,4)=(-1);
  g1(47,47)=1;
  g1(48,7)=(-1);
  g1(48,49)=1;
  g1(49,31)=(-1);
  g1(49,48)=1;
  g1(50,10)=(-params(73));
  g1(50,50)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],50,2500);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],50,125000);
end
end
end
end
