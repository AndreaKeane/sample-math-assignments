clear

k1=1;
k2=1;

A=[-k1 k2; k1 -k2];
[S,E,W]=eig(A);
x0=[2;1];
A1=S*E*W^(-1); % This check my eigen decomp

t=linspace(0,10);
%x=x0(1)*S(:,1)*exp(E(1,1)*t)+x0(2)*S(:,2)*exp(E(2,2)*t);

xt=[];
for i=1:100
    x=S*expm(E*t(i))*S^(-1)*x0;
    xt(1,i)=x(1);
    xt(2,i)=x(2);
end


figure
plot(t,xt)
axis([0,10,0,2])
title('Problem 1, k1=1, k2=1, x0=[2,1]')
legend('xA','xB')