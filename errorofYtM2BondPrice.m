%Calculates and returns the error
function e = errorofYtM2BondPrice(BondPortfolio,YtM_Guess,PriceTrue,i)
e = PriceTrue - YtMC2BondPrice(BondPortfolio,YtM_Guess,i);
end