clf
molecularweight  = 285.33; % molecular weight of morphine
LitersOfPlasma = 5; % liters of plasma in the body
Morphine = 0; % initial morphine concentration
Injection = 1.25; % milligrams of morphine
Intake = Injection/molecularweight/LitersOfPlasma; % intake of morphine
M3G = 0; % initial m3g concentration
M6G = 0; % initial m6g concentration
a = 12; % length of simulation
hold on
% initialize datasets
M6 = [1:a];
M3 = [1:a];
MM = [1:a];
q = [1:a]; % time
for i = 1:12
if i < 5
    MorphineX = (Intake); %this is the initial intake of morphine for the first 5 iterations
    
else MorphineX = 0;
    
end
    MM(i) = Morphine;
    M3G1 = (Morphine*.6);
    M6G1 = (Morphine*.1);
    M3G = M3G*.2 + M3G1;
    M6G = M6G*.2 + M6G1;
    M3(i) = M3G;
    M6(i) = M6G;
    Morphine = (MorphineX + Morphine - (M3G + M6G));
    
    
    %plot(i,Morphine,'b.')
    %plot(i,M3G,'r.')
    %plot(i,M6G,'g.')
end
loglog(q,M3,'r')
loglog(q,M6,'g')
loglog(q,MM)
