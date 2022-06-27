SELECT SUM(sq.Difference) AS SumDifference
FROM(SELECT wd.DepositAmount - LEAD(wd.DepositAmount,1) OVER (ORDER BY Id ) AS Difference
FROM WizzardDeposits AS wd) AS sq