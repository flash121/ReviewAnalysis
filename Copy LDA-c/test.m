function s=test(k)
x=[1:10:1000];
s=k*psi(k*x);
plot(s,'b')
hold on
s2=k*psi(x);
plot(s2,'r')
s=20*(s-s2);
%self.numDocs * (gammaln(self.numTopics * a) - self.numTopics * gammaln(a)) + (a - 1) * self.alphaSuffStats