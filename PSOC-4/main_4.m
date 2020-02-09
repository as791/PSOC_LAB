					Main File
											
clc;
clear;
phase = input('Phase of system:- ');
ckt = input('Type of circuit :- single line/double line/bundle ','s');
if(phase==3&&ckt~="bundle")
    sym = input('Is circuit symmetric or unsymmetric:- ','s');
end
%Single Line Circuit
if (ckt=="single line")
    if(phase==3&&sym=="unsymmetric")
        dist_ab = input('distance between A & B:- ');
        dist_bc = input('distance between B & C:- ');
        dist_ac = input('distance between A & C:- ');
        r = input('Radius of conductors:- ');
        M_gmd = (dist_ab*dist_ac*dist_bc)^(1/3);
        S_gmd = exp(-0.25)*r;
        C_phase = (2*pi*8.8542e-12)/(log(M_gmd/r));
        L_phase = (2e-7)*log(M_gmd/S_gmd);
    elseif (phase==1||(phase==3&&sym=="symmetric"))
         d = input('distance between conductors:- ');
         r = input('Radius of conductors:- ');
         L_phase = (2e-7)*log(d/(exp(-0.25)*r));
         C_phase = (2*pi*8.8542e-12)/(log(d/r));
    end
%Double Line Circuit
elseif(ckt=="double line")
    if(phase==3&&sym=="symmetric")
        d = input('distance between conductors:- ');
        r = input('Radius of conductors:- ');
        L_phase = (2e-7)*log((d*sqrt(3))/(2*exp(-0.25)*r))/2;
        C_phase = (2*pi*8.8542e-12)/(log((sqrt(3)*d)/(2*r)))*2;
    elseif(phase==3&&sym=="unsymmetric")
        dist_a1a2 = input('distance between A1 & A2:- ');
        dist_a1b2 = input('distance between A1 & B2:- ');
        dist_a1c2 = input('distance between A1 & C2:- ');
        dist_a1b1 = input('distance between A1 & B1:- ');
        dist_a1c1 = input('distance between A1 & C1:- ');
        dist_b1a2 = input('distance between B1 & A2:- ');
        dist_b1b2 = input('distance between B1 & B2:- ');
        dist_b1c2 = input('distance between B1 & C2:- ');
        dist_b1a1 = input('distance between B1 & A1:- ');
        dist_b1c1 = input('distance between B1 & C1:- ');
        dist_c1a2 = input('distance between C1 & A2:- ');
        dist_c1b2 = input('distance between C1 & B2:- ');
        dist_c1c2 = input('distance between C1 & C2:- ');
        dist_c1b1 = input('distance between C1 & B1:- ');
        dist_c1a1 = input('distance between C1 & A1:- ');
        r = input('Radius of conductors:- ');
        dist_ab = (dist_a1b1*dist_a1b2*dist_b1a1*dist_b1a2)^0.25;
        dist_bc = (dist_b1c1*dist_b1c2*dist_c1b1*dist_c1b2)^0.25;
        dist_ac = (dist_a1c1*dist_a1c2*dist_c1a1*dist_c1a2)^0.25;
        dist_aa = sqrt(exp(-0.25)*r*dist_a1a2);
        dist_bb = sqrt(exp(-0.25)*r*dist_b1b2);
        dist_cc = sqrt(exp(-0.25)*r*dist_c1c2);
        M_gmd = (dist_ab*dist_ac*dist_bc)^(1/3);
        S_gmd = (dist_aa*dist_bb*dist_cc)^(1/3);
        L_phase = (2e-7)*log(M_gmd/S_gmd)/2;
        C_phase = (2*pi*8.8542e-12)/(log((M_gmd*exp(-0.125))/S_gmd))*2;
    end
%Bundle Conductors
elseif(ckt=="bundle")
    c = input('number of conductor in each phase:- ');
    d = input('distance between two bundled conductor of same phase:- ');
    r = input('Radius of conductors:- ');
    br = (0.091*(c==4)+1)*((r*d^(c-1))^(1/c));
    if(phase==3)
        dist_ab = input('distance between A & B:- ');
        dist_bc = input('distance between B & C:- ');
        dist_ac = input('distance between A & C:- ');
        M_gmd = (dist_ab*dist_ac*dist_bc)^(1/3);
        L_phase = (2e-7)*log(M_gmd/(br*exp(-0.25/c)));
        C_phase =  (2*pi*8.8542e-12)/(log(M_gmd/br));
    elseif(phase==1)
        d = input('distance between line & neutral:- ');
        L_phase = (2e-7)*log(d/(br*exp(-0.25/c)));
        C_phase =  (2*pi*8.8542e-12)/(log(d/br));
    end    
end
disp(['L_phase = ',num2str(L_phase*1e6),' mH/Km']);
disp(['C_phase = ',num2str(C_phase*1e12),' nF/Km']);



						Outputs
															
1) 
Phase of system:- 1
Type of circuit :- single line/double line/bundle single line
distance between conductors:- 3.5
Radius of conductors:- 0.0075
L_phase = 1.2791 mH/Km
C_phase = 9.0524 nF/Km

2)
Phase of system:- 3
Type of circuit :- single line/double line/bundle single line
Is circuit symmetric or unsymmetric:- symmetric
distance between conductors:- 1.5
Radius of conductors:- 0.006
L_phase = 1.1543 mH/Km
C_phase = 10.0757 nF/Km

3)
Phase of system:- 3
Type of circuit :- single line/double line/bundle single line
Is circuit symmetric or unsymmetric:- unsymmetric
distance between A & B:- 5
distance between B & C:- 4
distance between A & C:- 3
Radius of conductors:- 0.0125
L_phase = 1.1994 mH/Km
C_phase = 9.6806 nF/Km

4)
Phase of system:- 3
Type of circuit :- single line/double line/bundle single line
Is circuit symmetric or unsymmetric:- unsymmetric
distance between A & B:- 3.5
distance between B & C:- 7
distance between A & C:- 3.5
Radius of conductors:- 0.005
L_phase = 1.4064 mH/Km
C_phase = 8.2028 nF/Km

5)
Phase of system:- 3
Type of circuit :- single line/double line/bundle double line
Is circuit symmetric or unsymmetric:- unsymmetric
distance between A1 & A2:- sqrt(85)
distance between A1 & B2:- 3.5*sqrt(5)
distance between A1 & C2:- 6
distance between A1 & B1:- sqrt(53)/2
distance between A1 & C1:- 7
distance between B1 & A2:- 3.5*sqrt(5)
distance between B1 & B2:- 8
distance between B1 & C2:- 3.5*sqrt(5)
distance between B1 & A1:- sqrt(53)/2
distance between B1 & C1:- sqrt(53)/2
distance between C1 & A2:- 6
distance between C1 & B2:- 3.5*sqrt(5)
distance between C1 & C2:- sqrt(85)
distance between C1 & B1:- sqrt(53)/2
distance between C1 & A1:- 7
Radius of conductors:- 0.01
L_phase = 0.308 mH/Km
C_phase = 37.6531 nF/Km

6)
Phase of system:- 3
Type of circuit :- single line/double line/bundle bundle
number of conductor in each phase:- 2
distance between two bundled conductor of same phase:- 0.4
Radius of conductors:- 0.012
distance between A & B:- 10
distance between B & C:- 10
distance between A & C:- 10
L_phase = 1.0194 mH/Km
C_phase = 11.1888 nF/Km