# How much water and land we have . Who has the most area of land and water for each state 

SELECT State_Name, ALand, AWater
FROM ushouseholdincome;

#We will use some aggregate to make more accurate

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM ushouseholdincome
GROUP BY State_Name
ORDER BY 2 DESC;

#The top 10 largest states by land 
SELECT State_Name, SUM(ALand)
FROM ushouseholdincome
GROUP BY State_Name
ORDER BY 2 DESC 
LIMIT 10;

SELECT *
FROM ushouseholdincome u
JOIN ushouseholdincome_statistics us
ON u.id=us.id
WHERE Mean<>0;

SELECT u.State_Name, County, Type, `Primary`, Mean, Median
FROM ushouseholdincome u
JOIN ushouseholdincome_statistics us
ON u.id=us.id
WHERE Mean<>0;

SELECT u.State_Name, 
ROUND(AVG(Mean),1),
ROUND(AVG(Median),1)
FROM ushouseholdincome u
JOIN ushouseholdincome_statistics us
ON u.id=us.id
WHERE Mean<>0
GROUP BY u.State_Name;

#By state , what is their average invcome , and their median income 

SELECT u.State_Name, 
ROUND(AVG(Mean),1),
ROUND(AVG(Median),1)
FROM ushouseholdincome u 
JOIN ushouseholdincome_statistics us
ON u.id=us.id
WHERE Mean<>0
GROUP BY u.State_Name
ORDER BY 2
LIMIT 5;

SELECT *
FROM ushouseholdincome
WHERE Type='Community';

SELECT  u.State_Name, 
City,
ROUND(AVG(Mean),1)
FROM ushouseholdincome u 
JOIN ushouseholdincome_statistics us
ON u.id=us.id
GROUP BY u.State_Name, City
ORDER BY ROUND(AVG(Mean),1) DESC ;

#Some cities are making a big amount of money 

