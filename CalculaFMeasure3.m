function [XX] = CalculaFMeasure3(Beta)

% Calculando F-Measure
% http://en.wikipedia.org/wiki/F1_score
% Beta = 1 
% Fb = (2 * true positive) / (2* true positive + false negative + false positive);
XX = 0;

%close all;
%Beta = 0.5
% testing-August-2010-Mimicry

%Customized Grammars
% False alarms - False Positives
% Missing alarms - False Negative
[FP,FN,TP] = FPFNTP_ALL3('testing-August-2010-Mimicry/ngram/CGR0','thresholdceros');
CGFB = FBeta(TP,FN,FP,Beta);

%Sequitur-HTK
%[x41,y41]=roc51('../htk-seq/htk-seqres','thresholdceros','y');
[FP,FN,TP] = FPFNTP_ALL3('testing-August-2010-Mimicry/htk-seq/htk-seqres','thresholdceros');
%SEQFB = (2*TP) / (2*TP + FN + FP);
SEQFB2 = FBeta(TP,FN,FP,Beta);

%Uniqueness
%[x5,y5]=roc1('../uniqueness/resultsuninormal','thresholdceros','c');
[FP,FN,TP] = FPFNTP_ALL3_Uniqueness('testing-August-2010-Mimicry/uniqueness/resultsuninormal','thresholdceros');
UNIFB = FBeta(TP,FN,FP,Beta);

%Naive
SNaive='testing-August-2010-Mimicry/Naive/resultsnaive';
FPNaive=[];
FNNaive=[];
TPNaive=[];
    
for j=-80:1:60
    name=strcat(SNaive,int2str(j));
    % [x,y]=rocPoint(name);
    [FP,FN,TP] = FPFNTP_Point2(name);
    FPNaive=[FPNaive,FP];
    FNNaive=[FNNaive,FN];
    TPNaive=[TPNaive,TP];
end
FPNaiveS = sum(FPNaive);
FNNaiveS = sum(FNNaive);
TPNaiveS = sum(TPNaive);
NAIVEFB = FBeta(TPNaiveS,FNNaiveS,FPNaiveS,Beta);

%METODO COMMAND FREQUENCIES,SINGLE COMMANDS.
S='testing-August-2010-Mimicry/single-commands/finalresultsimpostores';
FPSC=[];
FNSC=[];
TPSC=[];
for j=-60:80
    name=strcat(S,int2str(j));
    %[x,y]=rocPoint(name);
    [FP,FN,TP] = FPFNTP_Point2(name);
    FPSC=[FPSC,FP];
    FNSC=[FNSC,FN];
    TPSC=[TPSC,TP];
end
FPSCS = sum(FPSC);
FNSCS = sum(FNSC);
TPSCS = sum(TPSC);

SCFB = FBeta(TPSCS,FNSCS,FPSCS,Beta);

FB_Mimicry = [CGFB SEQFB2 UNIFB NAIVEFB SCFB]

% ================================ SEA 1 =================================

% testing-August-2010-SEA1

%Customized Grammars
% False alarms - False Positives
% Missing alarms - False Negative
[FP,FN,TP] = FPFNTP_ALL3('testing-August-2010-SEA1/ngram/CGR0','thresholdceros');
CGFB = FBeta(TP,FN,FP,Beta);

%Sequitur-HTK
%[x41,y41]=roc51('../htk-seq/htk-seqres','thresholdceros','y');
[FP,FN,TP] = FPFNTP_ALL3('testing-August-2010-SEA1/htk-seq/htk-seqres','thresholdceros');
%SEQFB = (2*TP) / (2*TP + FN + FP);
SEQFB2 = FBeta(TP,FN,FP,Beta);

%Uniqueness
%[x5,y5]=roc1('../uniqueness/resultsuninormal','thresholdceros','c');
[FP,FN,TP] = FPFNTP_ALL3_Uniqueness('testing-August-2010-SEA1/uniqueness/resultsuninormal','thresholdceros');
UNIFB = FBeta(TP,FN,FP,Beta);

%Naive
SNaive='testing-August-2010-SEA1/Naive/resultsnaive';
FPNaive=[];
FNNaive=[];
TPNaive=[];
    
for j=-80:1:60
    name=strcat(SNaive,int2str(j));
    % [x,y]=rocPoint(name);
    [FP,FN,TP] = FPFNTP_Point2(name);
    FPNaive=[FPNaive,FP];
    FNNaive=[FNNaive,FN];
    TPNaive=[TPNaive,TP];
end
FPNaiveS = sum(FPNaive);
FNNaiveS = sum(FNNaive);
TPNaiveS = sum(TPNaive);
NAIVEFB = FBeta(TPNaiveS,FNNaiveS,FPNaiveS,Beta);

%METODO COMMAND FREQUENCIES,SINGLE COMMANDS.
S='testing-August-2010-SEA1/single-commands/finalresultsimpostores';
FPSC=[];
FNSC=[];
TPSC=[];
for j=-60:80
    name=strcat(S,int2str(j));
    %[x,y]=rocPoint(name);
    [FP,FN,TP] = FPFNTP_Point2(name);
    FPSC=[FPSC,FP];
    FNSC=[FNSC,FN];
    TPSC=[TPSC,TP];
end
FPSCS = sum(FPSC);
FNSCS = sum(FNSC);
TPSCS = sum(TPSC);

SCFB = FBeta(TPSCS,FNSCS,FPSCS,Beta);

FB_SEA1 = [CGFB SEQFB2 UNIFB NAIVEFB SCFB]

% ================================ SEA 2 Frecuencia =================================

% testing-August-2010-SEA2-Frecuencia

%Customized Grammars
% False alarms - False Positives
% Missing alarms - False Negative
[FP,FN,TP] = FPFNTP_ALL3('testing-August-2010-SEA2-Frecuencia/ngram/CGR0','thresholdceros');
CGFB = FBeta(TP,FN,FP,Beta);

%Sequitur-HTK
%[x41,y41]=roc51('../htk-seq/htk-seqres','thresholdceros','y');
[FP,FN,TP] = FPFNTP_ALL3('testing-August-2010-SEA2-Frecuencia/htk-seq/htk-seqres','thresholdceros');
%SEQFB = (2*TP) / (2*TP + FN + FP);
SEQFB2 = FBeta(TP,FN,FP,Beta);

%Uniqueness
%[x5,y5]=roc1('../uniqueness/resultsuninormal','thresholdceros','c');
[FP,FN,TP] = FPFNTP_ALL3_Uniqueness('testing-August-2010-SEA2-Frecuencia/uniqueness/resultsuninormal','thresholdceros');
UNIFB = FBeta(TP,FN,FP,Beta);

%Naive
SNaive='testing-August-2010-SEA2-Frecuencia/Naive/resultsnaive';
FPNaive=[];
FNNaive=[];
TPNaive=[];
    
for j=-80:1:60
    name=strcat(SNaive,int2str(j));
    % [x,y]=rocPoint(name);
    [FP,FN,TP] = FPFNTP_Point2(name);
    FPNaive=[FPNaive,FP];
    FNNaive=[FNNaive,FN];
    TPNaive=[TPNaive,TP];
end
FPNaiveS = sum(FPNaive);
FNNaiveS = sum(FNNaive);
TPNaiveS = sum(TPNaive);
NAIVEFB = FBeta(TPNaiveS,FNNaiveS,FPNaiveS,Beta);

%METODO COMMAND FREQUENCIES,SINGLE COMMANDS.
S='testing-August-2010-SEA2-Frecuencia/single-commands/finalresultsimpostores';
FPSC=[];
FNSC=[];
TPSC=[];
for j=-60:80
    name=strcat(S,int2str(j));
    %[x,y]=rocPoint(name);
    [FP,FN,TP] = FPFNTP_Point2(name);
    FPSC=[FPSC,FP];
    FNSC=[FNSC,FN];
    TPSC=[TPSC,TP];
end
FPSCS = sum(FPSC);
FNSCS = sum(FNSC);
TPSCS = sum(TPSC);

SCFB = FBeta(TPSCS,FNSCS,FPSCS,Beta);

FB_SEA2_Frecuencia = [CGFB SEQFB2 UNIFB NAIVEFB SCFB]

% ================================ SEA 2 Longitud =================================

% testing-August-2010-SEA2-Longitud

%Customized Grammars
% False alarms - False Positives
% Missing alarms - False Negative
[FP,FN,TP] = FPFNTP_ALL3('testing-August-2010-SEA2-Longitud/ngram/CGR0','thresholdceros');
CGFB = FBeta(TP,FN,FP,Beta);

%Sequitur-HTK
%[x41,y41]=roc51('../htk-seq/htk-seqres','thresholdceros','y');
[FP,FN,TP] = FPFNTP_ALL3('testing-August-2010-SEA2-Longitud/htk-seq/htk-seqres','thresholdceros');
%SEQFB = (2*TP) / (2*TP + FN + FP);
SEQFB2 = FBeta(TP,FN,FP,Beta);

%Uniqueness
%[x5,y5]=roc1('../uniqueness/resultsuninormal','thresholdceros','c');
[FP,FN,TP] = FPFNTP_ALL3_Uniqueness('testing-August-2010-SEA2-Longitud/uniqueness/resultsuninormal','thresholdceros');
UNIFB = FBeta(TP,FN,FP,Beta);

%Naive
SNaive='testing-August-2010-SEA2-Longitud/Naive/resultsnaive';
FPNaive=[];
FNNaive=[];
TPNaive=[];
    
for j=-80:1:60
    name=strcat(SNaive,int2str(j));
    % [x,y]=rocPoint(name);
    [FP,FN,TP] = FPFNTP_Point2(name);
    FPNaive=[FPNaive,FP];
    FNNaive=[FNNaive,FN];
    TPNaive=[TPNaive,TP];
end
FPNaiveS = sum(FPNaive);
FNNaiveS = sum(FNNaive);
TPNaiveS = sum(TPNaive);
NAIVEFB = FBeta(TPNaiveS,FNNaiveS,FPNaiveS,Beta);

%METODO COMMAND FREQUENCIES,SINGLE COMMANDS.
S='testing-August-2010-SEA2-Longitud/single-commands/finalresultsimpostores';
FPSC=[];
FNSC=[];
TPSC=[];
for j=-60:80
    name=strcat(S,int2str(j));
    %[x,y]=rocPoint(name);
    [FP,FN,TP] = FPFNTP_Point2(name);
    FPSC=[FPSC,FP];
    FNSC=[FNSC,FN];
    TPSC=[TPSC,TP];
end
FPSCS = sum(FPSC);
FNSCS = sum(FNSC);
TPSCS = sum(TPSC);

SCFB = FBeta(TPSCS,FNSCS,FPSCS,Beta);

FB_SEA2_Longitud = [CGFB SEQFB2 UNIFB NAIVEFB SCFB]

% ================================ SEA 2 Prioridad =================================

% testing-August-2010-SEA2-Prioridad

%Customized Grammars
% False alarms - False Positives
% Missing alarms - False Negative
[FP,FN,TP] = FPFNTP_ALL3('testing-August-2010-SEA2-Prioridad/ngram/CGR0','thresholdceros');
CGFB = FBeta(TP,FN,FP,Beta);

%Sequitur-HTK
%[x41,y41]=roc51('../htk-seq/htk-seqres','thresholdceros','y');
[FP,FN,TP] = FPFNTP_ALL3('testing-August-2010-SEA2-Prioridad/htk-seq/htk-seqres','thresholdceros');
%SEQFB = (2*TP) / (2*TP + FN + FP);
SEQFB2 = FBeta(TP,FN,FP,Beta);

%Uniqueness
%[x5,y5]=roc1('../uniqueness/resultsuninormal','thresholdceros','c');
[FP,FN,TP] = FPFNTP_ALL3_Uniqueness('testing-August-2010-SEA2-Prioridad/uniqueness/resultsuninormal','thresholdceros');
UNIFB = FBeta(TP,FN,FP,Beta);

%Naive
SNaive='testing-August-2010-SEA2-Prioridad/Naive/resultsnaive';
FPNaive=[];
FNNaive=[];
TPNaive=[];
    
for j=-80:1:60
    name=strcat(SNaive,int2str(j));
    % [x,y]=rocPoint(name);
    [FP,FN,TP] = FPFNTP_Point2(name);
    FPNaive=[FPNaive,FP];
    FNNaive=[FNNaive,FN];
    TPNaive=[TPNaive,TP];
end
FPNaiveS = sum(FPNaive);
FNNaiveS = sum(FNNaive);
TPNaiveS = sum(TPNaive);
NAIVEFB = FBeta(TPNaiveS,FNNaiveS,FPNaiveS,Beta);

%METODO COMMAND FREQUENCIES,SINGLE COMMANDS.
S='testing-August-2010-SEA2-Prioridad/single-commands/finalresultsimpostores';
FPSC=[];
FNSC=[];
TPSC=[];
for j=-60:80
    name=strcat(S,int2str(j));
    %[x,y]=rocPoint(name);
    [FP,FN,TP] = FPFNTP_Point2(name);
    FPSC=[FPSC,FP];
    FNSC=[FNSC,FN];
    TPSC=[TPSC,TP];
end
FPSCS = sum(FPSC);
FNSCS = sum(FNSC);
TPSCS = sum(TPSC);

SCFB = FBeta(TPSCS,FNSCS,FPSCS,Beta);

FB_SEA2_Prioridad = [CGFB SEQFB2 UNIFB NAIVEFB SCFB]

% ================================ SEA Ori =================================

% testingFinal-August-SEAOri-2010

%Customized Grammars
% False alarms - False Positives
% Missing alarms - False Negative
[FP,FN,TP] = FPFNTP_ALL3('testingFinal-August-SEAOri-2010/ngram/CGR0','thresholdceros');
CGFB = FBeta(TP,FN,FP,Beta);

%Sequitur-HTK
%[x41,y41]=roc51('../htk-seq/htk-seqres','thresholdceros','y');
[FP,FN,TP] = FPFNTP_ALL3('testingFinal-August-SEAOri-2010/htk-seq/htk-seqres','thresholdceros');
%SEQFB = (2*TP) / (2*TP + FN + FP);
SEQFB2 = FBeta(TP,FN,FP,Beta);

%Uniqueness
%[x5,y5]=roc1('../uniqueness/resultsuninormal','thresholdceros','c');
[FP,FN,TP] = FPFNTP_ALL3_Uniqueness('testingFinal-August-SEAOri-2010/uniqueness/resultsuninormal','thresholdceros');
UNIFB = FBeta(TP,FN,FP,Beta);

%Naive
SNaive='testingFinal-August-SEAOri-2010/Naive/resultsnaive';
FPNaive=[];
FNNaive=[];
TPNaive=[];
    
for j=-80:1:60
    name=strcat(SNaive,int2str(j));
    % [x,y]=rocPoint(name);
    [FP,FN,TP] = FPFNTP_Point2(name);
    FPNaive=[FPNaive,FP];
    FNNaive=[FNNaive,FN];
    TPNaive=[TPNaive,TP];
end
FPNaiveS = sum(FPNaive);
FNNaiveS = sum(FNNaive);
TPNaiveS = sum(TPNaive);
NAIVEFB = FBeta(TPNaiveS,FNNaiveS,FPNaiveS,Beta);

%METODO COMMAND FREQUENCIES,SINGLE COMMANDS.
S='testingFinal-August-SEAOri-2010/single-commands/finalresultsimpostores';
FPSC=[];
FNSC=[];
TPSC=[];
for j=-60:80
    name=strcat(S,int2str(j));
    %[x,y]=rocPoint(name);
    [FP,FN,TP] = FPFNTP_Point2(name);
    FPSC=[FPSC,FP];
    FNSC=[FNSC,FN];
    TPSC=[TPSC,TP];
end
FPSCS = sum(FPSC);
FNSCS = sum(FNSC);
TPSCS = sum(TPSC);

SCFB = FBeta(TPSCS,FNSCS,FPSCS,Beta);

FB_SEA_Ori = [CGFB SEQFB2 UNIFB NAIVEFB SCFB]
