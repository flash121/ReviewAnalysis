function likelihood=compute_likelihood(doc, model, phi, var_gamma)
    dig=psi(var_gamma);
    var_gamma_sum=sum(var_gamma);    
    digsum = psi(var_gamma_sum);
    
    likelihood = gammaln(model.alpha*model.K)-model.K*gammaln(model.alpha)-gammaln(var_gamma_sum);
    
    for k=1:model.K
        likelihood=likelihood+ (model.alpha-1)*(dig(k)-digsum)+gammaln(var_gamma(k))-(var_gamma(k)-1)*(dig(k)-digsum);
        for n=1:doc.len
            if(phi(n,k)>0)
                likelihood=likelihood+doc.counts(n)*(phi(n,k)*(dig(k)-digsum)-log(phi(n,k))+model.log_prob_w(k,doc.words(n)));
            end
        end
    end
  