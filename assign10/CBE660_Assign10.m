clear all

T=linspace(300,500,10) ;
ln_k0=1 ;
E=100 ;
var=0.001

for i=1:length(T)
    
    %generate e
    e=normrnd(0,var);
    
    %calculate the rate constant
    ln_k(i,1)=ln_k0-E/T(i)+e;
    k(i)=exp(ln_k(i)) ;
    
    %Set up least squares
    A(i,1)=1 ;
    A(i,2)=-1./T(i) ;
end

x_ls=inv(A'*A)*A'*ln_k ;

ln_k_ls=x_ls(1)-x_ls(2)./T ;
k_ls=exp(ln_k_ls) ;
    
figure(1)
scatter(T,k)
hold on
plot(T,k_ls)
    title('4.31.a')
    xlabel('Temperature (K)')
    ylabel('rate contant, k')

figure(2)
scatter(1./T,ln_k)
hold on
plot(1./T ,log(k_ls))
    title('4.31.a')
    xlabel('1/Temperature (K)')
    ylabel('ln rate contant, k')

    
    
% Chi-squared distribution
P=var*inv(A'*A) ;
chi2=chi2inv(0.95,2) ;
c1=sqrt(P(1,1)*chi2) ;
c2=sqrt(P(2,2)*chi2) ;

[v,l]=eig(inv(P)) ;
v1=-sqrt(chi2/l(1,1))*v(:,1)+x_ls ; 
v2=-sqrt(chi2/l(2,2))*v(:,2)+x_ls ; 

% Ellipse
figure(3)
syms x1 x2
x=[x1; x2]-x_ls ;
f=x'*inv(P)*x==chi2 ; 
ezplot(f,[0.7,1.3,30,170])
hold on
plot(x_ls(1),x_ls(2))
    title('4.31 Probability (\alpha=0.95) Ellipse')
    xlabel('x1')
    ylabel('x2')

% Bounding Box 
box1=[-c1+x_ls(1), c1+x_ls(1), c1+x_ls(1), -c1+x_ls(1), -c1+x_ls(1)];
box2=[c2+x_ls(2), c2+x_ls(2), -c2+x_ls(2), -c2+x_ls(2), c2+x_ls(2)] ;
hold on
plot(box1,box2)

% Vectors
hold on
plot([x_ls(1) v1(1)],[x_ls(2) v1(2)])
hold on
plot([x_ls(1) v2(1)],[x_ls(2) v2(2)])
