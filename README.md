# User Retention Cohort Analysis (SQL)

## Project Overview
This project focuses on data cleaning and the analysis of user retention behaviour using cohort analysis. 
By organising users into cohorts based on their sign-up month, the pipeline tracks ongoing engagement patterns and precisely measures how user retention changes over time.

## Tech Stack & Skills Demonstrated
* **SQL Dialect:** PostgreSQL / BigQuery
* **Advanced SQL Techniques:** Common Table Expressions (CTEs), Advanced String Manipulation ('split_part', 'replace', 'trim'), Data Type Casting ('to_date'), Date Truncation ('date_trunc'), Window Functions / Intervals ('age'), and Data Filtering.

## Data Pipeline Architecture
The script processes raw, unstructured tracking data through a clean three-step pipeline using CTEs:
1. 'clean_userdata': Standardises varied, messy text timestamps from raw signups into uniform date formats.
2. 'clean_eventdata': Filters out internal test events ('test_event'), standardises event activity timestamps, and maps revenues.
3. 'cte_3': Joins the sanitised user and activity data to calculate the exact 'month_offset' (the number of months elapsed between a user's signup and their subsequent activity).



## Analytical Interpretation 

Cohort tables show different levels of user engagement and product lifetime value across both categories. Users acquired through promotions (1) demonstrated poorer results—on average, their numbers are lower, and their product lifetime is significantly shorter compared to organically acquired users (0).

Business Recommendation: Re-evaluate the core strategy of the promotion. It is highly likely that category (1) users are motivated by FOMO (fear of missing out) rather than the actual benefits and utility of the product itself. In this case, the promotion is either inefficient because it targets the wrong audience or it misrepresents the true essence and value of the product. This hypothesis is supported by the behaviour of organic users (0), who stay retained longer and remain more active. Their assessment of the product's necessity and understanding of its benefits may be more grounded, as they are less influenced by advertising.
