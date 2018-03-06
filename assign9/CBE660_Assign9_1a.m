clc
clear all
close all hidden

% For figure 4.2
x=[-2:0.05:2] ;
y=[-2:0.05:2] ;
sigma=1 ;
m=[0,0] ;
X=zeros(length(x),length(y)) ;
n=2 ;
P=inv([3.5 2.5;2.5 4]) ;

% For figure 4.3
b=zeros(length(x),length(y)) ;
A=[0.7 -0.5;-0.5 1] ;



% build the mesh/grid
for i=1:length(x)
    for j=1:length(y)
        xy(1,1)=x(i) ;
        xy(1,2)=y(j) ;
        
        % calculate the normal distribution
        prob(j,i)=((2*pi)^(n/2)*(det(P))^0.5)^(-1)*exp(-0.5*(xy-m)*inv(P)*(xy-m)') ;
        
        % For figure 4.3
        b(j,i)=xy*A*xy' ;
    end
end

figure(1)
mesh(y,x,prob+0.5)
    xlabel('x2')
    ylabel('x1')
    zlabel('Probability')
    set(gca,'ZTick',[0.5:0.1:1])
    z={'0','','0.2','','0.4'} ;
    set(gca,'ZTickLabel',z)
hold on
contour(y,x,prob,[(1-0.95)/2 (1-0.75)/2 (1-0.5)/2] )

v=0.5
AA=inv(A) ;
c1=(AA(1,1)*v).^0.5 ;
c2=(AA(2,2)*v).^0.5 ;
c1Box=[-c1 c1 c1 -c1 -c1];
c2Box=[-c2 -c2 c2 c2 -c2 ] ;

[V,L]=eig(A) ;
r1=sqrt(v/L(1,1))*V(:,1) ;
r2=sqrt(v/L(2,2))*V(:,2) ;

figure(2)
contour(x,y,b,[v v])
    hold on
plot(c1Box,c2Box)
    hold on 
plot(-[0 r1(1)],-[0 r1(2)])
    hold on
plot([0 r2(1)],[0 r2(2)])
    xlabel('x2')
    ylabel('x1')



