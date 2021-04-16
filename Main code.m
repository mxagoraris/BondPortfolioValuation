%BondPortfolio Valuation
%Main code, here you can do changes
clear all;
BondPortfolio.CpnRates = [3/100;4/100; 2.5/100];
BondPortfolio.CpnPeriods = [0.5;0.5;1];
BondPortfolio.FVs = [100;150;-120];
BondPortfolio.Maturities = [8;3.32;6.11];
SpotCurve.SpotRates = [0.2, 0.78, 1.11, 1.58, 1.73 , 2.01, 2.20, 2.38]/100';
SpotCurve.SpotTenors = [1/360, 1/12, 1/2, 1, 2 ,3 , 5 , 10]' ;
BondPortfolio.Prices = BondPortfolio.FVs*0;
BondPortfolio.YtMs = BondPortfolio.FVs*0;
SpotCurve.CompoundingFrequency = "Continuous";
SpotCurve.decision = 1;
[BondPortfolio] = BPortfolioPriceoffspotCurve(BondPortfolio,SpotCurve);
[BondPortfolio] = CalcBondPortfolioYtM(BondPortfolio,SpotCurve.decision);
[BondPortfolio,SpotCurve] = CalcBondPortfolioIRSens(BondPortfolio,SpotCurve);

