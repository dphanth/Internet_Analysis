# Analyze the internet data of www.datadb.com
## Summary of analysis:

### Question 1
The team wants to analyze each variable of the data collected through data summarization to get a basic understanding of the dataset and to prepare for further analysis.

### Write-Up:
From summarizing the dataset, we are given the minimum, 1st Quartile, Median, Mean, 3rd Quartile, and Maximum of every numerical column. We also have the unique counts of the string columns. We can use this to prepare for further analysis.
```r
internet <- read.csv("./InternetCaseStudy.csv", header = T)
str(internet)
View(internet)
summary(internet)
```

### Question 2:
As mentioned earlier, a unique page view represents the number of sessions during which that page was viewed one or more times. A visit counts all instances, no matter how many times the same visitor may have been to your site. So the team needs to know whether the unique page view value depends on visits.

### Write-Up:
From the anova table results, we can infer that the unique page views have a significant impact on the source group, bounces, continent, visits, and time on page variables. In conclusion, the unique page view value depends on visits.
```r
cor(internet$Uniquepageviews,internet$Visits)
anovatable_Uniquepqgeviews_Dependencies <- aov(Uniquepageviews~Visits, data=internet)
summary(anovatable_Uniquepqgeviews_Dependencies)
```

### Question 3:
Find out the probable factors from the dataset, which could affect the exits. Exit Page Analysis is usually required to get an idea about why a user leaves the website for a session and moves on to another one. Please keep in mind that exits should not be confused with bounces.

### Write-Up:
From the anova table results, we can infer that exits affected by all variables such as, source group, bounces, unique views, continent, visits, and time on page.
```r
anovatable_Exits_Dependencies <- aov(Exits~., data=internet)
summary(anovatable_Exits_Dependencies)
```

### Question 4:
Every site wants to increase the time on page for a visitor. This increases the chances of the visitor understanding the site content better and hence there are more chances of a transaction taking place. Find the variables which possibly have an effect on the time on page.

### Write-Up:
From the anova table results, we can infer that the time on page is affected by continent, source group, bounces, unique page views, and views since they have more significance than the other variables.
```r
anovatable_Timeonpage_Dependencies <- aov(Timeinpage~., data=internet)
summary(anovatable_Timeonpage_Dependencies)
```

### Question 5:
A high bounce rate is a cause of alarm for websites which depend on visitor engagement. Help the team in determining the factors that are impacting the bounce.

### Write-Up:
From the logistic regression, we can infer unique pageviews and exits impact bounces. Since bounces are exits, exits have greater signifance.
```r
internet$Bounces=internet$Bounces/0.01
rmm<-
glm(BouncesNew~Timeinpage+Continent+Exits+Sourcegroup+Uniquepageviews+Visits,data =
internet,family = "binomial")
summary(rmm)
```