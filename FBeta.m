function [FB] = FBeta(TP,FN,FP,Beta)

% FB = \frac{(1 + \beta^2) * TP}{ ( (1 + \beta^2) * TP  + \beta^2 *
% FN + FP )

Beta2 = Beta^2;

FB = ((1+Beta2)*TP) / ((1+Beta2)*TP + Beta2 * FN + FP);

