#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyWidgets)

ui <- fillPage(
    fluidPage(
        titlePanel(h2("The Tree ID", align = "center")),
        #titlePanel(h4("Got 5 minutes?", align = "center")),
        titlePanel(
            h4(
                "Click the image to be taken to a random wikipedia tree page...",
                align = "center"
            )
        ),
        titlePanel(h5(em(
            span("Created by "),
            a("The Tree ID", href = "mailto:barkerstu@gmail.com"),
            span(", Jan 2020")
        ), align = "center")),
        uiOutput("example"),
        setBackgroundImage(src = "forest-trees-minimal-art.jpg"),
        uiOutput("example2")
        
        
    )
)
