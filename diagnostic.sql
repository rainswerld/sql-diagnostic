DROP DATABASE IF EXISTS "sql-diagnostic";
CREATE DATABASE "sql-diagnostic";
\c "sql-diagnostic"
\pset pager 0


/*
Question 1. Create a table called `licensees` to hold data in columns last_name, first_name, height, weight, born_on, eye_color, hair_color.  See `data/licensees.csv` for example data.  Don't forget that all tables should have an id column as a unique identifier for a row.
*/

-- Your answer to question 1 should start on the following line
CREATE TABLE licensees(
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  height INTEGER,
  weight INTEGER,
  born_on DATE,
  eye_color TEXT,
  hair_color TEXT
);

/*
Question 2. Add `Bishop, Caren, 63, 132, 1943-09-26, Brown, Black` into the table of licensees.
*/

-- Your answer to question 2 should start on the following line
INSERT INTO licensees(last_name,first_name,height,weight,born_on,eye_color,hair_color) VALUES('Bishop', 'Caren', 63, 132, '1943-09-26', 'Brown', 'Black');

/*
After completing questions 1 and 2 uncomment the following /copy command (remove the two leading dashes) and run this file from the terminal with `psql --file=diagnostic.sql` to load data from `data/licensees.csv` into the `licensees` table.
*/

\copy licensees(last_name,first_name,height,weight,born_on,eye_color,hair_color) FROM './data/licensees.csv' WITH (FORMAT csv, HEADER true)

-- Question 3. Write a query to get all attributes of licensees with Hazel eye color and Brown or Black hair color.

-- Your answer to question 3 should start on the following line
SELECT *
FROM licensees
WHERE eye_color = 'Hazel'
  AND hair_color IN ('Brown', 'Black');

-- Question 4. Make each of Marilynn Escobar and Chris Whaley one inch shorter. Look them up by their names.

-- Your answers to question 4 should start on the following line
UPDATE licensees
SET height = height - 1
WHERE last_name = 'Folta'
  AND first_name = 'Marilynn'
OR last_name = 'Whaley'
  AND first_name = 'Chris';

-- Question 5. Remove Dylan Rich and Teresita Myers from the table of licensees.

-- Your answers to question 5 should start on the following line
DELETE FROM licensees
WHERE last_name = 'Rich'
  AND first_name = 'Dylan'
OR last_name = 'Myers'
  AND first_name = 'Teresita';
