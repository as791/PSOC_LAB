clc;
clear;
input_file;
nb = input('no. of buses: ');
Y = zeros(nb);
y = 1./L(:,3);
nl = length(y);
for m = 1:nl
    % off diagonal elements
    Y(L(m,1),L(m,2)) = -y(m);      
    Y(L(m,2),L(m,1)) = -y(m);
    % other
    Y(L(m,1),L(m,1)) = Y(L(m,1),L(m,1))+ y(m) + L(m,4)/2;
    Y(L(m,2),L(m,2)) = Y(L(m,2),L(m,2))+ y(m) + L(m,4)/2;
end

V = B(:,3).*exp(1i*B(:,4));
itr=1;
tol=1e-3;
err(itr) = 1;
while(err(end)>tol)
    Vo = V;
    Qo = B(:,6);
    for k=1:nb
        if(B(k,2)==2) %PQ Type
            V(k) = ((B(k,5)-1i*B(k,6))/conj(V(k)) - (Y(k,:)*V-V(k)*Y(k,k)))/Y(k,k);
            B(k,3) = abs(V(k));
            B(k,4) = angle(V(k));
        end
        if(B(k,2)==3) %PV Type
            q = -imag(conj(V(k))*(Y(k,:)*V));
            v = ((B(k,5)-1i*B(k,6))/conj(V(k)) - (Y(k,:)*V-V(k)*Y(k,k)))/Y(k,k);
            if(q>B(k,8))
                q = B(k,8);
                B(k,2)=2;
            end
            if(q<B(k,7))
                q = B(k,7);
                B(k,2)=2;
            end
            B(k,6) = q;
            B(k,4) = angle(v);
            V(k) = abs(V(k))*exp(1i*angle(v));
        end
    end
    Q = B(:,6);
    itr = itr+1;
    err(itr)=norm((Vo-V)+(Qo-Q));
end
S1 = conj(conj(V(1))*Y(1,:)*V);
I=zeros(size(Y));
S=zeros(size(Y));
for j=1:nb
    for k=1:nb
        I(j,k) = (V(j)-V(k))*Y(j,k);
        S(j,k) = V(j)*conj(I(j,k));
    end
end
disp(['Bus 1 power (S1):- ',num2str(abs(S1)*100),' MVA']);
disp(['Bus 2 power (S2):- ',num2str(abs(B(2,5)+1i*B(2,6))*100),' MVA']);
disp(['Bus 3 power (S3):- ',num2str(abs(B(3,5)+1i*B(3,6))*100),' MVA']);
disp(['Power Flow in Line 12:- ',num2str(S(1,2)*100),' MVA']);
disp(['Power Flow in Line 13:- ',num2str(S(1,3)*100),' MVA']);
disp(['Power Flow in Line 23:- ',num2str(S(2,3)*100),' MVA']);
disp(['Power Loss in Line 12:- ',num2str(abs((I(1,2)*(V(1)-V(2))))*100),' MW']);
disp(['Power Loss in Line 13:- ',num2str(abs((I(1,3)*(V(1)-V(3))))*100),' MW']);
disp(['Power Loss in Line 23:- ',num2str(abs((I(2,3)*(V(2)-V(3))))*100),' MW']);