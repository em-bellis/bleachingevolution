# bleachingevolution

This repository contains code associated with computer simulations and figures to simulate bleaching response evolution.  We simulated trajectories of bleaching response evolution based on a quantitative genetic model detailed by [Via & Lande (1985)](http://www.jstor.org/stable/2408649) which describes evolution of a single character expressed in two environments.  Our extension of this model projects evolution of bleaching response, measured as the proportion of algal symbionts remaining in host tissues after stress.  Impacts of multiple stressors are considered by incorporating a direct response to selection in Environment 1, where a proportion of the population experiences bleaching induced by one stress regime (e.g. acute heat stress), and an indirect response to selection experienced by individuals in Environment 2, where bleaching is induced by some other stressor or combination of stressors.  Included are the scripts for:

#####Evolutionary trajectory simulation:
Original code to calculate evolutionary trajectories was written by Steve J. Arnold.  `evoTraj_noX11.R` is a modified version that does not use X11.  It depicts a simulated evolutionary trajectory for bleaching response in two environments.

#####Running an interactive web app for evolutionary trajectory simulations:
`ui.R` and `server.R` contain code needed to create a user-friendly web app to use `evoTraj_noX11.R` via [Shiny for R](http://shiny.rstudio.com).  Web app currently hosted at [https://embellis.shinyapps.io/BleachingEvoViaViaLande/](https://embellis.shinyapps.io/BleachingEvoViaViaLande/).  There is a 25 active hour monthly limit for my shinyapps.io account, so if the site is not working, it may be necessary to launch the app locally.  To do this, you will need [RStudio](https://www.rstudio.com), the 'shiny' package for R, and the `ui.R` and `server.R` files. Once everything is downloaded and installed, run the following commands from the RStudio terminal, replacing `~/path/to/shinyappfolder` with the path to the folder that contains `ui.R` and `server.R`:
```
> library(shiny)
> runApp("~/path/to/shinyappfolder")
```

#####Plotting simulation results after 20 generations:
This set of scripts creates plots summarizing simulation results with varying different parameters of the model.  Essentially they run the simulation from `evoTraj_noX11.R` many times, for populations characterized by different G-matrices.  Bleaching response in Environment 1 after 20 generations (i.e. x-axis from Fig. 3A) is plotted as the response variable and the magnitude of the different in genetic variance in environment 1 vs. 2 (i.e. G11:G22) is the x-axis.  Scripts in this set include `BleachingResponseIn20_g22.R`, `BleachingResponseIn20_theta2.R`, `BleachingResponseIn20_q.R`, `BleachingResponseIn20_theta2.R`, and `BleachingResponseIn20_w.R`

