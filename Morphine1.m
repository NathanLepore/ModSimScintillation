clf
molecularweight  = 285.33;
LitersOfPlasma = 5;
Morphine = 0;
Injection = 1.25;
Intake = Injection/molecularweight/LitersOfPlasma;
M3G = 0;
M6G = 0;
a = 12;
hold on
M6 = [1:a];
M3 = [1:a];
MM = [1:a];
q = [1:a];
for i = 1:12
if i < 5
    MorphineX = (Intake);
    
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
