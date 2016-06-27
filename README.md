# bleachingevolution

This repository contains code associated with computer simulations and figures presented in Bellis & Denver (submitted).  We simulated trajectories of bleaching response evolution based on a quantitative genetic model detailed by [Via & Lande (1985)](http://www.jstor.org/stable/2408649) which describes evolution of a single character expressed in two environments.  Our extension of this model projects evolution of bleaching response, measured as the proportion of algal symbionts remaining in host tissues after stress.  Impacts of multiple stressors are included by incorporating a direct response to selection in Environment 1, where a proportion of the population experiences bleaching induced by one stress regime (e.g. acute heat stress), and an indirect response to selection experienced by individuals in Environment 2, where bleaching is induced by some other stressor or combination of stressors.  Included are the scripts for the following tasks:

#####Evolutionary trajectory simulation:
Original code for `evoTraj_noX11.R` by Steve J. Arnold.  This modified version does not use X11.  It depicts a simulated evolutionary trajectory for bleaching response in two environments, a la Figure 3A from Bellis & Denver (submitted).

#####Running an interactive web app for evolutionary trajectory simulations:
`ui.R` and `server.R` contain code needed to create a user-friendly web app to use `evoTraj_noX11.R` via [Shiny for R](http://shiny.rstudio.com).  Web app currently hosted at [https://embellis.shinyapps.io/BleachingEvoViaViaLande/](https://embellis.shinyapps.io/BleachingEvoViaViaLande/).

#####Plotting simulation results after 20 generations:
This set of scripts creates plots summarizing simulation results with varying different parameters of the model (e.g. Fig. 3B-C, Fig. 4).  Essentially they run the simulation from Figure 3A many times, for populations with varying degrees of genetic variance in Environment 1 compared to Environment 2 (i.e. G11:G22).  Bleaching response in Environment 1 (i.e. x-axis from Fig. 3A) is then plotted as the response.  Set includes `BleachingResponseIn20_g22.R`,`BleachingResponseIn20_theta2.R`,`BleachingResponseIn20_q.R`,`BleachingResponseIn20_theta2.R`, and `BleachingResponseIn20_w.R`

