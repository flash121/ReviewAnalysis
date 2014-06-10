function [likelihood var_gamma phi]=lda_inference(doc, model, var_gamma, phi)
% variational inference
converged=1;
likelihood_old=0;
digamma_gam=zeros(1,model.K);
oldphi=zeros(1,model.K);
for k=1:model.K	%K is the number of topic
    var_gamma(k)=model.alpha+doc.total/(model.K);
    digamma_gam(k)=psi(var_gamma(k));
end
phi=1./model.K.*ones(size(phi));

%var_gamma=(model.alpha+doc.total/(model.K)).*ones(1,model.K);
%digamma_gam=psi(var_gamma);
%phi=(1./model.K).*ones(size(phi));

var_iter=0;
while((converged>1e-5) && (var_iter< 1000))
    var_iter=var_iter+1;
    for n=1:doc.len
        %phisum=0;
        %for k=1:model.K
        %    oldphi(k)=phi(n,k);
        %    phi(n,k)=digamma_gam(k)+model.log_prob_w(k,doc.words(n));
        %    if(k>1)
        %        phisum=log_sum(phisum,phi(n,k));
        %    else
        %        phisum=phisum+phi(n,k);
        %    end
        %end
        phi(n,:)=theory_phi_unorm(doc,var_gamma,model,n);
        %for k=1:model.K
         %   phi(n,k)=exp(phi(n,k)-phisum);
        %    var_gamma(k)=var_gamma(k)+doc.counts(n)*(phi(n,k)-oldphi(k));
         %   digamma_gam(k)=psi(var_gamma(k));
        %end
%         plot1d(doc,var_gamma,model,n);
%         hold on
%         like=compute_likelihood4(doc,model,phi(n,:),var_gamma,n);
%         plot(phi(n,1),like,'r*')
%         hold off
%         pause(0.0001)
%         disp(n)
     end
    var_gamma=update_gamma(doc,phi,model);
    likelihood = compute_likelihood2(doc, model, phi, var_gamma);
    q(var_iter)=likelihood;
    if(isnan(likelihood))
        disp('the likelihood is nan')
        return
    end
    
    converged = (likelihood_old - likelihood) / likelihood_old;
    likelihood_old = likelihood;
end