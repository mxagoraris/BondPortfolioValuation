%This functio receives BondPortfolio and SpotCurve structure it calculates the Price
%YtM of every indivudual Bond and then calculates the Price the Cash Flows and the Cash Flow times for the whole portfolio and adds to the structure
function [BondPortfolio]=BPortfolioPriceoffspotCurve(BondPortfolio,SpotCurve)
numofBonds = length(BondPortfolio.FVs);
PCashflowTimes=[];
PCashflows=[];
if SpotCurve.decision == 1
   for i=1:numofBonds
   [BondPortfolio.Prices(i),BondPortfolio.YtMs(i),CashflowTimes,CFs]=BondPriceOffSpotCurve(BondPortfolio,SpotCurve,i) ;
   PCashflowtimesOld = PCashflowTimes;
   PCashflowTimes = union(PCashflowTimes,CashflowTimes);
   if i ==1
       PCashflows = CFs;
   else
       PCashflowsold = PCashflows;
       PCashflownew = PCashflowTimes*0;
       [~,ia,~]= intersect(PCashflowTimes, PCashflowtimesOld);
       [~,ib,~] = intersect(PCashflowTimes, CashflowTimes);
	   PCashflownew(ia) =  PCashflowsold;
	   PCashflownew(ib) = PCashflownew(ib)+CFs;
	   PCashflows = PCashflownew;
   end
   end
BondPortfolio.PPrice = sum(BondPortfolio.Prices);
BondPortfolio.PCashflowTimes = PCashflowTimes;
BondPortfolio.PCashflows=PCashflows;
else
   for i=1:numofBonds
   [BondPortfolio.Prices1bp(i),BondPortfolio.YtMs1bp(i),CashflowTimes,CFs]=BondPriceOffSpotCurve(BondPortfolio,SpotCurve,i) ;
   PCashflowtimesOld = PCashflowTimes;
   PCashflowTimes = union(PCashflowTimes,CashflowTimes);
   if i ==1
       PCashflows = CFs;
   else
       PCashflowsold = PCashflows;
       PCashflownew = PCashflowTimes*0;
       [~,ia,~]= intersect(PCashflowTimes, PCashflowtimesOld);
       [~,ib,~] = intersect(PCashflowTimes, CashflowTimes);
	   PCashflownew(ia) =  PCashflowsold;
	   PCashflownew(ib) = PCashflownew(ib)+CFs;
	   PCashflows = PCashflownew;
   end
   end
BondPortfolio.PPrice1bp = sum(BondPortfolio.Prices1bp);
BondPortfolio.PCashflowTimes1bp = PCashflowTimes;
BondPortfolio.PCashflows1bp=PCashflows;
end
end