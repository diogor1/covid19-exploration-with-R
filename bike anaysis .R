getwd()
#we import the data (bike)
bike<-read.csv("biker.csv",header = TRUE)
bike
head(bike)
good<-bike[,c("Gender","Education","Age","Occupation")]
good
#1. we find the numbers of married men and women.
#we first convert the gender column to a data frame.
nom_of_marr_men<-data.frame(good$Gender)
nom_of_marr_men
install.packages("stringr")
library("stringr")
#then we count both the male and female genders.
str_count(nom_of_marr_men, "Male")
str_count(nom_of_marr_men, "Female")

#also, we make a data frame of the single men and women.
mstatus<-data.frame(bike$Marriedarital.Singletatus)
head(mstatus,7)
str_count(mstatus,"Single") 
str_count(mstatus,"Married") 
View(bike)

#to count the number of single males and females
genderstat<-paste(bike$Marriedarital.Singletatus, bike$Gender, sep = "")
# we combined both marital status and gender into a single string
head(genderstat, 7)
#to have a successful count, we will convert the string to a dataframe:
gen<-data.frame(genderstat)
#we count for both single men and single women
str_count(gen,"SingleFemale")
str_count(gen,"SingleMale")
#SINGLE MALE = 221, SINGLE FEMALS = 256

histo<-bike[,c("Gender","Income")]
histog<-data.frame(histo)
histog
Graph<-barplot(histog,names.arg="Gender",xlab="Gender",ylab="Income",col="blue",
               main="Gender Income chart",border="red")
Graph<-barplot(histog)
sum(bike$Income)
max(histog$Income)
min(bike$Income)
#total income of females vs males.
#we check the gender that earns more, using a graphical illustration.

install.packages("tidyverse")
library("tidyverse")

#we installed the tidyverse package and use both the histogram and bar chart
ggplot(bike, aes(x = Marriedarital.Singletatus, y = Gender, fill = Gender)) +
  geom_bar(stat = "identity",
           width = 0.5) +
  coord_flip() +
  theme_classic()
graph

#we plot to see the relationship between the gender and the income
ggplot(bike, aes(x = Income, y = Gender, fill = Gender)) +
  geom_bar(stat = "identity",
           width = 0.5) +
  coord_flip() +
  theme_classic()
# we compare the occupation and income
ggplot(bike, aes(x = Income, y = Occupation, fill = Occupation)) +
  geom_bar(stat = "identity",
           width = 0.5) +
  coord_flip() +
  theme_classic()

# from the graph, we can categorically state that the skilled manual makes more money, 
# followed by the professionals and then the Manual.

#we plot again to see the male and female home owners.

ggplot(bike, aes(x = Home.Owner, y = Gender, fill = Gender)) +
  geom_bar(stat = "identity",
           width = 0.5) +
  coord_flip() +
  theme_classic()
# from the graph, the male gender are the dominant home owners. 

ggplot(bike, aes(x = Home.Owner, fill =Gender )) +
  geom_bar(position = position_dodge()) +
  theme_classic()
#using the barplot, the male still maintained the lead in owning the homes.