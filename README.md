# MedOrion Data Engineering Task

MedOrion is a healthcare company that motivates patients to take care of their health. 
The service is about sending custom messages to the patients based on the patient's health condition. 
The messages are sent in batches every month.

## The Data 
You can find [here](./seeds) the 2 CSV files:
- members - updated weekly, (members == patients) 
- members_care_status - updated weekly - append only


## Requirements
Based on the information in those files, our decision model decide which message we will send to each member.

The data science team train the model using a features set that is calculated for each member.

Here are the features that we need to create:
- `gender`
- `age`
- `has_diabetes`
- `adherent_to_diabetes_medications`
- `has_high_colorectal`
- `adherent_to_high_colorectal_medications`
- `has_high_blood_pressure`
- `adherent_to_high_blood_pressure_medications`
- `number_of_medical_conditions`

We assume that a member is adherent to a medication if the **latest** status of the associated medication it greater than 0.8. 

The features should be easy to query by the data science team. Usually they will need all of them at the same time.
In addition, they should be able to know when the features were calculated.

### Instructions
- You should implement the above requirements as a model(s) using DBT.
- You should explore the tables and infer what should be the logic of the calculation.
- You should think what is the right way to model the data, and decide about the tables structure.
- Take into account that we might need to create more features in the future.
- If you are not sure about the logic then you can ask for clarification or make an assumption and document it.
- Try to avoid repeating code by using [macros](https://docs.getdbt.com/docs/build/jinja-macros) when it is possible.
- Share your solution using GitHub. 

### Recommended steps
- Start with data exploration, and ask for clarification if needed.
- In BigQuery, Create a new schema and manually load the CSVs. You can use [load file upload option](https://cloud.google.com/bigquery/docs/batch-loading-data#loading_data_from_local_files) in the BigQuery UI.
- Create new DBT project (if you don't have DBT installed follow this [guide](https://docs.getdbt.com/docs/core/pip-install)).
- Think about the right models structure and then implement it.  
- We believe that the task should take about 2 hours. We respect your time, if you go over the 2 hours then you can stop and submit what you have done.


### Important!
Do not open a PR to this repository. Please fork it and push you work to your own repository.


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)