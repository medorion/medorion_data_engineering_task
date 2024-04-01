{%macro get_has_condition_feature_to_measure() %}
#TODO
{%endmacro%}

{%macro get_adherent_to_feature_to_measure() %}
{%
set feature_to_measure = {
    'adherent_to_diabetes_medications':'adherent_to_diabetes_medications',
    'adherent_to_high_colorectal_medications':'adherent_to_high_colorectal_medications',
    'adherent_to_high_blood_pressure_medications':'adherent_to_high_blood_pressure_medications',
    }
    %}
    {{ return(feature_to_measure) }}
{%endmacro%}