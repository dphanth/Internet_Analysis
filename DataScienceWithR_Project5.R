
#Question1
##First, we will read the csv file for the data
internet <- read.csv("./InternetCaseStudy.csv", header = T)

##Checking the structure of the columns of the dataset
str(internet)

##Viewing the dataset
View(internet)

##Create a summary of the dataset
summary(internet)


#Question2
##Checking for correlation between Unique Page Views and Visits
cor(internet$Uniquepageviews,internet$Visits)

##Creating an ANOVA table to find the dependencies of Unique Page Views
anovatable_Uniquepqgeviews_Dependencies <- aov(Uniquepageviews~., data=internet)

##Viewing the ANOVA table that we created
summary(anovatable_Uniquepqgeviews_Dependencies)


#Question3
##Creating an ANOVA table to find the dependencies of Exits
anovatable_Exits_Dependencies <- aov(Exits~., data=internet)

##Viewing the ANOVA table that we created
summary(anovatable_Exits_Dependencies)


#Question4
##Creating an ANOVA table to find the dependencies of Time In Page
anovatable_Timeonpage_Dependencies <- aov(Timeinpage~., data=internet)

##Viewing the ANOVA table that we created
summary(anovatable_Timeonpage_Dependencies)


#Question5
##Multiplying the value of bounces with 0.01 and save it in a variable BouncesNew since Bounces are not between 0 and 1. 
##We will use a logistic regression with BouncesNew and the independent factors to find the significance of the other variables to Bounces.
internet$Bounces=internet$Bounces/0.01
rmm<-glm(BouncesNew~Timeinpage+Continent+Exits+Sourcegroup+Uniquepageviews+Visits,data = internet,family = "binomial")

summary(rmm)
