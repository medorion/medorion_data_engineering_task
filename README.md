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

### The task
We already implemented the features that mentioned above, but we deleted the implementation of some of them.
You will find a `TODO` comments in the code that will guide you to the missing implementation.

- You should implement the missing features and make sure that it meets the requirements.
- You should think how to implement the logic of `has_[conditions]` and `[condition]_trend` how you can infer that using the data we have.
- You can add more models or macros if you think that it is needed, you don't have to stick to the current structure.

### Recommended steps
- Clone this repository.
- Install gcloud using this [guide](https://cloud.google.com/sdk/docs/install).
- Login to you GCP account using the command like `gcloud auth login --update-adc`.
- Install DBT using this [guide](https://docs.getdbt.com/docs/core/pip-install) (make sure to install `dbt-bigquery` adapter).
- Configure your DBT project to use the BigQuery profile (see bellow).
- Execute the DBT project using the command `dbt run`.
- Start with data exploration, and ask for clarification if needed.
- Implement the missing features. leave `condition_medication_trend.sql` to the end.
- We believe that the task should take about 3 hours. We respect your time, if you go over the 3 hours then you can stop and submit what you have done.
- Share your solution using GitHub. Do not open a PR to this repository!!! Please push it to your work to your own repository.


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
Do not open a PR to this repository!!! Please push it to your work to your own repository.


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
