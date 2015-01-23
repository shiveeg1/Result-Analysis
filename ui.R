library(shiny)

shinyUI(pageWithSidebar(
    headerPanel('TE Sem 5 Result Analysis'),
    sidebarPanel(
        selectInput("dept","Dept names",c("Entc","IT","Comp"),selected="Entc"),
        
        numericInput("escore","Total Score",475,min=0,max=750,step=10),
        submitButton('Submit')
    ),
    mainPanel(
        h3('Dept Summary'),
        plotOutput("edata"),
        h4('Your percentile'),
        verbatimTextOutput("eperc"),
        h4('Students above your score'),
        verbatimTextOutput("eahead"),
        h4('Students below you score'),
        verbatimTextOutput("ebehind"),
        h4('Backlog Students'),
        verbatimTextOutput("ebklog"),
        br(),
        h6(' It is in doing things and not reading about them that results come about. ---Stephen Richards')
        
    )
))
