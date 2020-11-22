#SERVER
#ShinyApp elaborado por: Victor Hinojosa, Aldair Alexander






server <- function(input, output) { 

  #-----------------------------------------------------------------------page 1
  
  # PRIMERA PESTAÑA
  
  
  #PRESENTACION DE LA LINEA DE TIEMPO
  
  r<-(1:20)
  temp<-data.frame(r,unificado)
  output$tempo<-renderPlot({
    if(input$iden1==0 ){
      plot(c(1,20),c(90000,110000), type = "n", xlab = "Meses",
           ylab="PIB", main = "Serie de tiempo" )
      
      lines(temp$r, temp$PIB, lwd = 0.7, lty = 1, col = "blue", pch = 1 )
      
    }else{
      if(input$iden1==1){
        plot(c(1,20),c(37000,42000), type = "n", xlab = "Meses",
             ylab="TOTAL SALDO DEUDA EXTERNA", main = "Serie de tiempo" )
        
        lines(temp$r, temp$TOTAL.SALDO.DEUDA.EXTERNA, lwd = 2, lty = 2, col = "darkorange1", pch = 1 )
        
      }else{
        if(input$iden1==2){
          plot(c(1,20),c(15000,20000), type = "n", xlab = "Meses",
               ylab="TOTAL SALDO DEUDA INTERNA", main = "Serie de tiempo" )
          
          lines(temp$r, temp$TOTAL.SALDO.DEUDA.INTERNA, lwd = 0.7, lty = 1, col = "green4", pch = 1 )
          
        }else{
          if(input$iden1==3){
            plot(c(1,20),c(54000,60000), type = "n", xlab = "Meses",
                 ylab="TOTAL.SALDO.DEUDA.PÚBLICA", main = "Serie de tiempo" )
            
            lines(temp$r, temp$TOTAL.SALDO.DEUDA.PÚBLICA, lwd = 0.7, lty = 1, col = "red", pch = 1 )
            
          }else{
            if(input$iden1==4){
              plot(c(1,20),c(0.40, 0.70), type = "n", xlab = "Meses",
                   ylab="RELACION DEUDA PIB", main = "Serie de tiempo" )
              
              lines(temp$r, temp$RELACIÓN.DEUDA.PIB, lwd = 0.7, lty = 1, col = "black", pch = 3 )
            }else{
              if(input$iden1==5){
                
                plot(c(1,20),c(54000,60000), type = "n", xlab = "Meses",
                     ylab="UNIFICADO", main = "Serie de tiempo" )
                
                lines(temp$r, temp$PIB, lwd = 0.7, lty = 1, col = "blue", pch = 1 )
                lines(temp$r, temp$TOTAL.SALDO.DEUDA.EXTERNA, lwd = 2, lty = 2, col = "darkorange1", pch = 1 )
                lines(temp$r, temp$TOTAL.SALDO.DEUDA.INTERNA, lwd = 0.7, lty = 1, col = "green4", pch = 1 )
                lines(temp$r, temp$TOTAL.SALDO.DEUDA.PÚBLICA, lwd = 0.7, lty = 1, col = "red", pch = 1 )
                
                
                legend( 54000, 60000, 1:4, cex=0.8, col = c( "blue","darkorange1", "green4", "red"),
                        pch =1:4, lty=1:4, title="DEUDA", horiz = TRUE)
              }
            }
          }
        }
        
      }
      
    }
  })
  
  # PRESENTACION DE LA BASE DE DATOS
  
  output$hoja1<-renderTable({
    if(input$iden1==0 ){
      tab1
    }else{
      if(input$iden1==1){
        tab2
      }else{
        if(input$iden1==2){
          tab3
        }else{
          if(input$iden1==3){
            tab4
          }else{
            if(input$iden1==4){
              tab5
            }else{
              if(input$iden1==5){
                tab6
              }
            }
          }
        }
        
      }
      
    }
  })

  # COMENTARIOS 
  
  output$tex1 <- renderPrint({
  
  if(input$iden1==0 ){
    "Como podemos observar por motivos de la pandemia el PIB mundial ha disminuido"
  }else{
    if(input$iden1==1){
      "Existe un incremento en la deuda externa a niveles mundiales"
    }else{
      if(input$iden1==2){
        "La deuda interna de los paises ha ido en aumento"
      }else{
        if(input$iden1==3){
          "La deuda publica tiene una tendencia creciente en los últimos meses"
        }else{
          if(input$iden1==4){
           "La relación Deuda PIB nos indica que sera un año de recesión economica mundial"

          }else{
            if(input$iden1==5){
              "El mundo vive periodos de endeudamiento creciente"

            }
          }
        }
      }
      
    }
    
  }
  
  
})




#--------------------------------------------------------------------------page 2  
  
  #Segunda pestaña

# BASE DE DATOS PARA COORDENADAS DE MAPA
points <- eventReactive(input$recalc, {
  if(input$des=="ALEMANIA" ){
    cbind(10.451526, 51.165691)
  }else{
    if(input$des=="ARGENTINA" ){
      cbind(-63.616672, -38.416097)
    }else{
      if(input$des=="AUSTRIA" ){
      cbind(14.550072, 47.516231)
    }else{
      if(input$des=="BELGICA" ){
        cbind(4.469936, 50.503887)
      }else{
        if(input$des=="BRASIL" ){
          cbind(-51.92528, -14.235004)
        }else{
          if(input$des=="CANADA" ){
            cbind(-106.346771, 56.130366)
          }else{
            if(input$des=="DINAMARCA" ){
              cbind(9.501785, 56.26392)
            }else{
              if(input$des=="ESPAÑA" ){
                cbind(-3.74922, 40.463667)
              }else{
                if(input$des=="ESTADOS UNIDOS - USA" ){
                  cbind(-95.712891, 37.09024)
                }else{
                  if(input$des=="FRANCIA" ){
                    cbind(2.213749, 46.227638)
                  }else{
                    if(input$des=="ISRAEL" ){
                      cbind(34.851612, 31.046051)
                    }else{
                      if(input$des=="ITALIA" ){
                        cbind(12.56738, 41.87194)
                      }else{
                        if(input$des=="JAPON" ){
                          cbind(138.252924, 36.204824)
                        }else{
                          if(input$des=="LUXEMBURGO" ){
                            cbind( 6.129583, 49.815273)
                          }else{
                            if(input$des=="PAÍSES BAJOS" ){
                              cbind(5.291266, 52.132633)
                            }else{
                              if(input$des=="R. DE KOREA" ){
                                cbind(127.766922, 35.907757)
                              }else{
                                if(input$des=="R.P. DE CHINA" ){
                                  cbind(104.195397, 35.86166)
                                }else{
                                  if(input$des=="REINO UNIDO" ){
                                    cbind(54.0000000, -2.0000000)
                                  }else{
                                    if(input$des=="RUSIA" ){
                                      cbind(105.318756, 61.52401)
                                    }else{
                                      
                                      
                                    }
                                    
                                  }
                                  
                                }
                                
                              }
                              
                            }
                            
                          }
                          
                        }
                        
                      }
                      
                    }
                    
                  }
                  
                }
                
              }
              
            }
            
          }
          
        }
        
      }
    
  }
    }
  }
}, ignoreNULL = FALSE)


# PRESENTACIÓN DEL MAPA

output$mymap <- renderLeaflet({
  leaflet() %>%
    setView(lat = 30, lng = 11, zoom = 2) %>%
    addProviderTiles("Stamen.TonerLite",
                     options = providerTileOptions(noWrap = TRUE)
    ) %>%
    addMarkers(data = points())
})



# PRESENTACION DE LA BASE DE DATOS POR PAISES

output$hoja2<-renderTable({
  
  if(input$des=="ALEMANIA" ){
    subset(pais, pais$PAÍS=="ALEMANIA", select =)
  }else{
    if(input$des=="ARGENTINA" ){
      subset(pais, pais$PAÍS=="ARGENTINA", select =)
    }else{
      if(input$des=="AUSTRIA" ){
        subset(pais, pais$PAÍS=="AUSTRIA", select =)
      }else{
        if(input$des=="BELGICA" ){
          subset(pais, pais$PAÍS=="BELGICA", select =)
        }else{
          if(input$des=="BRASIL" ){
            subset(pais, pais$PAÍS=="BRASIL", select =)
          }else{
            if(input$des=="CANADA" ){
              subset(pais, pais$PAÍS=="CANADA", select =)
            }else{
              if(input$des=="DINAMARCA" ){
                subset(pais, pais$PAÍS=="DINAMARCA", select =)
              }else{
                if(input$des=="ESPAÑA" ){
                  subset(pais, pais$PAÍS=="ESPAÑA", select =)
                }else{
                  if(input$des=="ESTADOS UNIDOS - USA" ){
                    subset(pais, pais$PAÍS=="ESTADOS UNIDOS - USA", select =)
                  }else{
                    if(input$des=="FRANCIA" ){
                      subset(pais, pais$PAÍS=="FRANCIA", select =)
                    }else{
                      if(input$des=="ISRAEL" ){
                        subset(pais, pais$PAÍS=="ISRAEL", select =)
                      }else{
                        if(input$des=="ITALIA" ){
                          subset(pais, pais$PAÍS=="ITALIA", select =)
                        }else{
                          if(input$des=="JAPON" ){
                            subset(pais, pais$PAÍS=="JAPON", select =)
                          }else{
                            if(input$des=="LUXEMBURGO" ){
                              subset(pais, pais$PAÍS=="LUXEMBURGO", select =)
                            }else{
                              if(input$des=="PAÍSES BAJOS" ){
                                subset(pais, pais$PAÍS=="PAÍSES BAJOS", select =)
                              }else{
                                if(input$des=="R. DE KOREA" ){
                                  subset(pais, pais$PAÍS=="R. DE KOREA", select =)
                                }else{
                                  if(input$des=="R.P. DE CHINA" ){
                                    subset(pais, pais$PAÍS=="R.P. DE CHINA", select =)
                                  }else{
                                    if(input$des=="REINO UNIDO" ){
                                      subset(pais, pais$PAÍS=="REINO UNIDO", select =)
                                    }else{
                                      if(input$des=="RUSIA" ){
                                        subset(pais, pais$PAÍS=="RUSIA", select =)
                                      }else{
                                        
                                        
                                      }
                                      
                                    }
                                    
                                  }
                                  
                                }
                                
                              }
                              
                            }
                            
                          }
                          
                        }
                        
                      }
                      
                    }
                    
                  }
                  
                }
                
              }
              
            }
            
          }
          
        }
        
      }
    }
  }
  
})


#-------------------------------------------------------------------------page 3


# PRESENTACION DEL MAPA DE DISPERSIÓN EN ACREEDORES DE DEUDA 
  output$graf1<-renderPlotly({
    if(input$bar=="BANCO CENTRAL DEL ECUADOR"){
    BCE<- subset(acreedor, acreedor$ACREEDOR== "BANCO CENTRAL DEL ECUADOR", select=)
    plot_ly(BCE,x=~BCE$Año,y=~BCE$`SALDO ADEUDADO`,name='Saldo Adeudado',type='scatter',mode='markers',
            marker=list(size = 15,color = 'rgba(255, 182, 193, .9)',line = list(color = 'rgba(152, 0, 0, .8)',
                                                                                width = 2))) %>%
      layout(title='Banco Central del Ecuador',
             xaxis=list(title='Deuda',showline=T),
             yaxis=list(title='Deuda',showline=T))
    }else{
      
      if(input$bar=="BID"){
        BID<- subset(acreedor, acreedor$ACREEDOR== "BID", select=)
        plot_ly(BID,x=~BID$Año,y=~BID$`SALDO ADEUDADO`,name='Saldo Adeudado',type='scatter',mode='markers',
                marker=list(size = 15,color = 'rgba(255, 182, 193, .9)',line = list(color = 'rgba(152, 0, 0, .8)',
                                                                                    width = 2))) %>%
          layout(title='BID',
                 xaxis=list(title='Año',showline=T),
                 yaxis=list(title='Deuda',showline=T))
      
      }else{
        if(input$bar=="FMI"){
          FMI<- subset(acreedor, acreedor$ACREEDOR== "FMI", select=)
          plot_ly(FMI,x=~FMI$Año,y=~FMI$`SALDO ADEUDADO`,name='Saldo Adeudado',type='scatter',mode='markers',
                  marker=list(size = 15,color = 'rgba(255, 182, 193, .9)',line = list(color = 'rgba(152, 0, 0, .8)',
                                                                                      width = 2))) %>%
            layout(title='FMI',
                   xaxis=list(title='Año',showline=T),
                   yaxis=list(title='Deuda',showline=T))
          
        }else{
          if(input$bar=="IESS"){
            IESS<- subset(acreedor, acreedor$ACREEDOR== "IESS", select=)
            plot_ly(IESS,x=~IESS$Año,y=~IESS$`SALDO ADEUDADO`,name='Saldo Adeudado',type='scatter',mode='markers',
                    marker=list(size = 15,color = 'rgba(255, 182, 193, .9)',line = list(color = 'rgba(152, 0, 0, .8)',
                                                                                        width = 2))) %>%
              layout(title='IESS',
                     xaxis=list(title='Año',showline=T),
                     yaxis=list(title='Deuda',showline=T))
            
          }else{
            if(input$bar=="BM (BIRF, AIF)"){
              BM<- subset(acreedor, acreedor$ACREEDOR== "BM (BIRF, AIF)", select=)
              plot_ly(BM,x=~BM$Año,y=~BM$`SALDO ADEUDADO`,name='Saldo Adeudado',type='scatter',mode='markers',
                      marker=list(size = 15,color = 'rgba(255, 182, 193, .9)',line = list(color = 'rgba(152, 0, 0, .8)',
                                                                                          width = 2))) %>%
                layout(title='Banco Mundial',
                       xaxis=list(title='Año',showline=T),
                       yaxis=list(title='Deuda',showline=T))
              
            }
            
          }
          
        }
    }
    }
  })
  
  

  
  }