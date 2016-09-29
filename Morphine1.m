clf
molecularweight  = 285.33;
LitersOfPlasma = 2.7;
Morphine = 0;
Injection = 1.25;
Intake = Injection/(molecularweight*LitersOfPlasma)*1000000000;
M3G = 0;
M6G = 0;
a = 12;
hold on
M6 = [1:a];
M3 = [1:a];
MM = [1:a];
q = [1:a];
M3(1) = .001;
M6(1) = .001;
MM(1) = .001;
M6G1 = 0;
M3G1 = 0;
for i = 2:a
if i < 5
    MorphineX = (Intake)*((2).^(-i/.28));  

end
    
    Morphine = (MorphineX + Morphine - (M3G1 + M6G1))*((2).^(-i/2));
%     plot(i,Morphine,'b.')
    M3G1 = (Morphine*.6);
    M6G1 = (Morphine*.1);
    M3G = (M3G + M3G1)*((2).^(-i/4.1));
    M6G = (M6G + M6G1)*((2).^(-i/2.8));
    M3(i) = M3G;
    M6(i) = M6G;
    MM(i) = Morphine;
    
    
   
%     plot(i,M3G,'r.')
%     plot(i,M6G,'g.')
end
loglog(q,M3,'r')
loglog(q,M6,'g')
loglog(q,MM)
