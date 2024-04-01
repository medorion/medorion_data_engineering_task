{%
set feature_to_measure = get_adherent_to_feature_to_measure()
    %}

SELECT member_id, {% for feature, measure in feature_to_measure.items() %}
    LOGICAL_OR(measure_id = '{{ measure }}' and status > 0.8) AS {{ feature }},
   {% endfor %}
FROM {{ source ('raw_data', 'members') }}
    LEFT JOIN {{ ref ('latest_members_care_status') }}
    USING (member_id)
GROUP BY member_id
