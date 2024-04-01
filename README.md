# MedOrion Data Engineering Task

MedOrion is a healthcare company that motivates patients to take care of their health. 
The service is about sending custom messages to the patients based on the patient's health condition. 
The messages are sent in batches every month.

## The Data 
You can find [here](./seeds) the 2 CSV files:
- members - updated weekly, (members == patients) 
- members_care_status - updated weekly - append only

Those files are already loaded to BigQuery, and you can find them in the [`coding-exercises-418913.raw_data` dataset](https://console.cloud.google.com/bigquery?organizationId=334929111005&project=coding-exercises-418913&ws=!1m4!1m3!3m2!1scoding-exercises-418913!2sraw_data).

## Requirements
Based on the information in those files, our decision model decide which message we will send to each member.

The data science team train the model using a features set that is calculated for each **active** member.

Here are the features that we need to create:
- `gender`
- `age`
- `has_diabetes`
- `adherent_to_diabetes_medications`
- `diabetes_medications_trend`
- `has_high_colorectal`
- `adherent_to_high_colorectal_medications`
- `to_high_colorectal_medications_trend`
- `has_high_blood_pressure`
- `adherent_to_high_blood_pressure_medications`
- `high_blood_pressure_medications_trend`
- `number_of_medical_conditions`

We assume that a member is adherent to a medication if the **latest** status of the associated medication it greater than 0.8.

For calculating the trend of the medication for a condition, we will use the last 2 statuses of the medication.
The options for the trend are: `('increasing', 'decreasing', 'no_change')`.

The features should be easy to query by the data science team. Usually they will need all of them at the same time.

### Instructions
- You should implement the above requirements as a model(s) using DBT.
- You should explore the tables and infer what should be the logic of the calculation.
- You should think what is the right way to model the data, and decide about the tables structure.
- Take into account that we might need to create more features in the future.
- If you are not sure about the logic then you can ask for clarification or make an assumption and document it.
- Try to avoid repeating code by using [macros](https://docs.getdbt.com/docs/build/jinja-macros) when it is possible.
- Place all the models in the same dataset, even if it makes more sense to split to different schemas.
- Share your solution using GitHub.

### Recommended steps
- Install gcloud using this [guide](https://cloud.google.com/sdk/docs/install).
- Login to you GCP account using the command like `gcloud auth login --update-adc`.
- Install DBT using this [guide](https://docs.getdbt.com/docs/core/pip-install).
- Configure your DBT project to use the BigQuery profile (see bellow).
- Start with data exploration, and ask for clarification if needed.
- Create new DBT project (if you don't have DBT installed follow this [guide](https://docs.getdbt.com/docs/core/pip-install)).
- Think about the right models structure and then implement it.  
- Leave `[condition]_medication_trend` features to the end.
- We believe that the task should take about 3 hours. We respect your time, if you go over the 3 hours then you can stop and submit what you have done.

### Configure your DBT project to use the BigQuery profile
In order to create a new profile for DBT you can use the command below.

Make sure you replace `<REPLACE_WITH_YOUR_FIRST_NAME>` with your first name (Notice that you have access only to this specific schema, so the name must be accurate):
```bash
echo '
medorion_data_engineering_task:
  outputs:
    dev:
      dataset: dbt_<REPLACE_WITH_YOUR_FIRST_NAME>
      job_execution_timeout_seconds: 3000
      job_retries: 0
      location: US
      method: oauth
      priority: interactive
      project: coding-exercises-418913
      threads: 4
      type: bigquery
  target: dev' >> ~/.dbt/profiles.yml
```

### Important!
Do not open a PR to this repository. Please fork it and push you work to your own repository.


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)