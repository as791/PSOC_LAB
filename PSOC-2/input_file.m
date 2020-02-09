%z and y are in ohm/km and mho/km respectively (per phase)
%Vr is line to line voltage 
%Pr is apparent/real power of the 3 phase system
%l in km

%given experiment input 
% z = 0.087+1i*0.15;
% y = 1i*0.00082;
% Vr = [10,77,220]*1e+3;
% Pr = [10,50,150]*1e+6;
% l = [50,100,200];
% pf = 0.8;

%Problem 1 input 
%No method was given so by given values we can say its for short line
%So using short line method
% z = 1.5+1i*4;
% y = 0;
% Vr = [11e+3,0,0];
% pf = 0.8;
% Pr = [4000,0,0]*1e+3;
% l = [1,0,0];

%Problem 2 input
%as given we will use nominal t method (medium line)
% z = (20+1i*52)/3;
% y = 1i*(315/3)*1e-6;
% Pr = [0,30,0]*1e+6;
% pf = 0.85;
% Vr = [0,132,0]*1e+3;
% l = [0,1,0];
 
%Problem 3 input 
%given total Z and Y so dividing it with length and phase factor of 3 
%i.e. z = Z/(3*l) y = Y/(3*l)
%as given use nominal pi method (medium line)
% z = (35+1i*140)/300;
% y = (1i*930e-6)/300;
% l = [0,100,0]; 
% Pr = [0,40,0]*1e+6;
% pf = 0.9;
% Vr = [0,220,0]*1e+3;

%Problem 4 input
%To use equivalent pi and equivalent t method (long line)
Vr = [0,0,240]*1e+3;
z = 0.017+1i*2*pi*50*0.94e-3;
y = 1i*0.0111e-6;
l = [0,0,200]*1e-3;
Pr = [0,0,500]*1e+6;
pf = 0.9;