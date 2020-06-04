SELECT C.CODE AS CODE, NAME, REGION, YEAR, FERTILITY_RATE
FROM COUNTRIES AS C
INNER JOIN POPULATIONS AS P
ON C.CODE=P.COUNTRY_CODE


-- 5. Select fields with aliases
SELECT P1.COUNTRY_CODE,
       p1.size AS size2010,
       p2.size AS size2015
-- 1. From populations (alias as p1)
FROM populations as p1
  -- 2. Join to itself (alias as p2)
  INNER JOIN populations as p2
    -- 3. Match on country code
    ON P1.COUNTRY_CODE=P2.COUNTRY_CODE
        -- 4. and year (with calculation)
        AND P1.YEAR=P2.YEAR-5;


SELECT p1.country_code,
       p1.size AS size2010, 
       p2.size AS size2015,
       -- 1. calculate growth_perc
       ((P2.SIZE - P1.SIZE)/P1.SIZE * 100.0) AS GROWTH_PERC
-- 2. From populations (alias as p1)
FROM populations AS P1
  -- 3. Join to itself (alias as p2)
  INNER JOIN populations AS P2
    -- 4. Match on country code
    ON p1.COUNTRY_CODE = p2.COUNTRY_CODE
        -- 5. and year (with calculation)
        AND p1.YEAR = p2.YEAR - 5;




SELECT name, continent, code, surface_area,
    CASE WHEN surface_area > 2000000
            THEN 'large'
       WHEN surface_area > 350000
            THEN 'medium'
       ELSE 'small' END
       AS geosize_group
INTO countries_plus
FROM countries;


SELECT country_code, size,
    -- 1. First case
    CASE WHEN size > 50000000 THEN 'large'
        -- 2. Second case
        WHEN size > 1000000 THEN 'medium'
        -- 3. Else clause + end
        ELSE 'small' END
        -- 4. Alias name (popsize_group)
        AS popsize_group
-- 5. From table
INTO pop_plus
FROM populations
-- 6. Focus on 2015
WHERE year = 2015;




SELECT country_code, size,
  CASE WHEN size > 50000000
            THEN 'large'
       WHEN size > 1000000
            THEN 'medium'
       ELSE 'small' END
       AS popsize_group
INTO pop_plus       
FROM populations
WHERE year = 2015;

-- 5. Select fields
SELECT c.code AS code,p.country_code,
name, continent, geosize_group,popsize_group
-- 1. From countries_plus (alias as c)
FROM countries_plus AS c
  -- 2. Join to pop_plus (alias as p)
  INNER JOIN pop_plus AS p
    -- 3. Match on country code
    ON c.code=p.country_code
-- 4. Order the table    
ORDER BY geosize_group;