% This M-file is an induction motor torque curve based on
% the experimental data and Chapman calculations at 60 Hz.
r1 = 12;
x1 = 11;
r2 = 22;
x2 = 11;
xm = 140;
v_phase = 208 / sqrt(3); n_synch = 1800;
w_synch = 188.5;
v_th = v_phase * ( xm / sqrt(r1^2 + (x1 + xm)^2) ); z_th = ((1i*xm) * (r1 + 1i*x1)) / (r1 + 1i*(x1 + xm)); r_th = real(z_th);
x_th = imag(z_th);
s = (0:1:50) / 50;
s(1) = 0.001;
nm = (1-s) * n_synch;
for ii = 1:51 % Note that if the semicolon is supressed s(ii); % at the end of a line, the result will print.
end
for ii = 1:51
t_ind1(ii) = (3 * v_th^2 * r2 / s(ii)) / ...
(w_synch * ((r_th + r2/s(ii))^2 + (x_th + x2)^2) );
end
%Plot torque-speed curve
plot (nm,t_ind1, 'Color', 'k', 'Linewidth' , 2.0 );