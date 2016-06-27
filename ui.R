library(shiny)

# Define UI for miles per gallon application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Bleaching Response Evolution, via Via & Lande (1985)"),
  
  fluidRow(
    column(3, 
      h3("Model Inputs"),
      wellPanel(
      numericInput("gen", 
                 label = "Number of generations to run (min=10)", value = 20, min=10),
      numericInput("G11", 
                 label = "Additive genetic variance, Environment 1", value = 0.113, min=0),    
      numericInput("G22", 
                 label = "Additive genetic variance, Environment 2", value = 0.005, min=0),
      numericInput("P11", 
                 label = "Phenotypic variance, Environment 1", value = 0.135, min=0),
      numericInput("P22", 
                 label = "Phenotypic variance, Environment 2", value = 0.05, min=0),
      sliderInput("q1", 
                label = "Proportion of population in Environment 1", min=0, max=1, value = 0.75),
      sliderInput("zbar1.start", 
                 label = "Mean bleaching response of initial population, Environment 1", min=0, max=1, value = 0.7),
      sliderInput("zbar2.start", 
                 label = "Mean bleaching response of initial population, Environment 2", min=0, max=1, value = 0.6),
      sliderInput("theta1", 
                 label = "Optimal bleaching response, Environment 1", min=0, max=1, value = 0.95),
      sliderInput("theta2", 
                 label = "Optimal bleaching response, Environment 2", min=0, max=1, value = 0.95),
      numericInput("omega1", 
                 label = "Width of the fitness function, Environment 1 (smaller=stronger)", value = 1, min=0),
      numericInput("omega2", 
                 label = "Width of the fitness function, Environment 2 (smaller=stronger)", value = 1, min=0)
    )),
    column(6,
      plotOutput("evoPlot"), 
      
      p(""),
      p("This plot simulates evolution of coral bleaching response based on a quantitative genetic model that describes phenotypic evolution of a single character expressed in two environments (Via & Lande 1985).  It takes into account direct selection on bleaching responses in Environment 1, as well as a correlated response to selection in Environment 2, which is distinguished by some different stressor or combination of stressors.  The joint phenotypic optimum is indicated by the '+' and arrowheads are plotted every 10 generations.  Additional information regarding the model parameters can be found in Bellis & Denver (submitted).  Please contact weissem[at]science[dot]oregonstate[dot]edu with suggestions, questions, or comments."),
      p("Bellis, E.S. & D.R. Denver (submitted). Effects of genetic architecture on rapid evolution of cnidarian bleaching resistance under different stress regimes."),
      p("Via, S. & R. Lande (1985). Genotype-environment interaction and the evolution of phenotypic plasticity. Evolution 39: 505-512.")
    ),
    column (3,
      h3("Model Outputs"),
      wellPanel(
        p("If genetic correlation = +0.99, evolved bleaching response is estimated as"),
        verbatimTextOutput("text"),      
        p("If genetic correlation = -0.99, evolved bleaching response is estimated as"),
        verbatimTextOutput("text2"),
        p("This corresponds to"),
        verbatimTextOutput("text3"),
        p("assuming a generation time (in years) of"),
        numericInput("yearspergen", 
              label = p(""), value = 30, min=0)
      )
    )  
  )
))