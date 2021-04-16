%It calculates and returns the error between the True Price 
%and the cash flows discounted with a given yieldend
function e=errorCfls2Price(CashflowTimes,Cashflows,Ytm,TruePrice)
e=TruePrice-Cashflows'*exp(-CashflowTimes*Ytm);
end