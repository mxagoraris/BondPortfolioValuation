# Bond Portfolio Valuation with MATLAB
Bond Portfolio Valuation and Sensitivities

This code valuates a bond portfolio given a spot continues compounding curve.
It calculates the Yield to Maturity of portfolio.
It calculates the sensitivity factors of a portfolio.

Every information about Bond Portfolio is saved in a struct called BonPortfolio. Struct is a specific kind of data stucture used in MATLAB to save anything you want in there.

Yield to Maturity (YtM): Yield to maturity is the total return anticipated on a bond if the bond is held until it matures. Yield to maturity is considered a long-term bond yield but is expressed as an annual rate. In other words, it is the internal rate of return (IRR) of an investment in a bond if the investor holds the bond until maturity, with all payments made as scheduled and reinvested at the same rate. (https://www.investopedia.com/terms/y/yieldtomaturity.asp)

Fixed Income Sensitivities: Fixed-income investments are very sensitive to interest rate changes. A bond's duration reflects changes in the bond's price for each 1% fluctuation of the interest rate. For example, a bond with a duration of 4 means the bond price decreases/increases 4% for every 1% increase/decrease in interest rate. A bond with a long maturity and low coupon has a longer duration and therefore is more sensitive to rate fluctuations. Meanwhile, a bond's convexity is a measure of the curvature, or the degree of the curve, in the relationship between bond prices and bond yields. Convexity demonstrates the sensitivity of the duration of a bond changes as the interest rate changes. Portfolio managers will use convexity as a risk-management tool, to measure and manage the portfolio's exposure to interest rate risk. Buying a bond at a low-interest rate means the bond will be less valuable when rates rise and other bond yields are higher. This is simply because fixed-income investors will buy the higher-yielding bond, all else equal. Assets that are considered fixed income-like such as utility stocks and preferred stocks are two examples of rate-sensitive assets. (https://www.investopedia.com/terms/s/sensitivity.asp)
