function [ThisFP,ThisFN,ThisTP] = FPFNTP_ALL3_Uniqueness(scoresFile,thresholdsFile)
%scores abajo del umbral se detectan como intrusos
%Matrix de scores de 100 sesiones x 50 usuarios

allscores=load(scoresFile);
allthresholds=load(thresholdsFile);
%allthresholds=zeros(100,50);
%allscores=allscores-allthresholds;
load location
scoresVector=reshape(allscores,[],1);
locationvector=reshape(location,[],1);
sesions=length(scoresVector);

users=[];
masqs=[];

for i=1:sesions
    if locationvector(i)==1
        masqs=[masqs scoresVector(i)*1000];
    else
        users=[users scoresVector(i)*1000];
    end
end

users=sort(users);
masqs=sort(masqs);

MyMin  = min(masqs);
MyMax  = max(masqs);
MyDiff = abs(MyMax - MyMin);
MyInc  = MyDiff / 10;

j = 1;
for i=(MyMin + MyInc):MyInc:MyMax
    k=1;
    while( (masqs(k) < i) && (k < size(masqs,2)))
        k=k+1;
    end
    MyFN(j) = k;

    k=1;
    while( (users(k) < i) && (k < size(users,2)))
        k=k+1;
    end   
    MyFP(j) = k;
    
    j = j + 1;
end

% F - Measure
%
% ======================
Adjust = 4769/231;
AvgMyFP = mean(MyFP);
AvgMyFN = mean(MyFN);
ThisFN  = (AvgMyFN * 100 /231)  * 0.5;
ThisFP  = (AvgMyFP * 100 /4769) * 0.5;

ThisTP  = 100 - (ThisFN + ThisFP);
%FM = (2 * ThisTP) / ( (2 * ThisTP) + ThisFN + ThisFP);


