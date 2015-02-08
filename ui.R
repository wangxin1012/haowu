library(shiny)
library(ggplot2)
library(RODBC)

shinyUI(pageWithSidebar(
  
  headerPanel("推荐数据展示"),
 
    sidebarPanel(
      selectInput("dataset", "选择数据集:", 
                  choices = c('推荐人数', "到访人数", "下定人数","成交人数")),
      
      numericInput("obs", "Number of observations to view:", 10)
    ),
    

  
  mainPanel(
    verbatimTextOutput("summary"),
    tableOutput("view")
  )
))


# 调用程序 
# runApp("D:haowu_data/report/tuijian")
# shiny::runApp('D:haowu_data/report/tuijian')
