%%
%Matlab求解复杂积分问题
clear;
clc;
%%
%参数设定
Vm=6*10^(-6);
Xn=(-0.8)*10^(-5);
R2D=10/4;
m=2.7*10^4;
R=0.3;
D=3.6*10^(-2);
K1=4*10^(-24);

%%
%复杂积分
syms w;
T1=0.0001:0.0001:1;
T2=1:1:10^7;%区间分段设置，使loglog图有足够多的点
hwait=waitbar(0,'请等待>>>>>>>>');%进度条显示
z=zeros(1,length(T1)+length(T2));%申请因变量空间
for i=1:length(T1)+length(T2)
    waitbar(i/(length(T1)+length(T2)),hwait,strcat(num2str(i/(length(T1)+length(T2))*100),'%'));%百分比显示
    if i<=length(T1)
        t=T1(i);
    else
        t=T2(i-length(T1));
    end
    fx = @(w)K1*R2D./12.*((1+(R2D.*w./(9*sqrt(3))).^(1.5)+(1/6).*(R2D.*w./(8*m^(1/3))).^2)).^(-1).*(sin(w.*t/2).^4)./(w.*t/2).^2;%被积分函数
    y=quadgk(fx,0,inf);%quadgk积分命令
    z(i)=y;%因变量
end
