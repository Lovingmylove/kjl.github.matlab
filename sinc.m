deltK = -4*pi:0.1:4*pi;
L = 2;
x = deltK*L/2;
y = (sin(x)./x).^2;
plot(x,y,'r','LineWidth',4);
new_fig_handle = shift_axis_to_origin( gca ) ;