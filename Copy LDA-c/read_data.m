function c=read_data(D,nd,nw)
    l=zeros(1,nd);
for i=1:nd
    temp=D(D(:,3)==i,:);
    c.docs{i}.words=temp(:,1);
    c.docs{i}.counts=temp(:,2);
    c.docs{i}.len=size(temp,1);
    l(i)=c.docs{i}.len;
    c.docs{i}.total=temp(1,4);
end
c.nd=nd;
c.nw=nw;
c.max_len=max(l);