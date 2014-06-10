function likelihood=plot1d(doc,var_gamma,model,target)

k=0.001:0.001:1;
likelihood=zeros(size(k));
for i=1:length(k)
        likelihood(i)=compute_likelihood4(doc,model,[k(i) 1-k(i)],var_gamma,target);
end
plot(k,likelihood)