clf
molecularweight  = 285.33;
LitersOfPlasma = 2.7;
Morphine = 0;
Injection = 1.25;
Intake = Injection/(molecularweight*LitersOfPlasma)*1000000000;
M3G = 0;
M6G = 0;
a = 12; %how many iterations we want
hold on
M6 = [1:a]; %defining matricices to be filled with values
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
    
    Morphine = (MorphineX + Morphine - (M3G1 + M6G1))*((2).^(-i/2)); %Morphine net flow including half life
%     plot(i,Morphine,'b.')
    M3G1 = (Morphine*.6); %how much M3G is being added per iteration
    M6G1 = (Morphine*.1); %how much M6G is being added per iteration
    M3G = (M3G + M3G1)*((2).^(-i/4.1)); %M3G Net Flow
    M6G = (M6G + M6G1)*((2).^(-i/2.8)); %M6G Net Flow
    M3(i) = M3G; %Fills out the matrices
    M6(i) = M6G;
    MM(i) = Morphine;
    
    
   
%     plot(i,M3G,'r.')
%     plot(i,M6G,'g.')
end
loglog(q,M3,'r')
loglog(q,M6,'g')
loglog(q,MM)
