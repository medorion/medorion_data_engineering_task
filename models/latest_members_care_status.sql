SELECT *
FROM {{ source ('raw_data', 'members_care_status') }}
QUALIFY ROW_NUMBER() OVER (PARTITION BY member_id, measure_id order by date desc) = 1

