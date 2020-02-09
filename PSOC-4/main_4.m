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
