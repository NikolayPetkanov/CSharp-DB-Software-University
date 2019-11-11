  SELECT LEFT(wd.FirstName, 1) AS [FirstLetter]
    FROM WizzardDeposits AS wd
   WHERE wd.DepositGroup = 'Troll Chest'
GROUP BY LEFT(wd.FirstName, 1)