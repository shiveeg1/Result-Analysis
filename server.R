library(shiny)

filenames <- c("Entc","Comp","IT")

shinyServer(function(input,output,session)
{
        
    output$edata <- renderPlot({
    
        # entc Stuff
        efileData <- reactiveFileReader(1000,session,input$dept,readLines)
        etext <- efileData()
        eStu <- length(etext)
        entcTot <- grep("[0-9]",etext,perl=TRUE, value= TRUE)
        entcTot <- sort(as.character(entcTot))
        ebk <- length(grep("--",etext))
        #store the percentile array for each
        en = c()
        for(i in 1:length(entcTot)){
            en[i] = sum(entcTot <= entcTot[i]) + ebk
        }
        #plot.window(xlim=c(1850,2020), ylim = c(0,5000000))
        plot(range(entcTot),range(en),type="n",xlab="Total Score", ylab="No. of students less than (x) score",main="Percentile Graph")
        lines(entcTot,en,type="l",col="blue")
        
        eindex <- sum(entcTot <= input$escore)
        
        lines( c(input$escore,input$escore), c(0,en[eindex]) ,col="red",lwd=2)
        
        lines(c(0,input$escore), c(en[eindex],en[eindex]), col="red",lwd=2)
        
        output$eperc <- renderPrint({ (en[eindex])/eStu*100})
        output$ebehind <- renderPrint({ en[eindex]-1 })
        output$eahead <- renderPrint({ eStu-en[eindex] }) 
        output$ebklog <- renderPrint({ ebk })
    })
    
        
}
)
