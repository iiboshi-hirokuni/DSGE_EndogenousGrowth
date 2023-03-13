function [residual, g1, g2, g3] = STANDARDr1_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(38, 1);
B_k__ = params(1)/params(3)-1+params(4);
Delta_k__ = params(4)-B_k__/(1+params(6));
Wss__ = (1-params(13))*(1/(1+params(16))*(params(13)/params(21))^params(13))^(1/(1-params(13)));
R_nss__ = params(1)*params(11)/params(3);
Yss__ = (params(13)/params(21)/(1+params(16)))^(params(13)/(1-params(13)));
Iss__ = (params(13)/B_k__/(1+params(16)))^(1/(1-params(13)))*(params(4)+params(1)-1);
Css__ = (1-params(12))*Yss__-Iss__;
Lambda_css__ = (params(1)-params(3)*params(2))/(params(1)-params(2))/Css__;
Gamma_l__ = 1/(1+params(9))*Lambda_css__*Wss__/params(31)^params(10);
S__ = 0.5*params(5)*(y(39)*y(19)/y(2)-1)^2;
S_prime__ = params(5)*(y(39)*y(19)/y(2)-1);
S_prime_ld__ = params(5)*(y(68)*y(57)/y(19)-1);
T140 = 1-S__-y(19)*y(39)*S_prime__/y(2);
T147 = (y(68)*y(57)/y(19))^2;
T166 = (y(3)*y(26)/y(17))^params(13);
T168 = y(25)^(1-params(13));
T183 = y(25)^(1+params(10));
T191 = params(11)^(1-params(7));
T192 = y(27)^params(7)*T191;
T197 = T192/y(61)*y(29)/y(62);
T198 = T197/y(68);
T203 = params(3)*params(8)*T198^((1+params(10))*(-(1+params(9)))/params(9));
T211 = (-1)/params(9);
T213 = params(3)*params(8)*T198^T211;
T234 = T191*y(4)^params(7);
T238 = T234/y(27)*y(5)/y(39);
T263 = params(11)^(1-params(14));
T264 = y(27)^params(14)*T263;
T265 = T264/y(61);
T268 = T265^((-(1+params(16)))/params(16));
T271 = y(23)*params(15)*T268*y(65);
T276 = (-1)/params(16);
T277 = T265^T276;
T280 = y(23)*params(15)*T277*y(66);
T294 = T263*y(4)^params(14);
lhs =y(16);
rhs =y(40)*y(17)/(y(17)*y(18)-params(2)*y(1))-params(2)*params(3)*y(69)/(y(55)*y(56)-params(2)*y(18));
residual(1)= lhs-rhs;
lhs =y(23);
rhs =params(3)*y(54)/y(16)/y(55);
residual(2)= lhs-rhs;
lhs =y(23);
rhs =y(61)/y(36);
residual(3)= lhs-rhs;
lhs =y(35);
rhs =y(20)*y(22);
residual(4)= lhs-rhs;
lhs =y(20);
rhs =y(23)*(y(67)*y(60)+y(58)*(1-y(59)));
residual(5)= lhs-rhs;
lhs =1;
rhs =y(20)*y(42)*T140+params(1)*y(58)*y(23)*y(70)*S_prime_ld__*T147;
residual(6)= lhs-rhs;
lhs =y(24);
rhs =(1-y(21))*y(3)/y(17)+y(19)*y(42)*(1-S__);
residual(7)= lhs-rhs;
lhs =y(37);
rhs =T166*T168;
residual(8)= lhs-rhs;
lhs =y(37);
rhs =y(19)+y(18)+params(12)*Yss__*y(43);
residual(9)= lhs-rhs;
lhs =y(31);
rhs =y(40)*y(41)*Gamma_l__*T183+T203*y(63);
residual(10)= lhs-rhs;
lhs =y(32);
rhs =y(25)*y(16)*y(29)+T213*y(64);
residual(11)= lhs-rhs;
lhs =y(30)/y(29);
rhs =(y(31)*(1+params(9)*y(46))/y(32))^(params(9)/(params(9)+params(10)+params(9)*params(10)));
residual(12)= lhs-rhs;
lhs =y(29)^T211;
rhs =params(8)*T238^T211+(1-params(8))*y(30)^T211;
residual(13)= lhs-rhs;
lhs =y(25);
rhs =y(37)*(1-params(13))*y(38)/y(29);
residual(14)= lhs-rhs;
lhs =y(3)*y(26);
rhs =y(17)*y(37)*params(13)*y(38)/y(35);
residual(15)= lhs-rhs;
lhs =y(33);
rhs =y(37)*y(38)+y(55)*T271;
residual(16)= lhs-rhs;
lhs =y(34);
rhs =y(37)+y(55)*T280;
residual(17)= lhs-rhs;
lhs =y(28)/y(27);
rhs =y(33)*(1+params(16)*y(45))/y(34);
residual(18)= lhs-rhs;
lhs =y(27)^T276;
rhs =params(15)*T294^T276+(1-params(15))*y(28)^T276;
residual(19)= lhs-rhs;
lhs =log(y(36));
rhs =params(17)*log(y(6))+(1-params(17))*(log(R_nss__)+params(18)*log(y(27)/params(11))+params(19)*log(y(37)/Yss__))+log(y(44));
residual(20)= lhs-rhs;
lhs =y(21);
rhs =Delta_k__+B_k__*y(26)^(1+params(6))/(1+params(6));
residual(21)= lhs-rhs;
lhs =y(22);
rhs =B_k__*y(26)^params(6);
residual(22)= lhs-rhs;
lhs =y(17);
rhs =params(1)*y(39);
residual(23)= lhs-rhs;
lhs =log(y(39));
rhs =params(44)*log(y(8))+x(it_, 1);
residual(24)= lhs-rhs;
lhs =log(y(40));
rhs =params(45)*log(y(9))+x(it_, 2);
residual(25)= lhs-rhs;
lhs =log(y(41));
rhs =params(46)*log(y(10))+x(it_, 3);
residual(26)= lhs-rhs;
lhs =log(y(42));
rhs =params(47)*log(y(11))+x(it_, 4);
residual(27)= lhs-rhs;
lhs =log(y(43));
rhs =params(48)*log(y(12))+x(it_, 5);
residual(28)= lhs-rhs;
lhs =log(y(44));
rhs =params(49)*log(y(13))+x(it_, 6);
residual(29)= lhs-rhs;
lhs =log(y(45));
rhs =params(50)*log(y(14))+x(it_, 7);
residual(30)= lhs-rhs;
lhs =log(y(46));
rhs =params(51)*log(y(15))+x(it_, 8);
residual(31)= lhs-rhs;
lhs =y(47);
rhs =y(17)*y(37)/y(7);
residual(32)= lhs-rhs;
lhs =y(48);
rhs =y(17)*y(18)/y(1);
residual(33)= lhs-rhs;
lhs =y(49);
rhs =y(19)*y(17)/y(2);
residual(34)= lhs-rhs;
lhs =y(50);
rhs =y(17)*y(29)/y(5);
residual(35)= lhs-rhs;
lhs =y(51);
rhs =y(36);
residual(36)= lhs-rhs;
lhs =y(52);
rhs =y(27);
residual(37)= lhs-rhs;
lhs =y(53);
rhs =y(25)*params(20);
residual(38)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(38, 78);

  %
  % Jacobian matrix
  %

T446 = getPowerDeriv(y(3)*y(26)/y(17),params(13),1);
T496 = 2*(y(39)*y(19)/y(2)-1);
T616 = getPowerDeriv(T238,T211,1);
T631 = y(29)*T191*getPowerDeriv(y(27),params(7),1)/y(61)/y(62)/y(68);
T632 = getPowerDeriv(T198,(1+params(10))*(-(1+params(9)))/params(9),1);
T637 = getPowerDeriv(T198,T211,1);
T652 = T263*getPowerDeriv(y(27),params(14),1)/y(61);
T653 = getPowerDeriv(T265,(-(1+params(16)))/params(16),1);
T659 = getPowerDeriv(T265,T276,1);
T680 = y(29)*(-T192)/(y(61)*y(61))/y(62)/y(68);
T714 = T192/y(61)/y(62)/y(68);
T737 = (-(T192/y(61)*y(29)))/(y(62)*y(62))/y(68);
T751 = getPowerDeriv(y(31)*(1+params(9)*y(46))/y(32),params(9)/(params(9)+params(10)+params(9)*params(10)),1);
  g1(1,16)=1;
  g1(1,17)=(-((y(40)*(y(17)*y(18)-params(2)*y(1))-y(40)*y(17)*y(18))/((y(17)*y(18)-params(2)*y(1))*(y(17)*y(18)-params(2)*y(1)))));
  g1(1,55)=(-(params(2)*params(3)*y(69)*y(56)))/((y(55)*y(56)-params(2)*y(18))*(y(55)*y(56)-params(2)*y(18)));
  g1(1,1)=(-((-(y(40)*y(17)*(-params(2))))/((y(17)*y(18)-params(2)*y(1))*(y(17)*y(18)-params(2)*y(1)))));
  g1(1,18)=(-((-(y(17)*y(40)*y(17)))/((y(17)*y(18)-params(2)*y(1))*(y(17)*y(18)-params(2)*y(1)))-(-(params(2)*params(3)*y(69)*(-params(2))))/((y(55)*y(56)-params(2)*y(18))*(y(55)*y(56)-params(2)*y(18)))));
  g1(1,56)=(-(params(2)*params(3)*y(69)*y(55)))/((y(55)*y(56)-params(2)*y(18))*(y(55)*y(56)-params(2)*y(18)));
  g1(1,40)=(-(y(17)/(y(17)*y(18)-params(2)*y(1))));
  g1(1,69)=params(3)*params(2)/(y(55)*y(56)-params(2)*y(18));
  g1(2,16)=(-((-(params(3)*y(54)))/(y(16)*y(16))/y(55)));
  g1(2,54)=(-(params(3)/y(16)/y(55)));
  g1(2,55)=(-((-(params(3)*y(54)/y(16)))/(y(55)*y(55))));
  g1(2,23)=1;
  g1(3,23)=1;
  g1(3,61)=(-(1/y(36)));
  g1(3,36)=(-((-y(61))/(y(36)*y(36))));
  g1(4,20)=(-y(22));
  g1(4,22)=(-y(20));
  g1(4,35)=1;
  g1(5,20)=1;
  g1(5,58)=(-(y(23)*(1-y(59))));
  g1(5,59)=(-(y(23)*(-y(58))));
  g1(5,23)=(-(y(67)*y(60)+y(58)*(1-y(59))));
  g1(5,60)=(-(y(23)*y(67)));
  g1(5,67)=(-(y(23)*y(60)));
  g1(6,2)=(-(y(20)*y(42)*((-(0.5*params(5)*(-(y(39)*y(19)))/(y(2)*y(2))*T496))-(y(2)*y(19)*y(39)*params(5)*(-(y(39)*y(19)))/(y(2)*y(2))-y(19)*y(39)*S_prime__)/(y(2)*y(2)))));
  g1(6,19)=(-(y(20)*y(42)*((-(0.5*params(5)*T496*y(39)/y(2)))-(y(39)*S_prime__+y(19)*y(39)*params(5)*y(39)/y(2))/y(2))+params(1)*(T147*y(58)*y(23)*y(70)*params(5)*(-(y(68)*y(57)))/(y(19)*y(19))+y(58)*y(23)*y(70)*S_prime_ld__*(-(y(68)*y(57)))/(y(19)*y(19))*2*y(68)*y(57)/y(19))));
  g1(6,57)=(-(params(1)*(T147*y(58)*y(23)*y(70)*params(5)*y(68)/y(19)+y(58)*y(23)*y(70)*S_prime_ld__*2*y(68)*y(57)/y(19)*y(68)/y(19))));
  g1(6,20)=(-(y(42)*T140));
  g1(6,58)=(-(params(1)*T147*y(23)*y(70)*S_prime_ld__));
  g1(6,23)=(-(params(1)*T147*S_prime_ld__*y(58)*y(70)));
  g1(6,39)=(-(y(20)*y(42)*((-(0.5*params(5)*y(19)/y(2)*T496))-y(19)*(S_prime__+y(39)*params(5)*y(19)/y(2))/y(2))));
  g1(6,68)=(-(params(1)*(T147*y(58)*y(23)*y(70)*params(5)*y(57)/y(19)+y(58)*y(23)*y(70)*S_prime_ld__*2*y(68)*y(57)/y(19)*y(57)/y(19))));
  g1(6,42)=(-(y(20)*T140));
  g1(6,70)=(-(params(1)*T147*S_prime_ld__*y(23)*y(58)));
  g1(7,17)=(-((-((1-y(21))*y(3)))/(y(17)*y(17))));
  g1(7,2)=(-(y(19)*y(42)*(-(0.5*params(5)*(-(y(39)*y(19)))/(y(2)*y(2))*T496))));
  g1(7,19)=(-(y(42)*(1-S__)+y(19)*y(42)*(-(0.5*params(5)*T496*y(39)/y(2)))));
  g1(7,21)=(-((-y(3))/y(17)));
  g1(7,3)=(-((1-y(21))/y(17)));
  g1(7,24)=1;
  g1(7,39)=(-(y(19)*y(42)*(-(0.5*params(5)*y(19)/y(2)*T496))));
  g1(7,42)=(-(y(19)*(1-S__)));
  g1(8,17)=(-(T168*(-(y(3)*y(26)))/(y(17)*y(17))*T446));
  g1(8,3)=(-(T168*T446*y(26)/y(17)));
  g1(8,25)=(-(T166*getPowerDeriv(y(25),1-params(13),1)));
  g1(8,26)=(-(T168*T446*y(3)/y(17)));
  g1(8,37)=1;
  g1(9,18)=(-1);
  g1(9,19)=(-1);
  g1(9,37)=1;
  g1(9,43)=(-(params(12)*Yss__));
  g1(10,25)=(-(y(40)*y(41)*Gamma_l__*getPowerDeriv(y(25),1+params(10),1)));
  g1(10,27)=(-(y(63)*params(3)*params(8)*T631*T632));
  g1(10,61)=(-(y(63)*params(3)*params(8)*T632*T680));
  g1(10,29)=(-(y(63)*params(3)*params(8)*T632*T714));
  g1(10,62)=(-(y(63)*params(3)*params(8)*T632*T737));
  g1(10,31)=1;
  g1(10,63)=(-T203);
  g1(10,68)=(-(y(63)*params(3)*params(8)*T632*(-T197)/(y(68)*y(68))));
  g1(10,40)=(-(T183*y(41)*Gamma_l__));
  g1(10,41)=(-(T183*y(40)*Gamma_l__));
  g1(11,16)=(-(y(25)*y(29)));
  g1(11,25)=(-(y(16)*y(29)));
  g1(11,27)=(-(y(64)*params(3)*params(8)*T631*T637));
  g1(11,61)=(-(y(64)*params(3)*params(8)*T637*T680));
  g1(11,29)=(-(y(16)*y(25)+y(64)*params(3)*params(8)*T637*T714));
  g1(11,62)=(-(y(64)*params(3)*params(8)*T637*T737));
  g1(11,32)=1;
  g1(11,64)=(-T213);
  g1(11,68)=(-(y(64)*params(3)*params(8)*T637*(-T197)/(y(68)*y(68))));
  g1(12,29)=(-y(30))/(y(29)*y(29));
  g1(12,30)=1/y(29);
  g1(12,31)=(-((1+params(9)*y(46))/y(32)*T751));
  g1(12,32)=(-(T751*(-(y(31)*(1+params(9)*y(46))))/(y(32)*y(32))));
  g1(12,46)=(-(T751*params(9)*y(31)/y(32)));
  g1(13,4)=(-(params(8)*y(5)*T191*getPowerDeriv(y(4),params(7),1)/y(27)/y(39)*T616));
  g1(13,27)=(-(params(8)*T616*y(5)*(-T234)/(y(27)*y(27))/y(39)));
  g1(13,5)=(-(params(8)*T616*T234/y(27)/y(39)));
  g1(13,29)=getPowerDeriv(y(29),T211,1);
  g1(13,30)=(-((1-params(8))*getPowerDeriv(y(30),T211,1)));
  g1(13,39)=(-(params(8)*T616*(-(T234/y(27)*y(5)))/(y(39)*y(39))));
  g1(14,25)=1;
  g1(14,29)=(-((-(y(37)*(1-params(13))*y(38)))/(y(29)*y(29))));
  g1(14,37)=(-((1-params(13))*y(38)/y(29)));
  g1(14,38)=(-((1-params(13))*y(37)/y(29)));
  g1(15,17)=(-(y(37)*params(13)*y(38)/y(35)));
  g1(15,3)=y(26);
  g1(15,26)=y(3);
  g1(15,35)=(-(y(17)*(-(y(37)*params(13)*y(38)))/(y(35)*y(35))));
  g1(15,37)=(-(y(17)*params(13)*y(38)/y(35)));
  g1(15,38)=(-(y(17)*params(13)*y(37)/y(35)));
  g1(16,55)=(-T271);
  g1(16,23)=(-(y(55)*y(65)*params(15)*T268));
  g1(16,27)=(-(y(55)*y(65)*y(23)*params(15)*T652*T653));
  g1(16,61)=(-(y(55)*y(65)*y(23)*params(15)*T653*(-T264)/(y(61)*y(61))));
  g1(16,33)=1;
  g1(16,65)=(-(y(55)*y(23)*params(15)*T268));
  g1(16,37)=(-y(38));
  g1(16,38)=(-y(37));
  g1(17,55)=(-T280);
  g1(17,23)=(-(y(55)*y(66)*params(15)*T277));
  g1(17,27)=(-(y(55)*y(66)*y(23)*params(15)*T652*T659));
  g1(17,61)=(-(y(55)*y(66)*y(23)*params(15)*T659*(-T264)/(y(61)*y(61))));
  g1(17,34)=1;
  g1(17,66)=(-(y(55)*y(23)*params(15)*T277));
  g1(17,37)=(-1);
  g1(18,27)=(-y(28))/(y(27)*y(27));
  g1(18,28)=1/y(27);
  g1(18,33)=(-((1+params(16)*y(45))/y(34)));
  g1(18,34)=(-((-(y(33)*(1+params(16)*y(45))))/(y(34)*y(34))));
  g1(18,45)=(-(params(16)*y(33)/y(34)));
  g1(19,4)=(-(params(15)*T263*getPowerDeriv(y(4),params(14),1)*getPowerDeriv(T294,T276,1)));
  g1(19,27)=getPowerDeriv(y(27),T276,1);
  g1(19,28)=(-((1-params(15))*getPowerDeriv(y(28),T276,1)));
  g1(20,27)=(-((1-params(17))*params(18)*1/params(11)/(y(27)/params(11))));
  g1(20,6)=(-(params(17)*1/y(6)));
  g1(20,36)=1/y(36);
  g1(20,37)=(-((1-params(17))*params(19)*1/Yss__/(y(37)/Yss__)));
  g1(20,44)=(-(1/y(44)));
  g1(21,21)=1;
  g1(21,26)=(-(B_k__*getPowerDeriv(y(26),1+params(6),1)/(1+params(6))));
  g1(22,22)=1;
  g1(22,26)=(-(B_k__*getPowerDeriv(y(26),params(6),1)));
  g1(23,17)=1;
  g1(23,39)=(-params(1));
  g1(24,8)=(-(params(44)*1/y(8)));
  g1(24,39)=1/y(39);
  g1(24,71)=(-1);
  g1(25,9)=(-(params(45)*1/y(9)));
  g1(25,40)=1/y(40);
  g1(25,72)=(-1);
  g1(26,10)=(-(params(46)*1/y(10)));
  g1(26,41)=1/y(41);
  g1(26,73)=(-1);
  g1(27,11)=(-(params(47)*1/y(11)));
  g1(27,42)=1/y(42);
  g1(27,74)=(-1);
  g1(28,12)=(-(params(48)*1/y(12)));
  g1(28,43)=1/y(43);
  g1(28,75)=(-1);
  g1(29,13)=(-(params(49)*1/y(13)));
  g1(29,44)=1/y(44);
  g1(29,76)=(-1);
  g1(30,14)=(-(params(50)*1/y(14)));
  g1(30,45)=1/y(45);
  g1(30,77)=(-1);
  g1(31,15)=(-(params(51)*1/y(15)));
  g1(31,46)=1/y(46);
  g1(31,78)=(-1);
  g1(32,17)=(-(y(37)/y(7)));
  g1(32,7)=(-((-(y(17)*y(37)))/(y(7)*y(7))));
  g1(32,37)=(-(y(17)/y(7)));
  g1(32,47)=1;
  g1(33,17)=(-(y(18)/y(1)));
  g1(33,1)=(-((-(y(17)*y(18)))/(y(1)*y(1))));
  g1(33,18)=(-(y(17)/y(1)));
  g1(33,48)=1;
  g1(34,17)=(-(y(19)/y(2)));
  g1(34,2)=(-((-(y(19)*y(17)))/(y(2)*y(2))));
  g1(34,19)=(-(y(17)/y(2)));
  g1(34,49)=1;
  g1(35,17)=(-(y(29)/y(5)));
  g1(35,5)=(-((-(y(17)*y(29)))/(y(5)*y(5))));
  g1(35,29)=(-(y(17)/y(5)));
  g1(35,50)=1;
  g1(36,36)=(-1);
  g1(36,51)=1;
  g1(37,27)=(-1);
  g1(37,52)=1;
  g1(38,25)=(-params(20));
  g1(38,53)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],38,6084);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],38,474552);
end
end
end
end
