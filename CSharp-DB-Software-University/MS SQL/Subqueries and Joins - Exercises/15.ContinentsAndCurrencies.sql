  SELECT MostUsedCurrency.ContinentCode,
	 MostUsedCurrency.CurrencyCode,
	 MostUsedCurrency.CurrencyUsage
    FROM (SELECT c.ContinentCode,
         	 c.CurrencyCode,
	     	 COUNT(c.CurrencyCode) AS [CurrencyUsage],
	     	 DENSE_RANK() OVER (PARTITION BY c.ContinentCode ORDER BY COUNT(c.CurrencyCode) DESC) 
		 AS [CurrencyRank]
    FROM Countries c
GROUP BY c.ContinentCode, c.CurrencyCode
  HAVING COUNT(c.CurrencyCode) > 1) AS MostUsedCurrency
   WHERE MostUsedCurrency.CurrencyRank = 1
ORDER BY MostUsedCurrency.ContinentCode