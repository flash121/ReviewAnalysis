function r=d2_alhood(a,D,K)
% This algorithm assume alpha is a vector with same param, is a
% a alpha parameter,
% K number of topic,
% D number of document,

r=(D * (K * K * psi(3,K * a) - K * psi(3,a)));