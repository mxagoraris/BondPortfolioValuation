%It calculates the price of every individual Bond using the Spot Curve 
%and its bond individual characteristics
function [P,Ytm_opt,CashflowTimes,Cashflows]=BondPriceOffSpotCurve(Bondportfolio,SpotCurve,i)
if SpotCurve.decision==1
CashflowTimes = [Bondportfolio.Maturities(i):-Bondportfolio.CpnPeriods(i):1/360]';
CashflowTimes = flip(CashflowTimes);
Cashflows = CashflowTimes*0 + Bondportfolio.CpnRates(i)*Bondportfolio.CpnPeriods(i)*Bondportfolio.FVs(i);
Cashflows(end) = Cashflows(end) + Bondportfolio.FVs(i);
r_onCashflowTimes = interp1(SpotCurve.SpotTenors,SpotCurve.SpotRates,CashflowTimes,"pchip");
dfs = exp(-r_onCashflowTimes.*CashflowTimes);
P= dfs'*Cashflows;
f=@(y)errorofYtM2BondPrice(Bondportfolio,y,P,i);
Ytm_Guess=interp1(SpotCurve.SpotTenors,SpotCurve.SpotRates,Bondportfolio.Maturities(i),"pchip");
Ytm_opt=lsqnonlin(f,Ytm_Guess);
else
    CashflowTimes = [Bondportfolio.Maturities(i):-Bondportfolio.CpnPeriods(i):1/360]';
CashflowTimes = flip(CashflowTimes);
Cashflows = CashflowTimes*0 + Bondportfolio.CpnRates(i)*Bondportfolio.CpnPeriods(i)*Bondportfolio.FVs(i);
Cashflows(end) = Cashflows(end) + Bondportfolio.FVs(i);
r_onCashflowTimes = interp1(SpotCurve.SpotTenors,SpotCurve.SpotRates1bps,CashflowTimes,"pchip");
dfs = exp(-r_onCashflowTimes.*CashflowTimes);
P= dfs'*Cashflows;
f=@(y)errorofYtM2BondPrice(Bondportfolio,y,P,i);
Ytm_Guess=interp1(SpotCurve.SpotTenors,SpotCurve.SpotRates,Bondportfolio.Maturities(i),"pchip");
Ytm_opt=lsqnonlin(f,Ytm_Guess);
end
end