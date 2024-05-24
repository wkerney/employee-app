install.packages("tidyverse")
library(tidyverse)

# Step 2: Data Exploration and Understanding
employee_attrition <- read.csv("WA_Fn-UseC_-HR-Employee-Attrition.csv")
str(employee_attrition)
summary(employee_attrition)

# Check for missing values
colSums(is.na(employee_attrition))

# Step 3: SQL Data Extraction
# Install and load necessary packages
install.packages("RSQLite")
library(RSQLite)

# Connecting to SQLite database
con <- dbConnect(RSQLite::SQLite(), "employee_db.sqlite")

# Writing SQL query to create a table and insert data
dbWriteTable(con, "employee_attrition", employee_attrition, overwrite = TRUE)

# Step 4: Data Transformation and Analysis
# Performing data transformation tasks
# let's focus on age and job satisfaction
employee_attrition$Age_Group <- ifelse(employee_attrition$Age <= 30, "Young", "Old")
employee_attrition$JobSatisfaction_Level <- cut(employee_attrition$JobSatisfaction, breaks = 3, labels = c("Low", "Medium", "High"))

# Analyze the data
attrition_summary <- aggregate(Attrition ~ Age_Group + JobSatisfaction_Level, data = employee_attrition, FUN = function(x) sum(x == "Yes") / length(x))

# Step 5: Dashboard Design and Creation
# Install and load necessary packages
install.packages("shiny")
install.packages("plotly")
library(shiny)
library(plotly)

# Define UI for dashboard
ui <- fluidPage(
  titlePanel("Employee Attrition Analysis Dashboard"),
  sidebarLayout(
    sidebarPanel(
      selectInput("age_group", "Select Age Group:", choices = c("Young", "Old")),
      selectInput("job_satisfaction", "Select Job Satisfaction Level:", choices = c("Low", "Medium", "High"))
    ),
    mainPanel(
      plotlyOutput("attrition_plot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  output$attrition_plot <- renderPlotly({
    filtered_data <- subset(attrition_summary, Age_Group == input$age_group & JobSatisfaction_Level == input$job_satisfaction)
    plot_ly(data = filtered_data, x = ~JobSatisfaction_Level, y = ~Attrition, type = "bar", color = ~Age_Group, colors = c("blue", "red")) %>%
      layout(title = "Attrition Rate by Age Group and Job Satisfaction Level")
  })
}

# Run the application
shinyApp(ui = ui, server = server)





