    SELECT mc.CountryCode,
           COUNT(m.MountainRange) AS [MountainRanges]
      FROM MountainsCountries mc
INNER JOIN Mountains m
	ON m.Id = mc.MountainId
     WHERE mc.CountryCode IN ('US', 'RU', 'BG')
  GROUP BY mc.CountryCode
