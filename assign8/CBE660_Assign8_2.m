clear all
L=1 ;
a0=[1e-10,2,4,8] ;
x=-1:0.01:1 ;
K=-100:1:100 ;
f=zeros(length(a0),length(x)) ;
Error=zeros(length(a0),length(x)) ;

for i=1:length(a0)
    a=a0(i) ;
    G(i,:)=exp(-a*x.^2) ;
  for j=1:length(K)
    k=K(j) ;
    
    f(i,:)=f(i,:)+1/2*(a/pi)^-0.5 .*exp(-k^2*pi^2/4/a).*exp(1i*k*x*pi) ;
    
    Error(i,j)=mean(abs(G(i,:)-real(f(i,:)))) ;

  end
   
end



figure (1)
    subplot(2,2,1)
    plot(Error(1,:))
    axis([100,200,0,0.05])
    title('a=1e-10')

    subplot(2,2,2)
    plot(Error(2,:))
    axis([100,200,0,0.05])
    title('a=2')

    subplot(2,2,3)
    plot(Error(3,:))
    axis([100,200,0,0.05])
    title('a=4')

    subplot(2,2,4)
    plot(Error(4,:))
    axis([100,200,0,0.05])
    title('a=8')

figure (2)
    subplot(2,2,1)
    plot(x,real(f(1,:)),x,G(1,:))
    title('a=1e-10')
   

    subplot(2,2,2)
    plot(x,real(f(2,:)),x,G(2,:))
    title('a=2')

    subplot(2,2,3)
    plot(x,real(f(3,:)),x,G(3,:))
    title('a=4')

    subplot(2,2,4)
    plot(x,real(f(4,:)),x,G(4,:))
    title('a=8')

