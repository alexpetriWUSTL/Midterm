
## Load libraries and set working directory
library(devtools)
library(roxygen2)
setwd("C:/Users/Alex Petri/Downloads/GithubASP/Midterm") 



rm(list=ls())
## This can be run many times as the code is updates
current.code <- as.package("easyRasch")
load_all(current.code)
document(current.code)
check(current.code)

#examples

student <- new("Rasch", name = "Jason", a = c(37,43,55,22,34), y = c(0,1,1,0,1))
theta <- c(48)

prob <- raschModel_Probability(raschObj = student, theta = theta)
prob

lik <- raschModel_Likelihood(raschObj = student, theta = theta)
lik

prior <- raschModel_Prior(theta = theta)
prior

EAP <- raschModel_EAP(raschObj = student, theta = theta)
EAP

print(raschObj = student, theta = theta)

