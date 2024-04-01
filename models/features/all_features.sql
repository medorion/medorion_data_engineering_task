SELECT *
FROM {{ ref('members_features')}}
    LEFT JOIN {{ ref('adherent_to') }}
        USING(member_id)
#TODO