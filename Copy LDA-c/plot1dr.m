function likelihood=plot1dr(doc,var_gamma,model,phi,k)

ke=0.001:0.001:1;
likelihood=zeros(size(k));
q=compute_likelihood2(doc,model,phi,var_gamma);
q2=vpa(q,20);
disp(['orginal: ' num2str(phi(k,:)) ' likelihood is   '])
q2
for i=1:length(ke)
        phi(k,:)=[ke(i) 1-ke(i)];
        likelihood(i)=compute_likelihood2(doc,model,phi,var_gamma);
end
plot(ke,likelihood)
[a b]=max(likelihood);
disp([num2str(ke(b)) ' ' vpa(a,20)])