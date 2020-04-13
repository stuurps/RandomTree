library(shiny)
library(leaflet)
library(leaflet.extras)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    md <- read.csv("treelinks.csv")
    md <- md[sample(nrow(md), 1),]
    output$example <- renderUI({
        tags$a(
            imageOutput("bamboo-forest-nature-green.jpg"),
            href = paste0("https://en.wikipedia.org", md[1])
        )
    })
    output$example2 <- renderUI({
        tags$a(
            imageOutput("bamboo-forest-nature-green.jpg"),
            href = paste0("https://en.wikipedia.org", md[1])
        )
    })
    
})

#deployApp(launch.browser = F)