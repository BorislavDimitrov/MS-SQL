SELECT TOP(2) sq.DepositGroup
FROM(SELECT DepositGroup, AVG(MagicWandSize) AS AvgSize
FROM WizzardDeposits
GROUP BY DepositGroup) AS sq
ORDER BY sq.AvgSize ASC
