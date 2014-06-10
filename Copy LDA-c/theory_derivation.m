function s=theory_derivation(doc,var_gamma,model,phi)
gammaSum=sum(var_gamma);
digSum=psi(gammaSum);
dig=psi(var_gamma)-digSum;
s=model.log_prob_w(:,doc.words(2))'-log(phi)+dig-1;