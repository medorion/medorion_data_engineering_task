# MedOrion Data Engineering Challenge

## Introduction
MedOrion is a healthcare company that motivates patients to take care of their health. 
The service is about sending custom messages to the patients based on the patient's health condition. 
The messages are sent in batches every month.

## The Data 
You can find [here](./seeds) the 3 CSV files:
- members - updated weekly, members is how we call the patients in our system 
- members_care_status - updated weekly - append only
- communications_log


## Part 1
Using the information in those files, we need to create features that will be used by our decision model inorder to decide which message we will send to each member.
Here are the list of the features that we need to create:
- `gender`
- `age`
- `has_diabetes`
- `adherent_to_diabetes_medications`
- `has_high_colorectal`
- `adherent_to_high_colorectal_medications`
- `has_high_blood_pressure`
- `adherent_to_high_blood_pressure_medications`
- `number_of_medical_conditions`

We might need to create more features in the future, but this is the initial list.

The features should be easy to use by the data science team. Usually they will need all of them at the same time. In addition, they should be able to know when the features were calculated.

## Part 2
We want to make a report that will show how effective is our service. By effective we mean how many members are taking the action that we want them to take.
Which means that their measures improved after they received the message.
The report should have the following columns:
- `batch_id`
- `message`
- `related_measure`
- `number_of_tageted_members`
- `number_of_members_that_improved`
- `number_of_members_with_no_change`
- `number_of_members_that_got_worse`

#### Part 3
Every month we send a batch of custom message to each member based on the features that we created in the previous part (each member gets one message in a batch).
We want to create an **incremental** model that sill show how many messages we send for each type of message.
The report should have the following columns:
- `date`
- `batch_id`
- `message_type`
- `number_of_messages`

### Instructions
- You should implement the above requirements using DBT.
- If you are not sure about the logic then you can ask for clarification or make an assumption and document it.
- Try to reduce the code duplication if it is possible.

### Recommended steps
- Start with data exploration, and ask for clarification if needed.
- In BigQuery, Create a new schema and manually load the CSVs. You can use [load file upload option](https://cloud.google.com/bigquery/docs/batch-loading-data#loading_data_from_local_files) in the BigQuery UI.
- Create new DBT project.
- Implement the requirements part by part, do move to the second part before you complete the first one.
- We believe that complete all the parts should take about 3 hours. We respect your time, if you go over the 3 hours then you can stop and submit what you have done. 


### Important!
Do not open a PR to this repository. Please fork it and push you work to your own repository.


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)