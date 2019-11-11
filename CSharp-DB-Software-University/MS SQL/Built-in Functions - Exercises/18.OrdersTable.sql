SELECT o.ProductName,
       o.OrderDate,
       DATEADD(DAY, 3, o.OrderDate) AS [Pay Date],
       DATEADD(MONTH, 1, o.OrderDate) AS [Deliver Date]
  FROM Orders AS o