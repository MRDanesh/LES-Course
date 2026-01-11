clear
clc

for i=1:1:16
if i<9
    f(i) = 1;
else 
    f(i) = -1;
end
end
n=16;
A=fft(f)/n;
U=fftshift(A);
UU=abs(U);
for i=1:1:n
 k(i)=-n/2+i-1;
end
stem(k,UU,'LineStyle','-.',...
     'MarkerFaceColor','red',...
     'MarkerEdgeColor','green')
xlabel('k')
ylabel('l$$\hat{f}$$(k)l','Interpreter','Latex')

