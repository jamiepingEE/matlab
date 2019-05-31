clear;
subplot(1,2,1);
x1=0:10;
y1=(4/3)*pi*(x1.^3);
plot(x1,y1,'b');

hold on;
x2=0:10;
y2=(4)*pi*(x2.^2);
plot(x2,y2,'r');
hold off;
xlabel("radius");
ylabel("vol and area");
title("vol and area of sphere");

%second plot
subplot(1,2,2);
x3=0:10;
y3=(x3.^3);
plot(y3,'r');

hold on;
x4=0:10;
y4=6*(x4.^2);
plot(y4,'b');
hold off;
xlabel("side");
ylabel("vol and area");
title("vol and area of square");