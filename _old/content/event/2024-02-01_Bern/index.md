---
title: "Data simulation with {faux} and data simulation for mixed designs"
date: "2024-02-01T09:30:00Z"
date_end: "2024-02-02T16:30:00Z"
event: Data Simulation Workshop 2024
location: Bern, Switzerland

summary: Being able to simulate data allows you to prep analysis scripts for pre-registration, calculate power and sensitivity for analyses that don’t have empirical methods, create reproducible examples when your data are too big or confidential to share, enhance your understanding of statistical concepts, and create demo data for teaching and tutorials.

tags: [R, simulation, teaching]

abstract: Being able to simulate data allows you to prep analysis scripts for pre-registration, calculate power and sensitivity for analyses that don’t have empirical methods, create reproducible examples when your data are too big or confidential to share, enhance your understanding of statistical concepts, and create demo data for teaching and tutorials. This workshop will cover the basics of simulation using the R package {faux}. We will simulate data with factorial designs by specifying the within and between-subjects factor structure, each cell mean and standard deviation, and correlations between cells where appropriate. This can be used to create simulated data sets to be used in preparing the analysis code for pre-registrations or registered reports. We will also create data sets for simulation-based power analyses.



#address:
all_day: false
authors: [Lisa DeBruine]
event_url: https://kogpsy.github.io/datasimulationcourse_24/
featured: false
image:
  caption: ''
  focal_point: Center
#links:
#projects:
#- internal-project
publishDate: "2024-02-01T00:00:00Z"
#slides: example



url_code: "https://debruine.github.io/data-sim-workshops/"
#url_pdf: ""
#url_slides: "https://debruine.github.io/talks/EMPSEB-fake-it-2023/"
#url_video: ""
---

### Data Simulation with {faux}

This session will cover the basics of simulation using {faux}. We will simulate data with factorial designs by specifying the within and between-subjects factor structure, each cell mean and standard deviation, and correlations between cells where appropriate. This can be used to create simulated data sets to be used in preparing the analysis code for pre-registrations or registered reports. We will also create data sets for simulation-based power analyses. Students will need to have very basic knowledge of R and R Markdown, and have installed {faux}, {afex}, {broom} and {tidyverse}.

#### Prep

* Install R packages from CRAN: `tidyverse`, `afex`, `faux`, and `broom`
* Download files:  [faux-stub.Rmd](https://raw.githubusercontent.com/debruine/data-sim-workshops/master/inst/stubs/faux-stub.Rmd)


### Data simulation for mixed designs

This session will cover simulating data for a mixed design, where trials are crossed with subjects. We will learn how to analyse this using {lme4}, with a focus on understanding how the simulation parameters correspond to the output. Finally, we will learn how to use simulation to calculate power. Students will need to have basic knowledge of R and R Markdown, some familiarity with mixed designs (even if they don't currently analyse them with mixed models) and have installed {faux}, {afex}, {tidyverse}, and {lme4}.

#### Prep

* Install R packages from CRAN: `tidyverse`, `afex`, `lme4`, `broom`, `broom.mixed`, `faux`
* Download files: [mixed-stub.Rmd](https://raw.githubusercontent.com/debruine/data-sim-workshops/master/inst/stubs/mixed-stub.Rmd)