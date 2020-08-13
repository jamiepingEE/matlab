%roundtest

clear

x = 0.1 + 0.1 + 0.1
if ( x == 0.3)
disp(' x is equal to 0.3')
else
disp('x is is NOT equal to 0.3')
end
format long
x=303.01-302.005
round(x,2)
% use the fprintf output command to display the value of x to
% 18 decimal place in a field-width of 21 columns
fprintf(' x is really = %21.20f\n', x)