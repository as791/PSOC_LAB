clc;
input_y;                        
nb = input('no. of buses: ');   
Y = zeros(nb);                 
y = 1./L(:,3);                 
nl = length(y);                
for m = 1:nl
    Y(L(m,1),L(m,2)) = -y(m);      
    Y(L(m,2),L(m,1)) = -y(m);
    Y(L(m,1),L(m,1)) = Y(L(m,1),L(m,1))+ y(m) + L(m,4)/2;
    Y(L(m,2),L(m,2)) = Y(L(m,2),L(m,2))+ y(m) + L(m,4)/2;
end
disp(Y);
Z = 1./Y;  
disp(Z);