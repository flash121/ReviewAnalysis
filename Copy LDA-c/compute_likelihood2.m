function likelihood=compute_likelihood2(doc,model,phi,var_gamma)
%phi=phi./repmat(sum(phi')',[1 model.K]);
gammaSum=sum(var_gamma);
digSum=psi(gammaSum);
dig=psi(var_gamma)-digSum;
likelihood=gammaln(model.alpha*model.K)-model.K*gammaln(model.alpha)-gammaln(gammaSum);
likelihood=likelihood+sum((model.alpha-1).*dig+gammaln(var_gamma)-(var_gamma-1).*dig);

for n=1:doc.len
    partial=phi(n,:).*(  dig-log(phi(n,:))  +   model.log_prob_w(:,doc.words(n))'  );
    partial(isnan(partial))=0;
    likelihood=likelihood+doc.counts(n).*sum(partial);
end

