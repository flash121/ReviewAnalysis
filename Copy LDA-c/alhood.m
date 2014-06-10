function r=alhood(a,ss,D,K)
% This algorithm assume alpha is a vector with same param, is a
% a alpha parameter,
% K number of topic,
% D number of document,
% ss the remind part which is digamma(sum(gamma))-sum(digamma(gamma)) %    which will be removed in the hessian matrix

r=D*(gammaln(K*a)-K*gammaln(a))+(a-1)*ss;
