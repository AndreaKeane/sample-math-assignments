clear all

w1=3600*1.1574e-5 ;
w2=3600*2.3148e-5 ;
w3=3600*3.7037e-4 ;
load=zeros(160,1) ;

t=0:0.2:180 ;

f0=10 ;
f1=5*sin(2*pi*w1*t) ;
f2=2.5*sin(2*pi*w2*t) ;
f3=0.5*sin(2*pi*w3*t) ;

load=f0+f1+f2+f3 ;

figure(1)
plot(t,load)
xlabel('Time(hr)')
ylabel('Load')

figure(2)
plot(t,f0,t,f1,t,f2,t,f3)
xlabel('Time(hr)')
ylabel('Load')
