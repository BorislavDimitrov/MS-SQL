SELECT wd.DepositGroup, SUM(wd.DepositAmount)
FROM WizzardDeposits AS wd
WHERE wd.MagicWandCreator LIKE ('Ollivander family')
GROUP BY wd.DepositGroup