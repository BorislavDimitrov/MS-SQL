SELECT wd.DepositGroup,IsDepositExpired AS IsDepositExpired, AVG(wd.DepositInterest) AS AverageInterest
FROM WizzardDeposits AS wd
WHERE wd.DepositStartDate > '1985-01-01'
GROUP BY wd.DepositGroup, wd.IsDepositExpired
ORDER BY wd.DepositGroup DESC, wd.IsDepositExpired