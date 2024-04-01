{{ config(materialized='table') }}

SELECT member_id,
       gender,
       DATE_DIFF(CURRENT_DATE, date_of_birth, YEAR)
           + IF(EXTRACT(DAYOFYEAR FROM CURRENT_DATE) < EXTRACT(DAYOFYEAR FROM date_of_birth), -1, 0) as age
FROM {{ source ('raw_data', 'members') }}