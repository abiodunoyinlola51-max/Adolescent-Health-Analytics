
-- ============================================================
-- PROJECT: Adolescent Health and Well-being in Nigeria
-- DATA SOURCE: Synthetic dataset of 1,000 fictional records
-- TOOL: MySQL 8.0
-- TABLE: mytable
-- PURPOSE: SQL practice and exploratory data analysis
--
-- IMPORTANT LIMITATION:
-- This dataset is synthetic and does not represent actual
-- Nigerian adolescent health statistics.
-- ============================================================


-- SECTION 1: TOTAL NUMBER OF PARTICIPANTS

SELECT
    COUNT(*) AS total_records
FROM mytable;


-- SECTION 2: AGE DISTRIBUTION

SELECT
    Age,
    COUNT(*) AS total_participants
FROM mytable
GROUP BY Age
ORDER BY Age;


-- SECTION 3: GROUP PARTICIPANTS BY AGE

SELECT
    CASE
        WHEN Age BETWEEN 10 AND 14
            THEN 'Younger adolescents'
        WHEN Age BETWEEN 15 AND 19
            THEN 'Older adolescents'
        ELSE 'Check age'
    END AS age_group,
    COUNT(*) AS total_participants
FROM mytable
GROUP BY age_group
ORDER BY MIN(Age);


-- SECTION 4: PHYSICAL ACTIVITY DISTRIBUTION

SELECT
    Physical_activity,
    COUNT(*) AS total_participants,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM mytable),
        2
    ) AS percentage
FROM mytable
GROUP BY Physical_activity
ORDER BY total_participants DESC;


-- SECTION 5: PHYSICAL ACTIVITY BY AGE GROUP

SELECT
    CASE
        WHEN Age BETWEEN 10 AND 14
            THEN 'Younger adolescents'
        WHEN Age BETWEEN 15 AND 19
            THEN 'Older adolescents'
        ELSE 'Check age'
    END AS age_group,
    Physical_activity,
    COUNT(*) AS total_participants
FROM mytable
GROUP BY age_group, Physical_activity
ORDER BY MIN(Age), Physical_activity;


-- SECTION 6: PHYSICAL ACTIVITY PERCENTAGES BY AGE GROUP

SELECT
    CASE
        WHEN Age BETWEEN 10 AND 14
            THEN 'Younger adolescents'
        WHEN Age BETWEEN 15 AND 19
            THEN 'Older adolescents'
        ELSE 'Check age'
    END AS age_group,
    Physical_activity,
    COUNT(*) AS total_participants,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY
                CASE
                    WHEN Age BETWEEN 10 AND 14
                        THEN 'Younger adolescents'
                    WHEN Age BETWEEN 15 AND 19
                        THEN 'Older adolescents'
                    ELSE 'Check age'
                END
        ),
        2
    ) AS percentage
FROM mytable
GROUP BY age_group, Physical_activity
ORDER BY MIN(Age), Physical_activity;


-- SECTION 7: AVERAGE SLEEP BY SEX

SELECT
    Sex,
    ROUND(AVG(Sleep_Hours), 2) AS average_sleep_hours,
    COUNT(*) AS total_participants
FROM mytable
GROUP BY Sex;


-- SECTION 8: HEALTHCARE ACCESS BY RESIDENCE

SELECT
    Residence,
    Healthare_Access,
    COUNT(*) AS total_participants
FROM mytable
GROUP BY Residence, Healthare_Access
ORDER BY Residence, total_participants DESC;


-- SECTION 9: WELLBEING BY PHYSICAL ACTIVITY

SELECT
    Physical_activity,
    Wellbeing,
    COUNT(*) AS total_participants,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY Physical_activity
        ),
        2
    ) AS percentage
FROM mytable
GROUP BY Physical_activity, Wellbeing
ORDER BY Physical_activity, Wellbeing;


-- SECTION 10: PARTICIPANTS WITH LOW WELLBEING

SELECT
    Physical_activity,
    COUNT(*) AS low_wellbeing_participants
FROM mytable
WHERE Wellbeing = 'Low'
GROUP BY Physical_activity
ORDER BY low_wellbeing_participants DESC;


-- SECTION 11: LOW WELLBEING RATE BY PHYSICAL ACTIVITY

SELECT
    Physical_activity,
    COUNT(*) AS total_participants,
    SUM(
        CASE
            WHEN Wellbeing = 'Low' THEN 1
            ELSE 0
        END
    ) AS low_wellbeing_count,
    ROUND(
        SUM(
            CASE
                WHEN Wellbeing = 'Low' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS low_wellbeing_percentage
FROM mytable
GROUP BY Physical_activity;


-- SECTION 12: HEALTHCARE ACCESS BY RESIDENCE WITH PERCENTAGES

SELECT
    Residence,
    Healthare_Access,
    COUNT(*) AS total_participants,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY Residence
        ),
        2
    ) AS percentage
FROM mytable
GROUP BY Residence, Healthare_Access
ORDER BY Residence, Healthare_Access;


-- SECTION 13: SLEEP STATISTICS BY AGE GROUP

SELECT
    CASE
        WHEN Age BETWEEN 10 AND 14
            THEN 'Younger adolescents'
        WHEN Age BETWEEN 15 AND 19
            THEN 'Older adolescents'
        ELSE 'Check age'
    END AS age_group,
    ROUND(AVG(Sleep_Hours), 2) AS average_sleep_hours,
    MIN(Sleep_Hours) AS minimum_sleep,
    MAX(Sleep_Hours) AS maximum_sleep,
    COUNT(*) AS total_participants
FROM mytable
GROUP BY age_group
ORDER BY MIN(Age);


-- SECTION 14: INVESTIGATE SLEEP VALUES OUTSIDE 4-12 HOURS

SELECT
    Participant_ID,
    Age,
    Sleep_Hours
FROM mytable
WHERE Sleep_Hours < 4
   OR Sleep_Hours > 12
ORDER BY Sleep_Hours DESC;


-- SECTION 15: SUGARY-DRINK CONSUMPTION

SELECT
    Sugary_Drinks,
    COUNT(*) AS total_participants,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM mytable),
        2
    ) AS percentage
FROM mytable
GROUP BY Sugary_Drinks
ORDER BY total_participants DESC;


-- SECTION 16: SCREEN TIME BY RESIDENCE

SELECT
    Residence,
    ROUND(AVG(Screen_Time_Hours), 2) AS average_screen_time,
    MIN(Screen_Time_Hours) AS minimum_screen_time,
    MAX(Screen_Time_Hours) AS maximum_screen_time,
    COUNT(*) AS total_participants
FROM mytable
GROUP BY Residence;


-- SECTION 17: SCHOOL ATTENDANCE BY RESIDENCE

SELECT
    Residence,
    School_Attendance,
    COUNT(*) AS total_participants,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY Residence
        ),
        2
    ) AS percentage
FROM mytable
GROUP BY Residence, School_Attendance
ORDER BY Residence, School_Attendance;


-- SECTION 18: HEALTH EDUCATION BY AGE GROUP

SELECT
    CASE
        WHEN Age BETWEEN 10 AND 14
            THEN 'Younger adolescents'
        WHEN Age BETWEEN 15 AND 19
            THEN 'Older adolescents'
        ELSE 'Check age'
    END AS age_group,
    Health_Education,
    COUNT(*) AS total_participants,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY
                CASE
                    WHEN Age BETWEEN 10 AND 14
                        THEN 'Younger adolescents'
                    WHEN Age BETWEEN 15 AND 19
                        THEN 'Older adolescents'
                    ELSE 'Check age'
                END
        ),
        2
    ) AS percentage
FROM mytable
GROUP BY age_group, Health_Education
ORDER BY MIN(Age), Health_Education;


-- SECTION 19: WELLBEING BY AGE GROUP

SELECT
    CASE
        WHEN Age BETWEEN 10 AND 14
            THEN 'Younger adolescents'
        WHEN Age BETWEEN 15 AND 19
            THEN 'Older adolescents'
        ELSE 'Check age'
    END AS age_group,
    Wellbeing,
    COUNT(*) AS total_participants,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY
                CASE
                    WHEN Age BETWEEN 10 AND 14
                        THEN 'Younger adolescents'
                    WHEN Age BETWEEN 15 AND 19
                        THEN 'Older adolescents'
                    ELSE 'Check age'
                END
        ),
        2
    ) AS percentage
FROM mytable
GROUP BY age_group, Wellbeing
ORDER BY MIN(Age), Wellbeing;


-- SECTION 20: CHECK FOR DUPLICATE PARTICIPANT IDS
-- Expected result: zero rows

SELECT
    Participant_ID,
    COUNT(*) AS occurrences
FROM mytable
GROUP BY Participant_ID
HAVING COUNT(*) > 1;


-- SECTION 21: CHECK FOR MISSING VALUES IN KEY COLUMNS

SELECT
    SUM(
        CASE
            WHEN Participant_ID IS NULL
                 OR TRIM(Participant_ID) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_id,

    SUM(
        CASE WHEN Age IS NULL
        THEN 1 ELSE 0 END
    ) AS missing_age,

    SUM(
        CASE
            WHEN Sex IS NULL OR TRIM(Sex) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_sex,

    SUM(
        CASE WHEN Sleep_Hours IS NULL
        THEN 1 ELSE 0 END
    ) AS missing_sleep,

    SUM(
        CASE
            WHEN Physical_activity IS NULL
                 OR TRIM(Physical_activity) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_activity,

    SUM(
        CASE
            WHEN Wellbeing IS NULL OR TRIM(Wellbeing) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_wellbeing

FROM mytable;


-- SECTION 22: VALIDATE CATEGORICAL VALUES

SELECT
    'Physical_activity' AS column_name,
    Physical_activity AS category,
    COUNT(*) AS total
FROM mytable
GROUP BY Physical_activity

UNION ALL

SELECT
    'Wellbeing',
    Wellbeing,
    COUNT(*)
FROM mytable
GROUP BY Wellbeing

UNION ALL

SELECT
    'Health_Education',
    Health_Education,
    COUNT(*)
FROM mytable
GROUP BY Health_Education

UNION ALL

SELECT
    'School_Attendance',
    School_Attendance,
    COUNT(*)
FROM mytable
GROUP BY School_Attendance

ORDER BY column_name, category;


-- END OF SQL ANALYSIS
