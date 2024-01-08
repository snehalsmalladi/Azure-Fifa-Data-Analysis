# Azure-Fifa-World-Cup-2022-Data-Analysis
An end-to-end Azure Data Services project focused on extracting analytics on World Cup Football Data from 2022

# Introduction   
The objective of this project is to design an end to end data engineering and analytics pipeline primarily using Azure data services such as Data Factory, Data Lake Gen 2, Azure Databricks for Pyspark and Synapse analytics to come up with analytical tables to drill down on some key metrics. Finally a dashbaord will be created using GCP Looker Studio for some visual insights. 

# Project Objectives 
* Data Acquisition - The dataset used for this project has been acquired from kaggle containing all the matches, updated daily, of the Qatar Fifa World Cup 2022.
Along with the scores and the football teams several statistics for each match were reported; for instance, assists, possession, crosses, number of red and yellow cards, passes, fouls, attempts, switches of play, offsides, and the number of times a certain are of the pitch has been crossed.
  * More information on the dataset here: https://www.kaggle.com/datasets/die9origephit/fifa-world-cup-2022-complete-dataset
 
* Data Ingestion - After downloading the dataset from kaggle the next step would be to load the data into Azure data factory. This should be done post setting up a new Azure account, and creating a new data factory that can store the dataset in the desired format. For now since this is an experimental project, there will be no triggers on the ingestion since its just a one time process.

* Data Storage - Azure Data Lake Gen2 is a great place for storing data on the cloud, and since out dataset is mainly a csv format it is quite easy to store this type of data. We will be creating two folders, one for raw unprocessed data and another for the transformed data.

* Transformation and ETL - Azure Databricks can host a Spark session by default in the workspace without needing to start a session each time you want to run some code on this dataset. We will be mounting the data lake onto databricks, and performing some basic transformations on this data to check for dupes, nulls, and overall clean create a clean data set for further analysis using SQL.

* Analytics - Azure Synapse Analytics is a powerful database than can read both T-SQL and SQL code to Extract and analyze this dataset using some complex queries for match and teams insights. You will find the SQL querires that I used for performing these in the repo, here are the key metrics I found using SQL:
  * Top Goal Scorers
  * Matches with most attempts on Goal
  * Teams with the highest pass completion rate
  * Teams with most attempts inside the penalty area etc.
 
# Data Framework: 

![Fifa DE Azure](https://github.com/snehalsmalladi/Azure-Fifa-Data-Analysis/assets/75508260/8bd92683-2168-485d-b009-87060923b8ba)

# Analytics Dashboard: 

![Screenshot 2024-01-08 at 11 49 36 AM](https://github.com/snehalsmalladi/Azure-Fifa-Data-Analysis/assets/75508260/6dcc9b20-6d99-48f8-a762-d231049d9669)





