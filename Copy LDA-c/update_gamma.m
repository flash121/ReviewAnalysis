function g=update_gamma(doc,phi,model)
q=phi(1:doc.len,:);
qw=zeros(size(q));
for i=1:size(q,1)
qw(i,:)=q(i,:).*doc.counts(i);
end
g=model.alpha+sum(qw);
