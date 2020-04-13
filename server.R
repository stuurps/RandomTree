library(shiny)
library(leaflet)
library(leaflet.extras)
library(data.table)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    md <- fread("treelinks.csv")
    md <- md[sample(nrow(md), 1),]
    output$example <- renderUI({
        tags$a(
            imageOutput("bamboo-forest-nature-green.jpg"),
            href = paste0("https://en.wikipedia.org", md$url)
        )
    })
    output$example2 <- renderUI({
        tags$a(
            imageOutput("bamboo-forest-nature-green.jpg"),
            href = paste0("https://en.wikipedia.org", md$url)
        )
    })
    
})

#deployApp(launch.browser = F)