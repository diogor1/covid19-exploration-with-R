#we install the Hmisc package to clean the console
library(Hmisc)
install.packages("Hmisc")
#we import the data
cov<-read.csv("covdata.csv")
str(cov)
#we describe the data 
describe(cov)
cov$death_dummy <- as.integer(cov$death != 0)
#we clean the death column
unique(cov$death_dummy)
#Age
#claim: people who die are older
dead =subset(cov, death_dummy == 1)
alive =subset(cov, death_dummy == 0)
mean(dead$age, na.rm = TRUE)
mean(alive$age,na.rm = TRUE)
#WE TEST FOR THE SIGNIFICANCE
t.test(alive$age, dead$age, alternative = "two.sided",conf.level = 0.95)
#if the p-value is < 0.05, 
#we reject the null hypothesis and accept the alternative hypothesis.
#in this test, we reject the null because p = 0 
#this means that the claim (hypothesis) is  valid one. older people died more of covid.

#Gender
#claim: gender has no effect.
men =subset(cov, gender == "male")
women =subset(cov, gender == "female")
mean(men$death_dummy, na.rm = TRUE) #8.5%
mean(women$death_dummy,na.rm = TRUE) #3.7%
#WE TEST FOR THE SIGNIFICANCE
t.test(men$death_dummy, women$death_dummy, alternative = "two.sided",conf.level = 0.95)
# we are 95% confidenct that men have 8.0% to 8.5% chances of dying more than the women
# the p-value is 0.002 < 0.05%, this shows a statistical significance.
#