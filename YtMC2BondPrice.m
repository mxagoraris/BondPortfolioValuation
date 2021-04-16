%Calculates and returns the Price of an individual Bond with given single YtM
function Price = YtMC2BondPrice(BondPortfolio,y,i)
CashFlowTimes = [BondPortfolio.Maturities(i):-BondPortfolio.CpnPeriods(i):1/360]'; %It creates cashflowtimes
CashFlowTimes = flip(CashFlowTimes);
Cashflows = CashFlowTimes * 0  + BondPortfolio.FVs(i)*BondPortfolio.CpnPeriods(i)*BondPortfolio.CpnRates(i);
Cashflows(end)= Cashflows(end)+BondPortfolio.FVs(i);
dfs = exp(CashFlowTimes.*y); %we use continues compounding
Price = dfs'*Cashflows; %we calculate the pricr
end