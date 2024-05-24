# Employee Attrition Analysis and Dashboard Creation
## Introduction
For this project I used the "IBM HR Analytics Employee Attrition & Performance" dataset that is pulicy avalible to exploration, data extraction, transformation and visualization through use of a basic shiny dashboard using R.
### Step 1: Dataset Acquisition
First I download the dataset and load the dataset into R and explore its structure, checking for missing values and examining the distribution of variables.
### Step 2: SQL Data Extraction
I then use R to connect to a SQLite database. We then write a SQL query to extract relevant data from the dataset. 
Finally, I execute the query and load the extracted data into R.
### Step 3: Data Transformation and Analysis
The next step is to perform some data transformation tasks I do some simple encoding of variables. 
I then analyze the data to uncover patterns and insights related to employee attrition. Considering questions like:
* What factors contribute to employee attrition?
* Are there specific departments or job roles with higher attrition rates?
* Is there a correlation between job satisfaction and attrition?
### Step 4: Dashboard Design and Creation
From there I ultimatley chose to use age and investigat that as a factor when evaluating attrition. The next step was to utilize R packages Shiny and Plotly to design and build an interactive dashboard.
The final visualization was a bar chart showing attrition rates compared to various age groups.
