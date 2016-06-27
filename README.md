# bleachingevolution

This repository contains code associated with computer simulations and figures presented in Bellis & Denver (submitted).  We simulated trajectories of bleaching response evolution based on a quantitative genetic model detailed by Via & Lande (1985) which describes evolution of a single character expressed in two environments.  Our extension of this model predicts evolution of bleaching response, measured as the proportion of algal symbionts remaining in host tissues after stress.  It seeks to include impacts of multiple stressors by incorporating a direct response to selection in Environment 1, where a proportion of the population experiences bleaching induced by one stress regime (e.g. acute heat stress), and an indirect response to selection experienced by individuals that settle in Environment 2, where bleaching is induced by some other stressor or combination of stressors (e.g. cold-stress, combined UV/heat).  Included are the scripts for the following tasks:

#####Evolutionary trajectory simulation:
```
evoTraj_noX11.R
```
Depicts a simulated evolutionary trajectory for bleaching response in two environments, a la Figure 3A.  Original versions of this code were provided by Steve Arnold during Z599: Evolutionary Quantitative Genetics, a course he taught at Oregon State University in Winter 2012.
#####Running an interactive web app for evolutionary trajectory simulations via Shiny for R:
Basically evoTraj_noX11.R, but more user-friendly.
```
ui.R
server.R
```
#####Plotting simulation results after 20 generations:
This set of scripts creates plots summarizing simulation results with varying different parameters of the model (e.g. Fig. 3B-C, Fig. 4).  Essentially they create run the simulation shown in Figure 3A many times, for populations with varying degrees of genetic variance in Environment 1 compared to Environment 2 (G11:G22).  Bleaching response in Environment 1 (i.e. x-axis from Fig. 3A) is then plotted as the response.
```
BleachingResponseIn20_g22.R
BleachingResponseIn20_theta2.R
BleachingResponseIn20_q.R
BleachingResponseIn20_theta2.R
BleachingResponseIn20_w.R
```

