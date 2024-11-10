SELECT * FROM kulturehire.data;
# 1. What is the gender distribution of respondents from India?
SELECT Gender, COUNT(*) AS Gender_Count
FROM data
WHERE `Country.` = 'India'
GROUP BY Gender;
#2. What percentage of respondents from India are interested in education abroad and sponsorship?
SELECT
AVG(CASE
WHEN `Would you pursue higher education / Post Graduation abroad ?` = 'Yes'
THEN 1
ELSE 0
END) * 100 AS Percentage_Interested
FROM data
WHERE `Country.` = 'India';

# 3. What are the 6 top influences on career aspirations for respondents in India?

SELECT `Factors influencing career aspirations`, COUNT(*) AS Influence_Count
FROM data
WHERE `Country.` = 'India'
GROUP BY `Factors influencing career aspirations`
ORDER BY Influence_Count DESC
LIMIT 6;

# 4. How do career aspiration influences vary by gender in India?
SELECT Gender, `Factors influencing career aspirations`, COUNT(*) AS Influence_Count
FROM data
WHERE `Country.` = 'India'
GROUP BY Gender, `Factors influencing career aspirations`
ORDER BY Gender, Influence_Count DESC;

# 5. What percentage of respondents are willing to work for a company for at least 3 years?
SELECT
AVG(CASE
WHEN `Work for one employer for 3 years or more ?` = 'Yes'
THEN 1
ELSE 0
END) * 100 AS Percentage_Willing
FROM data;
# 6. How many respondents prefer to work for socially impactful companies?
SELECT COUNT(*) AS Count_Socially_Impactful_Prefer
FROM data
WHERE `Work for a company with no social impact` = 'No';
# 7. How does the preference for socially impactful companies vary by gender?
SELECT
Gender,
AVG(CASE
WHEN `Work for a company with no social impact` = 'No'
THEN 1
ELSE 0
END) * 100 AS Percentage_Socially_Impactful_Prefer
FROM data
GROUP BY Gender;
# 8. What is the distribution of minimum expected salary in the first three years among respondents?

SELECT
CASE
WHEN `Initial Salary Expectation for 3 years (monthly salary in hand)` < 20000 THEN '< 20,000'
WHEN `Initial Salary Expectation for 3 years (monthly salary in hand)` BETWEEN 20000 AND 29999 THEN '20,000 - 29,999'
WHEN `Initial Salary Expectation for 3 years (monthly salary in hand)` BETWEEN 30000 AND 39999 THEN '30,000 - 39,999'
WHEN `Initial Salary Expectation for 3 years (monthly salary in hand)` BETWEEN 40000 AND 49999 THEN '40,000 - 49,999'
WHEN `Initial Salary Expectation for 3 years (monthly salary in hand)` >= 50000 THEN '50,000 and above'
END AS Salary_Range,
COUNT(*) AS Count_Respondents
FROM data
GROUP BY Salary_Range
ORDER BY Salary_Range;

# 9. What is the expected minimum monthly salary in hand?

SELECT MIN(`Starting Salary Expectations (Monthly in hand salary)`) AS Minimum_Expected_Salary,
COUNT(*) AS Count_Respondents
FROM data;

# 10. What percentage of respondents prefer remote working?

SELECT
AVG(CASE
WHEN `Preferred working environment` = 'Remote'
THEN 1
ELSE 0
END) * 100 AS Percentage_Remote_Working
FROM data;

# 11. What is the preferred number of daily work hours?

SELECT
AVG(`Daily Work Hours`) AS Average_Work_Hours,
MIN(`Daily Work Hours`) AS Minimum_Work_Hours,
MAX(`Daily Work Hours`) AS Maximum_Work_Hours,
COUNT(*) AS Count_Respondents
FROM data;

# 12. What are the common work frustrations among respondents?

SELECT
`Workplace Obstacles`,
COUNT(*) AS Count_Respondents
FROM data
GROUP BY `Workplace Obstacles`
ORDER BY Count_Respondents DESC;

# 13. How does the need for work-life balance interventions vary by gender?

SELECT
Gender,
`Weekly Break Frequency to maintain work life balance`,
COUNT(*) AS Count_Respondents
FROM data
GROUP BY Gender, `Weekly Break Frequency to maintain work life balance`
ORDER BY Gender, `Weekly Break Frequency to maintain work life balance`;

# 14. How many respondents are willing to work under an abusive manager?

SELECT
COUNT(*) AS Count_Willing_To_Work_Under_Abusive_Manager
FROM data
WHERE `Abusive Manager Tolerance` = 'Yes';

# 15. What is the distribution of minimum expected salary after five years?

SELECT
CASE
WHEN `Future Salary Expectation after 5 years (monthly salary in hand)` < 20000 THEN '< 20,000'
WHEN `Future Salary Expectation after 5 years (monthly salary in hand)` BETWEEN 20000 AND 29999 THEN '20,000 - 29,999'
WHEN `Future Salary Expectation after 5 years (monthly salary in hand)` BETWEEN 30000 AND 39999 THEN '30,000 - 39,999'
WHEN `Future Salary Expectation after 5 years (monthly salary in hand)` BETWEEN 40000 AND 49999 THEN '40,000 - 49,999'
WHEN `Future Salary Expectation after 5 years (monthly salary in hand)` >= 50000 THEN '50,000 and above'
END AS Salary_Range,
COUNT(*) AS Count_Respondents
FROM data
GROUP BY Salary_Range
ORDER BY Salary_Range;

# 16. What are the remote working preferences by gender?

SELECT
Gender,
`Preferred working environment`,
COUNT(*) AS Count_Respondents
FROM data
GROUP BY Gender, `Preferred working environment`
ORDER BY Gender, `Preferred working environment`;

# 17. What are the top work frustrations for each gender?

SELECT
Gender,
`Workplace Obstacles`,
COUNT(*) AS Count_Respondents
FROM data
GROUP BY Gender, `Workplace Obstacles`
ORDER BY Gender, Count_Respondents DESC;

# 18. What factors boost work happiness and productivity for respondents?

SELECT
`Workplace Happiness & Productivity Boosters`,
COUNT(*) AS Count_Respondents
FROM data
GROUP BY `Workplace Happiness & Productivity Boosters`
ORDER BY Count_Respondents DESC;

# 19. What percentage of respondents need sponsorship for education abroad?

SELECT
(SUM(`Would you pursue higher education / Post Graduation abroad ?` LIKE '%sponsorship%') * 100.0 / COUNT(*)) AS Percentage_Needing_Sponsorship
FROM data;
