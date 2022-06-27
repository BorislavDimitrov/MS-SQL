SELECT DISTINCT LEFT(wd.FirstName, 1) AS FirstLetter
FROM WizzardDeposits AS wd
WHERE wd.DepositGroup LIKE 'Troll Chest'
ORDER BY FirstLetter