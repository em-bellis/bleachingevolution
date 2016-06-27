# bleachingevolution

This repository contains code associated with computer simulations and figures presented in Bellis & Denver (submitted).  We simulated trajectories of bleaching response evolution based on a quantitative genetic model detailed by Via & Lande (1985) which describes evolution of a single character expressed in two environments.  Our extension of this model predicts evolution of bleaching response, measured as the proportion of algal symbionts remaining in host tissues after stress.  It seeks to include impacts of multiple stressors by incorporating a direct response to selection in Environment 1, where a proportion of the population experiences bleaching induced by one stress regime (e.g. acute heat stress), and an indirect response to selection experienced by individuals that settle in Environment 2, where bleaching is induced by some other stressor or combination of stressors (e.g. cold-stress, combined UV/heat, etc.).  Included are the following scripts:

evoTraj_noX11.R         Depicts a simulated evolutionary trajectory for bleaching response in two environments, a la Figure 3A.  Original versions of this code were provided by Steve Arnold during Z599: Evolutionary Quantitative Genetics, a course he taught at Oregon State University in Winter 2012.
server.R                Script 1 of 2 needed to create an interactive web app for evoTraj_noX11.R with Shiny, a web-application framework for R
ui.R                    Script 2 of 2 for Shiny app

These include:
  BleachingResponseIn20_g22.R     . Output used to create Fig. 3C
