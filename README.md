Adolescent Health and Well-being in Nigeria: A Data Analytics Project

Project Overview

This project demonstrates the use of SQL and Microsoft Excel to explore adolescent health and wellbeing indicators using a synthetic dataset of 1,000 fictional participants aged 10–19 years.
The project focuses on data validation, descriptive analysis, and comparisons across age groups and residential settings.
Important: This dataset is synthetic. It does not represent an official Nigerian survey or actual adolescent health outcomes.

Project Objectives
Examine participant distribution by age group.
Analyse physical activity and wellbeing categories.
Explore healthcare access by residential setting.
Compare screen time and school attendance across urban and rural participants.
Examine sugary-drink consumption and health education.
Perform data-quality checks using SQL.

Tools Used

MySQL 3.39
SQL
Microsoft Excel
GitHub

Dataset
The dataset contains 1,000 fictional participant records and variables relating to age, sex, state, residence, physical activity, sleep duration, fruit intake, sugary-drink consumption, screen time, school attendance, health education, healthcare access, and wellbeing.
SQL Techniques
SELECT, WHERE, GROUP BY and ORDER BY
Aggregate functions such as COUNT, AVG, MIN and MAX
CASE WHEN statements
Group comparisons

Data-quality checks for duplicate IDs, missing values and category consistency
Key Findings
The illustrative analysis found that:
59.6% of records were classified as physically active.
72.65% of urban records and 68.45% of rural records were classified as having accessible healthcare.
Average screen time was 6.45 hours for urban records and 6.34 hours for rural records.
No duplicate participant IDs were detected in the duplicate-ID check.
These findings describe only the synthetic dataset and must not be interpreted as estimates for Nigeria's adolescent population.
Data Quality and Limitations
The sleep-duration values ranged from 4 to 22 hours, although the intended generation range was 4–12 hours. This discrepancy requires investigation before sleep-related findings can be interpreted.
The dataset is fictional and cannot establish actual population patterns or causal relationships.

Project Files
adolescent_health_data.csv — synthetic dataset.
adolescent_health_analysis.sql — SQL analysis queries.
Excel workbook — dashboard and/or analysis workbook, depending on the uploaded file.

Conclusion
This project demonstrates how SQL and Excel can be used to validate, summarise, and explore health-related data. It provides a foundation for further development in healthcare analytics and public health data analysis.
