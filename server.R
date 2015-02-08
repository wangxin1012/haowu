library(shiny)
library(RODBC)

# setwd('D:haowu_data/report/tuijian')

chn <- odbcConnect(dsn='local_hw_32bit',uid='hw',pwd='hw123456')

# t_recommend_20141226 <- sqlFetch(chn,sqtable='t_recommend_20141226')
test_datatype  <- sqlFetch(chn,sqtable='test_datatype')


shinyServer(function(input, output) {
  
  datasetInput <- reactive({
    switch(input$dataset,
           "推荐人数" = test_datatype,
           "到访人数" = test_datatype,
           "下定人数" = test_datatype)
  })
  
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
}
)

