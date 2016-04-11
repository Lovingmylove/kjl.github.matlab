txt = importdata('15.txt');
plot(7:0.01:13.5,txt.data(700:1350))
hold on
a = 60.11;
b = 59.83;
plot(10.5:0.5:13.5,[a,a,a,a,a,a,a],'r-')
hold on
plot(10.5:0.5:13.5,[b,b,b,b,b,b,b],'r-')
grid on
axis([7,13.5,58,64])
set(gca,'xtick',(7:0.5:13.5),'ytick',(58:0.5:64))
xlabel('Time(min)')
ylabel('Temperature(T)')
title(['deltaT=' num2str(a-b)])

