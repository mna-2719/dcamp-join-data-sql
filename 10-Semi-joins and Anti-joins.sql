-- Select code
SELECT code, region
  -- From countries
  FROM countries
-- Where region is Middle East
WHERE region = 'Middle East';

/*
SELECT code
  FROM countries
WHERE region = 'Middle East';
*/

-- Select field
SELECT DISTINCT name
  -- From languages
  FROM languages
-- Order by name
ORDER BY name;


-- Select distinct fields
SELECT DISTINCT name
  -- From languages
  FROM languages
-- Where in statement
WHERE code IN
  -- Subquery
  (SELECT code
  FROM countries
WHERE region = 'Middle East')
-- Order by name
ORDER BY name;

SELECT DISTINCT languages.name AS language
FROM languages
INNER JOIN countries
ON languages.code = countries.code
WHERE region = 'Middle East'
ORDER BY language;


-- Select statement
SELECT COUNT(*)
  -- From countries
  FROM countries
-- Where continent is Oceania
WHERE continent='Oceania';


-- 5. Select fields (with aliases)
SELECT c1.name AS name, c1.code, basic_unit AS currency
  -- 1. From countries (alias as c1)
  FROM countries AS c1
  	-- 2. Join with currencies (alias as c2)
  	INNER JOIN currencies AS c2
    -- 3. Match on code
    ON c1.code=c2.code
-- 4. Where continent is Oceania
WHERE continent='Oceania';


-- 3. Select fields
SELECT name, code
  -- 4. From Countries
  FROM countries
  -- 5. Where continent is Oceania
  WHERE continent='Oceania'
  	-- 1. And code not in
  	AND code NOT IN
  	-- 2. Subquery
  	(SELECT code
  	 FROM currencies);


-- Select the city name
SELECT c1.name 
  -- Alias the table where city name resides
  FROM cities AS c1
  -- Choose only records matching the result of multiple set theory clauses
  WHERE country_code IN
(
    -- Select appropriate field from economies AS e
    SELECT e.code
    FROM economies AS e
    -- Get all additional (unique) values of the field from currencies AS c2  
   UNION
    SELECT c2.code
    FROM currencies AS c2
    -- Exclude those appearing in populations AS p
    EXCEPT
    SELECT p.country_code
    FROM populations AS p
);
