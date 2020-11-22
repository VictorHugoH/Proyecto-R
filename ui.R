


#UI
#ShinyApp elaborado por: Victor Hinojosa, Aldair Alexander 




shinyUI(
  dashboardPage(skin = "black",
  dashboardHeader(title = "Deuda Global"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Presentación", tabName = "I0", icon = icon("address-card"),
               menuSubItem("Portada", tabName = "I1"),
               menuSubItem("Introducción", tabName = "I2")),
      menuItem("Por Pais", tabName = "widgets", icon = icon("th")),
      menuItem("Organismos Financieros", tabName = "analisis_datos", icon=icon("cog"),
               menuSubItem("Org. Acreedores de Deuda",tabName = "sub2")),
      menuItem("Conclusiones",tabName = "sub4")
               
    )
  ),
  
#----------------------------------------------------------------------Pestaña 1.1  
  
  
  dashboardBody(
    tabItems(
      tabItem( tabName = "I1",  
    tabPanel("Introducción",
             tags$div(align="center",HTML("<font color=black size=12> Escuela Politécnica Nacional </font>")),
             tags$hr(),
             tags$br(),
             fluidRow(
              column(6, tags$div(align="center",tags$img(src="EPN.png" ,width = "300px", height 
                                                = "250px"))),
               
              column(6, tags$div(align="center",tags$img(src="CN.svg" ,width = "300px", height 
                                                        = "250px"))
             )),
             tags$hr(),
             tags$br(),
             
             
             
             fluidRow(
               tags$div(align="center",tags$p(h1("Curso R y sus aplicaciones"))),
               tags$hr(),
               tags$div(align="center",tags$p(h1("Proyecto: Análisis Deuda Pública Global"))),
               tags$hr(),
               tags$div(align="left",tags$p(h1("Integrantes:"))),
               tags$hr(),
               tags$div(align="center",tags$p(h2("Victor Hinojosa"))),
               tags$hr(),
               tags$div(align="center",tags$p(h2("Aldair Alexander")))
             )),
      ),
    
    
    
    
#----------------------------------------------------------------------Pestaña 1.2 
    
tabItem(
  tabName = "I2",
  tabPanel("Base Deuda",
    fluidRow(
      
      column(12,
             
             
             tags$div(align="center",HTML("<font color=black size=12> Deuda Pública Mundial </font>")),
             
             wellPanel(style = "background-color:white;",
                       
                       tags$div(align="justify",tags$p(h4("La deuda pública o deuda soberana es la deuda total que mantiene un Estado con inversores particulares o con otro país."))),
                        tags$hr(),
                        tags$div(align="justify",tags$p(h4("La deuda pública total de un país es la deuda de todo el conjunto de las administraciones públicas. Por ejemplo, en España corresponde a la suma de la deuda del Estado central, de las 17 comunidades autónomas y de las administraciones locales."))),
                        tags$hr(),
                        tags$div(align="justify",tags$p(h4("Cuando un Estado incurre en déficit público porque ha gastado más de lo que ha ingresado, necesita encontrar una fuente de financiación ajena y para ello realiza emisiones de activos financieros. Lo más común es que un Estado financie ese déficit mediante emisiones de títulos de deuda (letras del tesoro, bonos u obligaciones)."))),
                        tags$hr(),
                        tags$div(align="justify",tags$p(h4("El tipo de interés de estas emisiones dependerá de la confianza que tengan los mercados en que el Estado va a devolver el dinero. Las agencias de rating ponen nota a la probabilidad de pago o calidad crediticia de estas emisiones. Existen diferencias entre los tipos de interés de cada país, esa diferencia es la llamada prima de riesgo.")))
             )
             
      )
      

    ),
    
    tags$hr(),
    tags$div(align="center",tags$b(h3(style="color:Black","Base de datos consolidada Global"))),
    tags$hr(),

      
      fluidRow(column(6, 
                      verbatimTextOutput("Deuda consolidada Mundial"))),

      
    
      fluidRow( 
        selectInput("iden1",label = "Estructura de la deuda",
                    choices = list("PIB"=0,"TOTAL SALDO DEUDA EXTERNA"=1, "TOTAL SALDO DEUDA INTERNA"=2, "TOTAL SALDO DEUDA PÚBLICA"=3,
                                   "RELACIÓN DEUDA/PIB"=4,"TODOS"=5)),
        tags$hr(),
        plotOutput("tempo"),
        tags$hr(),
        tableOutput("hoja1"),
        tags$hr(),
        verbatimTextOutput("tex1") 
        ),

    
  )
  ),
    
#--------------------------------------------------------------------------pestaña 2    
    
    tabItem(tabName = "widgets",
            tabPanel("Análisis de deuda por países",
                     fluidRow(column(6, verbatimTextOutput(tags$h1("Variables")))),
                     
                     
                     
                     
                     fluidPage(
                       selectInput("des",label = tags$h1("Base Deuda por Países"),
                                   choices = list( "ALEMANIA", "ARGENTINA",                                     
                                                   "AUSTRIA", "BELGICA",                                      
                                                    "BRASIL",                                        
                                                   "CANADA",                                       
                                                   "DINAMARCA",                                      "ESPAÑA",                                        
                                                   "ESTADOS UNIDOS - USA",                           "FRANCIA",                                       
                                                   "ISRAEL",                                         "ITALIA",                                        
                                                   "JAPON",                                         
                                                   "LUXEMBURGO",                    
                                                   "PAÍSES BAJOS",
                                                   "R. DE KOREA",                                    "R.P. DE CHINA",                                 
                                                   "REINO UNIDO",                                    "RUSIA")),
                       
                       
                       
                       
                       actionButton("recalc", "Show point"),
                       p(),
                       leafletOutput("mymap"),
                       p(),
                       h2("Construcción de su deuda"),
                       p(),
                       tableOutput("hoja2")
                       
                       
                       
                       
                       
                     ))
                     
      
    ),

#--------------------------------------------------------------------------pestaña 3


    tabItem(tabName = "sub2",
            tabPanel("Acreedores de deuda",
                     tags$div(align="center", HTML("<font color= Black size=7> Acreedores de Deuda </font>")),
                     HTML("<div alin=justify size=6> Principales Acreedores de Deuda para Ecuador y el Mundo</div>"),
                     tags$br(),
                     
                     fluidRow(
                      column(4,
                             tags$div(align="center",
                             box(background = "black",width = 12,      
                             radioButtons("bar", "Concentración de CO2", 
                      choices=list( "BANCO CENTRAL DEL ECUADOR", "BID",                                     
                                    "FMI", "IESS",                                      
                                    "BM (BIRF, AIF)"                                        
                      ), selected = "FMI",width="100%")
                      ))
                      ),
                      column(8,plotlyOutput("graf1")))
                     
            )
            
    ),


#----------------------------------------------------------------------------pestaña 4



    tabItem(tabName = "sub4",
            tabPanel("Conclusiones",

                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
            )
    )
    )
  )
)
)