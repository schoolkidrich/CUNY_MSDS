# app link: https://schoolkidrich.shinyapps.io/mortality_rates/

library(shiny)
library(tidyverse)

data = read.csv('https://raw.githubusercontent.com/schoolkidrich/CUNY_MSDS/main/DATA_608/m3/cleaned-cdc-mortality-1999-2010-2.csv')

ui <- fluidPage(
    headerPanel('Mortality by States'),
    sidebarPanel(
        selectInput('ICD.Chapter', 'COD', unique(data$ICD.Chapter),selected = "Neoplasms" ),
        selectInput('Year', 'Year', unique(data$Year),selected = 2010 )
    ),
    mainPanel(
        plotOutput('plot1'),
        plotOutput('plot2')
    )
)

server <- function(input, output) {
    
    output$plot1 <- renderPlot({
        
        data %>%
            filter(ICD.Chapter == input$ICD.Chapter, Year == input$Year)%>%
            ggplot(mapping = aes(x = reorder(State,Crude.Rate), y = Crude.Rate))+geom_bar(stat = 'identity', color = 'black', fill = 'red4')+labs(x = 'State', title = 'Crude Mortality by States')+coord_flip()+theme(axis.text.y = element_text(size = 6))
    })
    
    output$plot2 <- renderPlot({
        data %>%
            filter(ICD.Chapter == input$ICD.Chapter , Year == input$Year)%>%
            mutate(death_by_pop = Deaths/Population)%>%
            mutate(z_death = (death_by_pop-mean(death_by_pop))/sd(death_by_pop))%>%
            ggplot(mapping = aes(x = State, y=z_death))+geom_bar(stat = 'identity', color = 'black', fill = 'red4')+labs(x = 'State', y = 'Standard Deviations from National Average', title = 'State vs National Mortality')+coord_flip()+theme(axis.text.y = element_text(size = 6))

    
    })
}

shinyApp(ui = ui, server = server)

