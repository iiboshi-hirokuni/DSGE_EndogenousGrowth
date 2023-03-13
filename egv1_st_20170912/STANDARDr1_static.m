function [residual, g1, g2, g3] = STANDARDr1_static(y, x, params)
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

residual = zeros( 38, 1);

%
% Model equations
%

B_k__ = params(1)/params(3)-1+params(4);
Delta_k__ = params(4)-B_k__/(1+params(6));
Wss__ = (1-params(13))*(1/(1+params(16))*(params(13)/params(21))^params(13))^(1/(1-params(13)));
R_nss__ = params(1)*params(11)/params(3);
Yss__ = (params(13)/params(21)/(1+params(16)))^(params(13)/(1-params(13)));
Iss__ = (params(13)/B_k__/(1+params(16)))^(1/(1-params(13)))*(params(4)+params(1)-1);
Css__ = (1-params(12))*Yss__-Iss__;
Lambda_css__ = (params(1)-params(3)*params(2))/(params(1)-params(2))/Css__;
Gamma_l__ = 1/(1+params(9))*Lambda_css__*Wss__/params(31)^params(10);
S__ = 0.5*params(5)*(y(24)*y(4)/y(4)-1)^2;
S_prime__ = params(5)*(y(24)*y(4)/y(4)-1);
S_prime_ld__ = params(5)*(y(24)*y(4)/y(4)-1);
T123 = 1-S__-y(4)*y(24)*S_prime__/y(4);
T129 = (y(24)*y(4)/y(4))^2;
T144 = (y(11)*y(9)/y(2))^params(13);
T146 = y(10)^(1-params(13));
T161 = y(10)^(1+params(10));
T168 = params(11)^(1-params(7));
T169 = y(12)^params(7)*T168;
T172 = T169/y(12)*y(14);
T174 = T172/y(14)/y(24);
T179 = params(3)*params(8)*T174^((1+params(10))*(-(1+params(9)))/params(9));
T186 = (-1)/params(9);
T188 = params(3)*params(8)*T174^T186;
T231 = params(11)^(1-params(14));
T232 = y(12)^params(14)*T231;
T233 = T232/y(12);
T236 = T233^((-(1+params(16)))/params(16));
T238 = y(18)*y(8)*params(15)*T236;
T243 = (-1)/params(16);
T244 = T233^T243;
T246 = y(19)*y(8)*params(15)*T244;
lhs =y(1);
rhs =y(25)*y(2)/(y(2)*y(3)-params(2)*y(3))-params(2)*params(3)*y(25)/(y(2)*y(3)-params(2)*y(3));
residual(1)= lhs-rhs;
lhs =y(8);
rhs =params(3)*y(1)/y(1)/y(2);
residual(2)= lhs-rhs;
lhs =y(8);
rhs =y(12)/y(21);
residual(3)= lhs-rhs;
lhs =y(20);
rhs =y(5)*y(7);
residual(4)= lhs-rhs;
lhs =y(5);
rhs =y(8)*(y(20)*y(11)+y(5)*(1-y(6)));
residual(5)= lhs-rhs;
lhs =1;
rhs =y(5)*y(27)*T123+params(1)*y(5)*y(8)*y(27)*S_prime_ld__*T129;
residual(6)= lhs-rhs;
lhs =y(9);
rhs =(1-y(6))*y(9)/y(2)+y(4)*y(27)*(1-S__);
residual(7)= lhs-rhs;
lhs =y(22);
rhs =T144*T146;
residual(8)= lhs-rhs;
lhs =y(22);
rhs =y(4)+y(3)+params(12)*Yss__*y(28);
residual(9)= lhs-rhs;
lhs =y(16);
rhs =y(25)*y(26)*Gamma_l__*T161+y(16)*T179;
residual(10)= lhs-rhs;
lhs =y(17);
rhs =y(10)*y(1)*y(14)+y(17)*T188;
residual(11)= lhs-rhs;
lhs =y(15)/y(14);
rhs =(y(16)*(1+params(9)*y(31))/y(17))^(params(9)/(params(9)+params(10)+params(9)*params(10)));
residual(12)= lhs-rhs;
lhs =y(14)^T186;
rhs =params(8)*(T172/y(24))^T186+(1-params(8))*y(15)^T186;
residual(13)= lhs-rhs;
lhs =y(10);
rhs =y(22)*(1-params(13))*y(23)/y(14);
residual(14)= lhs-rhs;
lhs =y(11)*y(9);
rhs =y(2)*y(22)*params(13)*y(23)/y(20);
residual(15)= lhs-rhs;
lhs =y(18);
rhs =y(22)*y(23)+y(2)*T238;
residual(16)= lhs-rhs;
lhs =y(19);
rhs =y(22)+y(2)*T246;
residual(17)= lhs-rhs;
lhs =y(13)/y(12);
rhs =y(18)*(1+params(16)*y(30))/y(19);
residual(18)= lhs-rhs;
lhs =y(12)^T243;
rhs =params(15)*T232^T243+(1-params(15))*y(13)^T243;
residual(19)= lhs-rhs;
lhs =log(y(21));
rhs =log(y(21))*params(17)+(1-params(17))*(log(R_nss__)+params(18)*log(y(12)/params(11))+params(19)*log(y(22)/Yss__))+log(y(29));
residual(20)= lhs-rhs;
lhs =y(6);
rhs =Delta_k__+B_k__*y(11)^(1+params(6))/(1+params(6));
residual(21)= lhs-rhs;
lhs =y(7);
rhs =B_k__*y(11)^params(6);
residual(22)= lhs-rhs;
lhs =y(2);
rhs =params(1)*y(24);
residual(23)= lhs-rhs;
lhs =log(y(24));
rhs =log(y(24))*params(44)+x(1);
residual(24)= lhs-rhs;
lhs =log(y(25));
rhs =log(y(25))*params(45)+x(2);
residual(25)= lhs-rhs;
lhs =log(y(26));
rhs =log(y(26))*params(46)+x(3);
residual(26)= lhs-rhs;
lhs =log(y(27));
rhs =log(y(27))*params(47)+x(4);
residual(27)= lhs-rhs;
lhs =log(y(28));
rhs =log(y(28))*params(48)+x(5);
residual(28)= lhs-rhs;
lhs =log(y(29));
rhs =log(y(29))*params(49)+x(6);
residual(29)= lhs-rhs;
lhs =log(y(30));
rhs =log(y(30))*params(50)+x(7);
residual(30)= lhs-rhs;
lhs =log(y(31));
rhs =log(y(31))*params(51)+x(8);
residual(31)= lhs-rhs;
lhs =y(32);
rhs =y(2)*y(22)/y(22);
residual(32)= lhs-rhs;
lhs =y(33);
rhs =y(2)*y(3)/y(3);
residual(33)= lhs-rhs;
lhs =y(34);
rhs =y(4)*y(2)/y(4);
residual(34)= lhs-rhs;
lhs =y(35);
rhs =y(2)*y(14)/y(14);
residual(35)= lhs-rhs;
lhs =y(36);
rhs =y(21);
residual(36)= lhs-rhs;
lhs =y(37);
rhs =y(12);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(10)*params(20);
residual(38)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(38, 38);

  %
  % Jacobian matrix
  %

T391 = getPowerDeriv(y(11)*y(9)/y(2),params(13),1);
T473 = y(14)*(y(12)*T168*getPowerDeriv(y(12),params(7),1)-T169)/(y(12)*y(12));
T475 = T473/y(14)/y(24);
T476 = getPowerDeriv(T174,(1+params(10))*(-(1+params(9)))/params(9),1);
T481 = getPowerDeriv(T174,T186,1);
T487 = getPowerDeriv(T172/y(24),T186,1);
T492 = T231*getPowerDeriv(y(12),params(14),1);
T495 = (y(12)*T492-T232)/(y(12)*y(12));
T543 = getPowerDeriv(y(16)*(1+params(9)*y(31))/y(17),params(9)/(params(9)+params(10)+params(9)*params(10)),1);
T617 = (-(T172/y(14)))/(y(24)*y(24));
  g1(1,1)=1;
  g1(1,2)=(-((y(25)*(y(2)*y(3)-params(2)*y(3))-y(25)*y(2)*y(3))/((y(2)*y(3)-params(2)*y(3))*(y(2)*y(3)-params(2)*y(3)))-(-(y(3)*params(2)*params(3)*y(25)))/((y(2)*y(3)-params(2)*y(3))*(y(2)*y(3)-params(2)*y(3)))));
  g1(1,3)=(-((-(y(25)*y(2)*(y(2)-params(2))))/((y(2)*y(3)-params(2)*y(3))*(y(2)*y(3)-params(2)*y(3)))-(-(params(2)*params(3)*y(25)*(y(2)-params(2))))/((y(2)*y(3)-params(2)*y(3))*(y(2)*y(3)-params(2)*y(3)))));
  g1(1,25)=(-(y(2)/(y(2)*y(3)-params(2)*y(3))-params(3)*params(2)/(y(2)*y(3)-params(2)*y(3))));
  g1(2,2)=(-((-(params(3)*y(1)/y(1)))/(y(2)*y(2))));
  g1(2,8)=1;
  g1(3,8)=1;
  g1(3,12)=(-(1/y(21)));
  g1(3,21)=(-((-y(12))/(y(21)*y(21))));
  g1(4,5)=(-y(7));
  g1(4,7)=(-y(5));
  g1(4,20)=1;
  g1(5,5)=1-y(8)*(1-y(6));
  g1(5,6)=(-(y(8)*(-y(5))));
  g1(5,8)=(-(y(20)*y(11)+y(5)*(1-y(6))));
  g1(5,11)=(-(y(8)*y(20)));
  g1(5,20)=(-(y(8)*y(11)));
  g1(6,5)=(-(y(27)*T123+params(1)*T129*y(8)*y(27)*S_prime_ld__));
  g1(6,8)=(-(params(1)*T129*y(5)*y(27)*S_prime_ld__));
  g1(6,24)=(-(y(5)*y(27)*((-(0.5*params(5)*2*(y(24)*y(4)/y(4)-1)))-y(4)*(S_prime__+params(5)*y(24))/y(4))+params(1)*(T129*params(5)*y(5)*y(8)*y(27)+y(5)*y(8)*y(27)*S_prime_ld__*2*y(24)*y(4)/y(4))));
  g1(6,27)=(-(y(5)*T123+params(1)*T129*S_prime_ld__*y(8)*y(5)));
  g1(7,2)=(-((-((1-y(6))*y(9)))/(y(2)*y(2))));
  g1(7,4)=(-(y(27)*(1-S__)));
  g1(7,6)=(-((-y(9))/y(2)));
  g1(7,9)=1-(1-y(6))/y(2);
  g1(7,24)=(-(y(4)*y(27)*(-(0.5*params(5)*2*(y(24)*y(4)/y(4)-1)))));
  g1(7,27)=(-(y(4)*(1-S__)));
  g1(8,2)=(-(T146*(-(y(11)*y(9)))/(y(2)*y(2))*T391));
  g1(8,9)=(-(T146*T391*y(11)/y(2)));
  g1(8,10)=(-(T144*getPowerDeriv(y(10),1-params(13),1)));
  g1(8,11)=(-(T146*T391*y(9)/y(2)));
  g1(8,22)=1;
  g1(9,3)=(-1);
  g1(9,4)=(-1);
  g1(9,22)=1;
  g1(9,28)=(-(params(12)*Yss__));
  g1(10,10)=(-(y(25)*y(26)*Gamma_l__*getPowerDeriv(y(10),1+params(10),1)));
  g1(10,12)=(-(y(16)*params(3)*params(8)*T475*T476));
  g1(10,16)=1-T179;
  g1(10,24)=(-(y(16)*params(3)*params(8)*T476*T617));
  g1(10,25)=(-(T161*y(26)*Gamma_l__));
  g1(10,26)=(-(T161*y(25)*Gamma_l__));
  g1(11,1)=(-(y(10)*y(14)));
  g1(11,10)=(-(y(1)*y(14)));
  g1(11,12)=(-(y(17)*params(3)*params(8)*T475*T481));
  g1(11,14)=(-(y(1)*y(10)));
  g1(11,17)=1-T188;
  g1(11,24)=(-(y(17)*params(3)*params(8)*T481*T617));
  g1(12,14)=(-y(15))/(y(14)*y(14));
  g1(12,15)=1/y(14);
  g1(12,16)=(-((1+params(9)*y(31))/y(17)*T543));
  g1(12,17)=(-(T543*(-(y(16)*(1+params(9)*y(31))))/(y(17)*y(17))));
  g1(12,31)=(-(T543*params(9)*y(16)/y(17)));
  g1(13,12)=(-(params(8)*T473/y(24)*T487));
  g1(13,14)=getPowerDeriv(y(14),T186,1)-params(8)*T487*T169/y(12)/y(24);
  g1(13,15)=(-((1-params(8))*getPowerDeriv(y(15),T186,1)));
  g1(13,24)=(-(params(8)*T487*(-T172)/(y(24)*y(24))));
  g1(14,10)=1;
  g1(14,14)=(-((-(y(22)*(1-params(13))*y(23)))/(y(14)*y(14))));
  g1(14,22)=(-((1-params(13))*y(23)/y(14)));
  g1(14,23)=(-((1-params(13))*y(22)/y(14)));
  g1(15,2)=(-(y(22)*params(13)*y(23)/y(20)));
  g1(15,9)=y(11);
  g1(15,11)=y(9);
  g1(15,20)=(-(y(2)*(-(y(22)*params(13)*y(23)))/(y(20)*y(20))));
  g1(15,22)=(-(y(2)*params(13)*y(23)/y(20)));
  g1(15,23)=(-(y(2)*params(13)*y(22)/y(20)));
  g1(16,2)=(-T238);
  g1(16,8)=(-(y(2)*y(18)*params(15)*T236));
  g1(16,12)=(-(y(2)*y(18)*y(8)*params(15)*T495*getPowerDeriv(T233,(-(1+params(16)))/params(16),1)));
  g1(16,18)=1-y(2)*y(8)*params(15)*T236;
  g1(16,22)=(-y(23));
  g1(16,23)=(-y(22));
  g1(17,2)=(-T246);
  g1(17,8)=(-(y(2)*y(19)*params(15)*T244));
  g1(17,12)=(-(y(2)*y(19)*y(8)*params(15)*T495*getPowerDeriv(T233,T243,1)));
  g1(17,19)=1-y(2)*y(8)*params(15)*T244;
  g1(17,22)=(-1);
  g1(18,12)=(-y(13))/(y(12)*y(12));
  g1(18,13)=1/y(12);
  g1(18,18)=(-((1+params(16)*y(30))/y(19)));
  g1(18,19)=(-((-(y(18)*(1+params(16)*y(30))))/(y(19)*y(19))));
  g1(18,30)=(-(params(16)*y(18)/y(19)));
  g1(19,12)=getPowerDeriv(y(12),T243,1)-params(15)*T492*getPowerDeriv(T232,T243,1);
  g1(19,13)=(-((1-params(15))*getPowerDeriv(y(13),T243,1)));
  g1(20,12)=(-((1-params(17))*params(18)*1/params(11)/(y(12)/params(11))));
  g1(20,21)=1/y(21)-params(17)*1/y(21);
  g1(20,22)=(-((1-params(17))*params(19)*1/Yss__/(y(22)/Yss__)));
  g1(20,29)=(-(1/y(29)));
  g1(21,6)=1;
  g1(21,11)=(-(B_k__*getPowerDeriv(y(11),1+params(6),1)/(1+params(6))));
  g1(22,7)=1;
  g1(22,11)=(-(B_k__*getPowerDeriv(y(11),params(6),1)));
  g1(23,2)=1;
  g1(23,24)=(-params(1));
  g1(24,24)=1/y(24)-params(44)*1/y(24);
  g1(25,25)=1/y(25)-params(45)*1/y(25);
  g1(26,26)=1/y(26)-params(46)*1/y(26);
  g1(27,27)=1/y(27)-params(47)*1/y(27);
  g1(28,28)=1/y(28)-params(48)*1/y(28);
  g1(29,29)=1/y(29)-params(49)*1/y(29);
  g1(30,30)=1/y(30)-params(50)*1/y(30);
  g1(31,31)=1/y(31)-params(51)*1/y(31);
  g1(32,2)=(-1);
  g1(32,32)=1;
  g1(33,2)=(-1);
  g1(33,33)=1;
  g1(34,2)=(-1);
  g1(34,34)=1;
  g1(35,2)=(-1);
  g1(35,35)=1;
  g1(36,21)=(-1);
  g1(36,36)=1;
  g1(37,12)=(-1);
  g1(37,37)=1;
  g1(38,10)=(-params(20));
  g1(38,38)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],38,1444);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],38,54872);
end
end
end
end
