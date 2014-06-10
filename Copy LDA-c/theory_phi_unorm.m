function s=theory_phi_unorm(doc,var_gamma,model,tar)
gammaSum=sum(var_gamma);
digSum=psi(gammaSum);
dig=psi(var_gamma)-digSum;
s=exp(model.log_prob_w(:,doc.words(tar))'+(dig-1));
s=s./sum(s);
