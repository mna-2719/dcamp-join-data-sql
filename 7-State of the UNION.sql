-- Select fields from 2010 table
SELECT code, year, income_group, gross_savings
  -- From 2010 table
  FROM economies2010
	-- Set theory clause
	UNION
-- Select fields from 2015 table
SELECT code, year, income_group, gross_savings
  -- From 2015 table
  FROM economies2015
-- Order by code and year
ORDER BY code, year;


-- Select field
SELECT country_code
  -- From cities
  FROM cities
	-- Set theory clause
	UNION
-- Select field
SELECT currencies.code AS country_code
  -- From currencies
  FROM currencies
-- Order by country_code
ORDER BY country_code;


-- Select fields
SELECT code, year
  -- From economies
  FROM economies
	-- Set theory clause
	UNION ALL
-- Select fields
SELECT country_code AS code, year
  -- From populations
  FROM populations
-- Order by code, year
ORDER BY code, year;