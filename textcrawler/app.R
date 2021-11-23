#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(tm)
library(rvest)
library(wordcloud)
library(textreadr)
library(RColorBrewer)

## add document text here
document_entry = "Add document text here. The processor will parse the text."

# Define UI for application that draws a histogram
# Define UI for data upload app ----
ui <- fluidPage(
    
    # App title ----
    titlePanel("Wordsmith"),
    
    # Sidebar layout with input and output definitions ----
    sidebarLayout(
        
        # Sidebar panel for inputs ----
        sidebarPanel(
            
            
            # Input: Select a file ----
            fileInput("file1", "Upload your file",
                      multiple = TRUE),
            
            
            
            # Horizontal line ----
            tags$hr(),
            
            # Input: Checkbox if file has header ----
            checkboxInput("header", "Header", FALSE),
            
            
            
            # Horizontal line ----
            tags$hr(),
            
            # Input: Select number of rows to display ----
            radioButtons("disp", "Display",
                         choices = c(Head = "head",
                                     All = "all"),
                         selected = "head"),
            
            # Input: Select how to divide data ----
            radioButtons("scope", "Scope of Evaluation",
                         choices = c('By sentence' = "sentence",
                                     'By paragraph' = "paragraph"
                         ),
                         selected = "sentence"),
            
            # Input: Select word or phrase to filter ----
            textInput("text", "Word or Phrase"),
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot"),
           tableOutput("distTable")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    
    output$distPlot <- renderPlot({
        
        #Import document----
        
       imported_document <-  read_docx(input$file1$datapath) 
       
        if (is.null(imported_document) == TRUE){
        document <- document_entry
        } else{
            document <- as.character(imported_document)
        }
        
       if (input$scope == "paragraph"){
         
         document <- imported_document %>%
           strsplit(split = "\n+\\s+", fixed = TRUE) %>%
           unlist()  %>%
           as.data.frame()
         
       } else{
         document <- imported_document %>%
           strsplit(".|!|?", fixed = TRUE) %>%
           unlist()  %>%
           as.data.frame()
         
       }
       
        colnames(document) = "description" 
        
        document <- document %>%
            filter(grepl(input$text,description))
        
        #Create corpus----
        document <- Corpus((VectorSource(as.character(document$description))))
        
        #Define our stopwords ----
        our_stopwords <- union(stopwords(), stopwords('SMART')) 
        our_stopwords <- union(our_stopwords,
                               c("today"))
        #Filer out noise----
        docs <- document %>%
            tm_map(content_transformer(tolower)) %>%
            tm_map(removeNumbers) %>%
            tm_map(removePunctuation) %>%
            tm_map(stripHTMLIfPresent) %>%
            tm_map(removeWords, our_stopwords)
        
        #Create matrix of words by frequency----
        tdm <- TermDocumentMatrix(docs) %>%
            as.matrix()
        
        freq <- sort(rowSums(tdm),decreasing=TRUE)
        word_count <- data.frame(word = names(freq), freq = freq)
        
        
        
        #Generate word cloud----
        pal2 <- brewer.pal(8,"Dark2")
        wordcloud(words = word_count$word, freq = word_count$freq, rot.per=0, scale = c(6,.5), min.freq = 2, max.words = 25, colors = pal2, random.color = TRUE, random.order = FALSE, fixed.asp = FALSE)  
        
    })
    output$distTable <- renderTable({
        
        #Import document----
        
      imported_document <-  read_docx(input$file1$datapath) 
      
      if (is.null(imported_document) == TRUE){
        document <- "hello this is just a demonstration. Change the line text here or import a file."
      } else{
        document <- as.character(imported_document)
      }
      
      if (input$scope == "paragraph"){
        
        document <- imported_document %>%
          strsplit(split = "\n+\\s+", fixed = TRUE) %>%
          unlist()  %>%
          as.data.frame()
        
      } else{
        document <- imported_document %>%
          strsplit(".|!|?", fixed = TRUE) %>%
          unlist()  %>%
          as.data.frame()
        
      }
      
      colnames(document) = "description" 
      
      document <- document %>%
        filter(grepl(input$text,description))
      
      #Create corpus----
      document <- Corpus((VectorSource(as.character(document$description))))
      
      #Define our stopwords ----
      our_stopwords <- union(stopwords(), stopwords('SMART')) 
      our_stopwords <- union(our_stopwords,
                             c("today"))
      #Filer out noise----
      docs <- document %>%
        tm_map(content_transformer(tolower)) %>%
        tm_map(removeNumbers) %>%
        tm_map(removePunctuation) %>%
        tm_map(stripHTMLIfPresent) %>%
        tm_map(removeWords, our_stopwords)
      
      
      #Create matrix of words by frequency----
      tdm <- TermDocumentMatrix(docs) %>%
        as.matrix()
      
      freq <- sort(rowSums(tdm),decreasing=TRUE)
      word_count <- data.frame(word = names(freq), freq = freq)
      
      return(word_count)
      

        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
