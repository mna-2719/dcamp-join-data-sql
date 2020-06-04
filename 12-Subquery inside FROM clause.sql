-- Select fields (with aliases)
SELECT COUNT(*) AS lang_num, code
  -- From languages
  FROM languages
-- Group by code
GROUP BY code;


-- Select fields
SELECT local_name, subquery.lang_num
  -- From countries
  FROM countries,
  	-- Subquery (alias as subquery)
  	(SELECT COUNT(*) AS lang_num, code
  	 FROM languages
  	 GROUP BY code) AS subquery
  -- Where codes match
  WHERE countries.code = subquery.code
-- Order by descending number of languages
ORDER BY lang_num DESC;


-- Select fields
SELECT name, continent, inflation_rate
  FROM countries
  	INNER JOIN economies
    ON countries.code = economies.code
WHERE year = 2015;




SELECT MAX(inflation_rate) AS max_inf
  FROM
  (SELECT name, continent, inflation_rate
  FROM countries
  	INNER JOIN economies
    USING(code)
WHERE year = 2015) AS subquery
GROUP BY continent;


-- Select fields
SELECT name, continent, inflation_rate
  -- From countries
  FROM countries
	-- Join to economies
	INNER JOIN economies
	ON countries.code = economies.code
	
  -- Where year is 2015
  WHERE year = 2015
    -- And inflation rate in subquery (alias as subquery)
    AND inflation_rate IN (
        SELECT MAX(inflation_rate) AS max_inf
        FROM (
             SELECT name, continent, inflation_rate
             FROM countries
             INNER JOIN economies
             ON countries.code = economies.code
             WHERE year = 2015) AS subquery
      -- Group by continent
        GROUP BY continent);


-- Select fields
SELECT code, inflation_rate, unemployment_rate
  -- From economies
  FROM economies
  -- Where year is 2015 and code is not in
  WHERE year = 2015 AND code NOT IN
  	-- Subquery
  	(SELECT code
  	 FROM countries
  	 WHERE (gov_form = 'Constitutional Monarchy' OR gov_form LIKE '%Republic%'))
-- Order by inflation rate
ORDER BY inflation_rate;
