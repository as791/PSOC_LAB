clc;
input_file;
type = input('transmission line type:- ','s');
Ir = (Pr./(sqrt(3)*Vr*pf)).*exp(-1i*acos(pf));
switch type
    case 'short'
        t=1;
        ABCD = [1,z*l(1);0,1];
    case 'medium'
        t=2;
        type2 = input('method of approximation:- ','s');
        Z = z*l(2);
        Y = y*l(2);
        switch type2
            case 'recieving end'
                ABCD = [1+Z*Y,Z;Y,1];
            case 'sending end'
                ABCD = [1,Z;Y,1+Z*Y];
            case 'nominal t'
                ABCD = [1+Z*Y/2,Z*(1+Y*Z/4);Y,1+Z*Y/2];
            case 'nominal pi'
                ABCD = [1+Z*Y/2,Z;Y*(1+Y*Z/4),1+Z*Y/2];
        end
    case 'long'
        t=3;
        type3 = input('method of approximation:-','s');
        v = sqrt(z*y);
        Zc = sqrt(z/y);
        Z = z*l(3);
        Y = y*l(3);
        switch type3
            case 'rigorous'
                ABCD = [cosh(v*l(3)),Zc*sinh(v*l(3));(1/Zc)*sinh(v*l(3)),cosh(v*l(3))];
            case 'equivalent pi'
                Z = Z*sinh(v*l(3))/(v*l(3));
                Y = Y*tanh(v*l(3)/2)/(v*l(3)/2);
                ABCD = [1+Y*Z/2,Z;Y*(1+Y*Z/4),1+Y*Z/2];
            case 'equivalent t'
                Z = Z*tanh(v*l(3)/2)/(v*l(3)/2);
                Y = Y*sinh(v*l(3))/(v*l(3));
                ABCD = [1+Y*Z/2,Z;Y*(1+Y*Z/4),1+Y*Z/2];
        end
end
S = ABCD*[Vr(t);Ir(t)];
Vs = S(1);Is = S(2);
Ps = real(sqrt(3)*Vs*conj(Is));
Qs = imag(sqrt(3)*Vs*conj(Is));
eff = (Pr(t)/(Ps))*100;
Vro = Vs/ABCD(1,1);
v_reg = (abs(Vro)/abs(Vr(t))-1)*100;
disp('ABCD Parameters:-');
disp(ABCD);
disp(['Sending end Voltage (Vs):- ',num2str(abs(Vs)/1000),' kV']);
disp(['Sending end Current (Is):- ',num2str(abs(Is)/1000),' kA']);
disp(['Supplied Apparent Power (Ps):- ',num2str(Ps/1000000),' MW']);
disp(['Supplied Reactive Power (Qs):- ',num2str(Qs/1000000),' MW']);
disp(['Efficiency:- ',num2str(eff),'%']);
disp(['Voltage Regulation:- ',num2str(v_reg),'%']);