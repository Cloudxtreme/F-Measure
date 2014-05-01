function [MyFP,MyFN,MyTP] = FPFNTP_Point2(scoresFile)
%scores abajo del umbral se detectan como intrusos
%Matrix de scores de 100 sesiones x 50 usuarios

allscores=load(scoresFile);
load location
scoresVector=reshape(allscores,[],1);
locationvector=reshape(location,[],1);
sesions=length(scoresVector);

FP = 0;
FN = 0;
TP1 = 0;
TP2 = 0;

% for i=1:sesions
%     % Masquerade is there, so it must trigger alarm
%     if locationvector(i)==1
%         if scoresVector(i) > 0
%             % The score of this session is bigger than the threshold, i.e.
%             % it is impersonating a user - False Negative
%             FN = FN + 1;
%         else
%             % The score is lower than the score, i.e. the masquerade is
%             % properly detected
%             TP1 = TP1 + 1;
%         end
%     else
%         % NO masquerade, so it must be a valid user
%         if scoresVector(i) <= 0
%             % The score is lower than the threshold, so the system detects
%             % an intruder which is wrong - false alarm - False Positive
%             FP = FP + 1;
%         else
%             % The score is higher the threshold, so valid user :D
%             TP2 = TP2 + 1;
%         end
%     end
% end

for i=1:sesions
    if locationvector(i) == 1
        if(scoresVector(i) == 0)
            FN = FN + 1;
        else
            TP1 = TP1 + 1;
        end
    else
        if(scoresVector(i) == 1)
            FP = FP + 1;
        else
            TP2 = TP2 + 1;
        end
    end
end


XX = [FN TP1 FP TP2];

Adjust = 4769/231;
MyFN   = FN  * 100 / 231;
MyTP1  = TP1 * 100 / 231;
MyFP   = FP  * 100 / 4769;
MyTP2  = TP2 * 100 / 4769;

YY = [MyFN MyTP1 MyFP MyTP2];

AdjustFN = 0.5;
AdjustFP = 0.5;

MyFN = MyFN * AdjustFN;
MyFP = MyFP * AdjustFP;

MyTP = 100 - MyFN - MyFP;

%ZZ = [MyTP MyFN MyFP];
