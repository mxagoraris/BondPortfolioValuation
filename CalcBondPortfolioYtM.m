%Calculates the YTM of a portfolio, adds it in the structure and returns the structure
function [BondPortfolio] = CalcBondPortfolioYtM(BondPortfolio,decision)
if decision == 1
    f=@(y)errorCfls2Price(BondPortfolio.PCashflowTimes,BondPortfolio.PCashflows, y,BondPortfolio.PPrice);
    YtM_guess = mean(BondPortfolio.YtMs);
    BondPortfolio.PYtM = lsqnonlin(f,YtM_guess);
else
    f=@(y)errorCfls2Price(BondPortfolio.PCashflowTimes1bp,Bondportfolio.PCashflows1bp, y,Bondportfolio.PPrice);
    YtM_guess = mean(BondPortfolio.YtMs1bp);
    BondPortfolio.PYtM = lsqnonlin(f,YtM_guess);
end
end