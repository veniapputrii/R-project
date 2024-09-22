erasmus <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-03-08/erasmus.csv')
View(erasmus)
install.packages("tidyverse")

#checking a specific unique value
unique(erasmus$participant_profile)

#for finding unique rows 
#in multiple columns => unique(dataset_name)
unique(erasmus, n = 24)

#Change the value (gsub() to replace all instances of 
#the wrong encoding with the correct string) => $sending_city
erasmus$sending_city <- gsub("St.Pï¿½lten", "St. Pölten",
                             erasmus$sending_city)

#=>$sending_city
erasmus$receiving_city <- gsub("St.Pï¿½lten", "St. Pölten",
                               erasmus$receiving_city)
  
View(erasmus)
#filter multiple value
newF_erasmus <- erasmus[erasmus$participant_gender 
                        %in% c('Male','Female'),]

#the %in% operator is used in place of writing 
#multiple OR conditions.
unique(newF_erasmus$participant_gender)

#filter columns
filterC <- newF_erasmus[, c('project_reference','participant_gender','participant_age'
                            , 'receiving_city', 'receiving_organization','participants',
                            'sending_organization','sending_city','participant_nationality',
                            'activity_mob')]
#View that new data form
head(filterC)

#to view data types 
sapply(filterC, class) #the data types are cleaned.
View(filterC)
#to show the unique values
table(filterC$sending_city)

#change the value to be lowercase => tolower() & to be uppercase => toupper()
filterC$sending_city <- tolower(filterC$sending_city)
table(filterC$sending_city)

#show basic statistic of the data
#install.packages("pastecs")
#library(pastecs)
#stat.desc(filterC)

#Statistic_Visualization
#install packages that I probably need :
#color palettes
install.packages("RColorBrewer")
library(RColorBrewer)
#static plots
install.packages("ggplot2")
library(ggplot2)
#interactive plots
install.packages("gganimate")
library(gganimate)
install.packages("plotly")
library(plotly)
#interactive web Apps
install.packages("shiny")
library(shiny)
#simple visualization
#filter rows base on values in the sending_city column 
#     => berlin, budapest, london, dublin, prievidza
newErasmus <- filterC %>% filter(sending_city %in%
                                   c("berlin", "budapest",
                                     "london", "dublin", "prievidza"))

View(newErasmus)
#group data by value types
library("tidyverse")
groupErasmus <- newErasmus %>%
  group_by(sending_city) %>%
  summarise(rec_count = n()) %>%
  arrange(desc(rec_count))
View(groupErasmus)

#make a bar chart -> for comparing which the most country has sent the students to another organization
ggplot(groupErasmus, aes(x = sending_city, y = rec_count, fill = sending_city)) + # fill = Colors each bar based on the city.
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("salmon", "lightblue", "lightblue", "lightblue", "lightblue")) +
  labs(title = "City of sending organization", 
       x = "Sending City",
       y = "Total Country sent") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust =1)) #rotate x-axis label

#make the pie chart -> for knowing the distribution of nationality's student
# calculate the count of each natioanility
nCounts <- newErasmus %>%
  group_by(participant_nationality) %>%
  summarise(count = n()) %>%
  filter(count > 500)
View(nCounts)

# Create the pie chart
ggplot(nCounts, aes(x= "", y=count, fill= participant_nationality)) +
  geom_bar(stat="identity", width=1, color="white") +
  coord_polar("y", start=0)+
  labs(title = "Distribution of Participant Nationality") +
  theme_void() #remove grid and axes
  
#animate / interactive visualization
#calculate
genderC <- newErasmus %>%
  group_by(participant_gender) %>%
  summarise(count = n()) %>%
  ungroup()
View(genderC)

genderC$time <- c(1,2)
genderC
#create interactive bar chart
p <- ggplot(genderC, aes(x = participant_gender, y = count, fill= participant_gender)) +
  geom_bar(stat = "identity") +
  labs(title = "Gender Participant Comparison", x = "Gender", y="Total")+
  transform_position(time, transition_length = 2, state_length=1) +
  ease_aes('sine-in-out')

p


#Interactive Web Apps
library(dplyr)
library(plotly)
ui <- fluidPage(
  titlePanel("Interactive Erasmus Data Visualization"),
  
  #sidebar layout
  sidebarLayout(
    sidebarPanel(
      selectInput("gender", "select Gender :",
                  choices = unique(newErasmus$participant_gender)),
      selectInput("city", "Select Sending City :",
                  choices = unique(newErasmus$sending_city))
    ),
    
    #main panel for displaying outputs
    mainPanel(
      plotlyOutput("barChart"),
      plotlyOutput("pieChart")
    )
  )
)

#Define server logic
server <- function(input, output) {
  #bar chart for companing gender
  output$barChart <- renderPlotly({
    gender_data <- newErasmus %>%
      count(participant_gender)
    
    p <- ggplot(gender_data, aes(x = participant_gender, y = n,
                                 fill = participant_gender)) +
      geom_bar(stat = "identity") +
      ggtitle("Count of each gender")
    
    ggplotly(p)
  })
  
  #pie chart for sending city
  output$pieChart <-renderPlotly({
    city_data <-newErasmus %>%
      count(sending_city)
    
    p <- ggplot(city_data, aes(x= "", y=n, fill=sending_city))+
      geom_bar(width = 1, stat ="identity") +
      coord_polar("y") +
      ggtitle("Distribution of sending city")
    
    ggplotly(p)
  })
    
}

#run
shinyApp(ui = ui, server = server)

