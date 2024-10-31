SELECT * FROM us_project.ushouseholdincome;
SELECT * FROM us_project.ushouseholdincome_statistics;

SELECT *
FROM ushouseholdincome ;

SELECT * 
FROM ushouseholdincome_statistics ;

ALTER TABLE ushouseholdincome_statistics RENAME COLUMN `ď»żid` TO `id` ;

SELECT COUNT(id)
FROM ushouseholdincome
;

SELECT COUNT(id)
FROM ushouseholdincome_statistics
;

SELECT id, COUNT(id)
FROM ushouseholdincome
GROUP BY id
HAVING COUNT(id)>1;

SELECT *
FROM (
SELECT row_id,
id,
ROW_NUMBER () OVER (PARTITION BY id ORDER BY id) row_num
FROM ushouseholdincome
) duplicates 
WHERE row_num>1
;

DELETE FROM ushouseholdincome 
WHERE row_id IN (
SELECT row_id
FROM (
SELECT row_id,
id,
ROW_NUMBER () OVER (PARTITION BY id ORDER BY id) row_num
FROM ushouseholdincome
) duplicates 
WHERE row_num>1)
;

SELECT id, COUNT(id)
FROM ushouseholdincome
GROUP BY id
HAVING COUNT(id)>1;

SELECT State_Name, COUNT(State_Name)
FROM ushouseholdincome
GROUP BY State_Name ;


SELECT DISTINCT State_Name
FROM ushouseholdincome
ORDER BY 1 ;

UPDATE ushouseholdincome
SET State_Name='Georgia'
WHERE State_Name='georia';

UPDATE ushouseholdincome
SET State_Name='Alabama'
WHERE State_Name='alabama';

SELECT *
FROM ushouseholdincome
WHERE Place=''
ORDER BY 1;

UPDATE ushouseholdincome
SET Place='Autaugaville'
WHERE County='Autauga County'
AND City='Vinemont';

SELECT Type, COUNT(Type)
FROM ushouseholdincome
GROUP BY Type;

UPDATE ushouseholdincome
SET Type='Borough'
WHERE Type='Boroughs';

SELECT ALand, AWater
FROM ushouseholdincome
WHERE (AWater=0 OR AWater='' OR AWater IS NULL)
;

#We changed the name , check the duplicates and removed those. We found some issues in the state name , we changed the values missing ,and full those.