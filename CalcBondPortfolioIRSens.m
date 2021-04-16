%It calculates and adds to the BondPorfolio the Sensitivies of each 
%Bond and of the Portfolio
function [BondPortfolio,SpotCurve] = CalcBondPortfolioIRSens(BondPortfolio,SpotCurve)
SpotCurve.SpotRates1bps = SpotCurve.SpotRates +1e-4;
SpotCurve.decision = 0;
[BondPortfolio] = BPortfolioPriceoffspotCurve(BondPortfolio,SpotCurve);
BondPortfolio.BPVS =BondPortfolio.Prices1bp-BondPortfolio.Prices';
BondPortfolio.PBPVS = BondPortfolio.PPrice1bp-BondPortfolio.PPrice;
BondPortfolio.DDuration = BondPortfolio.BPVS.*1e4;
BondPortfolio.PDDuration = BondPortfolio.PBPVS.*1e4;
BondPortfolio.ModDuration = BondPortfolio.DDuration./BondPortfolio.Prices';
BondPortfolio.PModDuration = BondPortfolio.PDDuration./BondPortfolio.PPrice;
end