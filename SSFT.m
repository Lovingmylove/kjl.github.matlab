clear;
clc;
%%
%定义光纤色散和非线性参数
c=299792458;%光速
D=0.092/4*(1550-1312.^4./1550^3) * 1e-12/1e-9/1e3;
beta2=-1550e-9^2/2/pi/c*D;%二阶色散系数
gamma=1.3e-3;%非线性系数
%%
%定义离散化网格
N=2^10;  twin=100e-12;  dt=twin/N;  df=1/twin;  fwin=1/dt;
t=linspace(-twin/2,twin/2-dt,N)';%时间离散化
f=linspace(-fwin/2,fwin/2-df,N)';%频率离散化
%%
%定义输入脉冲（孤子）
T0=1e-12;
LD=T0^2/abs(beta2);
a0=1*1/sqrt(gamma*LD)*sech(t/T0);%sech双曲正割脉冲
A0=fftshift(ifft(fftshift(a0)));%频域变换

%%
%定义光纤离散
L=1e3;  M=2500;	dL=L/M;

%%
%色散及非线性过程（分步傅立叶变换算法）
a=a0;
err=zeros(M);
error=zeros(M-1);
hwait=waitbar(0,'请等待>>>>>>>>');%程序运行的进度条显示
for k=1:M
    waitbar(k/M,hwait,strcat(num2str(k/M*100),'%'));%以百分号显示进度条
    a=a.*exp(1i*gamma*dL*(a.*conj(a)));%非线性受脉冲特性影响（时域）
    A=fftshift(ifft(fftshift(a)));%傅立叶变换
    A=A.*exp(1i*0.5*beta2*dL*(2*pi*f).^2);%色散受光纤特性影响（色散曲线）
    a=fftshift(fft(fftshift(A)));%傅立叶反变换
    err(k)=sum((a.*conj(a)-a0.*conj(a0)).^2)/N;
end
for k=2:M
    error(k-1)=err(k)-err(k-1);
end

%%
%画图命令
figure;
subplot(3,1,1);
hold on;
plot(c./(f+c/1550e-9)*1e6,A.*conj(A),'r.-'); %传输后的脉冲（频域）
plot(c./(f+c/1550e-9)*1e6,A0.*conj(A0));%传输前脉冲（频域）
subplot(3,1,2);
hold on; 
plot(t*1e12,a.*conj(a),'r.-');%传输后的脉冲（时域）
plot(t*1e12,a0.*conj(a0));%传输前脉冲（时域）
subplot(3,1,3)
plot(1:M-1,error)

%%
%对比输入输出的差别
err=sum((a.*conj(a)-a0.*conj(a0)).^2)/N;
