%FB TB %Z %B
L = [1,2,0.02+1i*0.04,0;
    1,3,0.01+0.03i,0;
    2,3,0.0125+0.025i,0;
    ];
%Bus No
%Types of buses :- 1 == slack, 2 == PQ, 3 == PV.
%Vmag
%Vang
%P
%Q
%Qmax
%Qmin
%Sbase = 100MVA
B=[1,1,1.05,0,0,0,0,0;
   2,2,1,0,4,2.5,0,0;
   3,3,1.04,0,-2,0,-10,10;];