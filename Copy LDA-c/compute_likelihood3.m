function likelihood=compute_likelihood3(model,var_gamma)
dig=psi(var_gamma)-repmat(psi(sum(var_gamma')'),[1 5]);
likelihood=20*(gammaln(model.alpha*model.K)-model.K*gammaln(model.alpha));
likelihood=likelihood+(model.alpha-1).*sum(sum(dig));
