/*looking at total cases vs total deaths percentage*/
SELECT location, date, total_cases, total_deaths, (total_deaths / total_cases) * 100 AS death_percentage
FROM coviddeaths_csv
WHERE location = 'Ukraine'
ORDER BY 1,2

/*looking at countries with highest infection rate compare to population */
SELECT location, population, MAX(total_cases) as highest_infection, MAX((total_cases / population)) * 100 AS percent_population_infected
FROM coviddeaths_csv
GROUP by location, population
ORDER BY percent_population_infected DESC

/*show countries with highest death count per population*/
SELECT location, MAX (total_deaths) as total_death_count
FROM coviddeaths_csv
GROUP by location
ORDER BY total_death_count DESC

INSERT INTO classic_bicycle (classic_bicycle_id, class_b_brand, class_b_frame, class_b_colour) 
VALUES (1, 'Manufacturer1', 'Steel', 'White');
INSERT INTO classic_bicycle (classic_bicycle_id, class_b_brand, class_b_frame, class_b_colour) 
VALUES (2, 'Rinoc', 'Steel', 'BlackAndRed');
INSERT INTO classic_bicycle (classic_bicycle_id, class_b_brand, class_b_frame, class_b_colour) 
VALUES (3, 'Rinoc', 'Aluminium', 'Green');

SELECT date,
       SUM(new_cases) AS total_cases,
       (SUM(CAST(new_deaths AS int)) AS total_deaths,
       (SUM(CAST(new_deaths AS int)) / SUM(new_cases)) * 100 AS death_percentage
FROM portfolioproject.coviddeaths_csv
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY date;