function likelihood=compute_likelihood4(doc,model,phi,var_gamma,target)
%phi=phi./repmat(sum(phi')',[1 model.K]);
% What has been proofed:
%   1. 100Ka
phi(2)=1-phi(1);
gammaSum=sum(var_gamma);
digSum=psi(gammaSum);
dig=psi(var_gamma)-digSum;
likelihood=phi(1)*(dig(1)-log(phi(1))+ model.log_prob_w(1,doc.words(target))');
likelihood=likelihood+phi(2)*(dig(2)-log(phi(2))+ model.log_prob_w(2,doc.words(target))');


