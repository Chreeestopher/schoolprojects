# R Project

# It should be noted I resaved the csv file as just CSV, not the UTF-8 stuff

#choose the file
BDS <- read.csv(file.choose())

#Makes sure the headings look correct                           
head(BDS)                                              

#creates variables for the columns that have headings
attach(BDS) 						          

########## TASK 1 ###########
BDS$Gain[BDS$njcr <0] <- "Loss"                           #Denotes any Gain values less than 0 as a Loss
BDS$Gain[BDS$njcr >=0 & BDS$njcr <1.7] <- "Poor"          #Denotes any Gain values in-between 0 and 1.7 as Poor
BDS$Gain[BDS$njcr >1.6 & BDS$njcr <3.4] <- "Moderate"     #Denotes any Gain values in-between 1.6 and 3.4 as Moderate
BDS$Gain[BDS$njcr >3.3] <- "Good"				    #Denotes any Gain values greater than 3.3 as Good


########## TASK 3 ###########
#attaches the variable Gain that was missed on the previous attach
attach(BDS)                                               

#Gives dimensions of the data, might be useful for separating years
dim(BDS)                                                  

##Creates specific Gain Variables for each separate year.
Gain1992 <- BDS[1:51, 10]
Gain1997 <- BDS[52:102, 10]
Gain2002 <- BDS[103:153, 10]
Gain2007 <- BDS[154:204, 10]
Gain2012 <- BDS[205:255, 10]

##Creates frequency tables for the variable Gain for each separate year, ordered from Loss to Good
table(ordered(Gain1992, c("Loss","Poor","Moderate","Good")))
table(ordered(Gain1997, c("Loss","Poor","Moderate","Good")))
table(ordered(Gain2002, c("Loss","Poor","Moderate","Good")))
table(ordered(Gain2007, c("Loss","Poor","Moderate","Good")))
table(ordered(Gain2012, c("Loss","Poor","Moderate","Good")))

##Creates relative frequency tables for the variable Gain for each separate year, ordered from Loss to Good
round(prop.table(table(ordered(Gain1992, c("Loss","Poor","Moderate","Good")))),2)
round(prop.table(table(ordered(Gain1997, c("Loss","Poor","Moderate","Good")))),2)
round(prop.table(table(ordered(Gain2002, c("Loss","Poor","Moderate","Good")))),2)
round(prop.table(table(ordered(Gain2007, c("Loss","Poor","Moderate","Good")))),2)
round(prop.table(table(ordered(Gain2012, c("Loss","Poor","Moderate","Good")))),2)

##Creates cumulative relative frequency tables for the variable Gain for each separate year, ordered from Loss to Good
cumsum(round(prop.table(table(ordered(Gain1992, c("Loss","Poor","Moderate","Good")))),2))
cumsum(round(prop.table(table(ordered(Gain1997, c("Loss","Poor","Moderate","Good")))),2))
cumsum(round(prop.table(table(ordered(Gain2002, c("Loss","Poor","Moderate","Good")))),2))
cumsum(round(prop.table(table(ordered(Gain2007, c("Loss","Poor","Moderate","Good")))),2))
cumsum(round(prop.table(table(ordered(Gain2012, c("Loss","Poor","Moderate","Good")))),2))

#Creates frequency bar charts for the variable Gain for each separate year, ordered from Loss to Good
barplot(table(ordered(Gain1992, c("Loss","Poor","Moderate","Good"))), main="Frequency of Gain in 1992", xlab="Gain Type", ylim = c(0,20))
barplot(table(ordered(Gain1997, c("Loss","Poor","Moderate","Good"))), main="Frequency of Gain in 1997", xlab="Gain Type", ylim = c(0,35))
barplot(table(ordered(Gain2002, c("Loss","Poor","Moderate","Good"))), main="Frequency of Gain in 2002", xlab="Gain Type", ylim = c(0,50))
barplot(table(ordered(Gain2007, c("Loss","Poor","Moderate","Good"))), main="Frequency of Gain in 2007", xlab="Gain Type", ylim = c(0,30))
barplot(table(ordered(Gain2012, c("Loss","Poor","Moderate","Good"))), main="Frequency of Gain in 2012", xlab="Gain Type", ylim = c(0,40))

#Creates the four separate colors for pie charts
piechartcolors <- c("snow", "snow3", "snow4", "black")

#Creates a pie chart for Gain for the year 1992, with legend and % labels
piechartlabels1992 <- round((table(Gain1992))/sum(table(Gain1992))*100,1)
piechartlabels1992 <- paste(piechartlabels1992, "%", sep=" ")
pie(table(Gain1992), main="Relative Frequency of Gain in 1992", labels=piechartlabels1992, col=piechartcolors) 
legend (1, 1, c("Loss","Poor","Moderate","Good"),fill=piechartcolors)

#Creates a pie chart for Gain for the year 1997, with legend and % labels
piechartlabels1997 <- round((table(Gain1997))/sum(table(Gain1997))*100,1)
piechartlabels1997 <- paste(piechartlabels1997, "%", sep=" ")
pie(table(Gain1997), main="Relative Frequency of Gain in 1997", labels=piechartlabels1997, col=piechartcolors) 
legend (1, 1, c("Loss","Poor","Moderate","Good"),fill=piechartcolors)

#Creates a pie chart for Gain for the year 2002, with legend and % labels
piechartlabels2002 <- round((table(Gain2002))/sum(table(Gain2002))*100,1)
piechartlabels2002 <- paste(piechartlabels2002, "%", sep=" ")
pie(table(Gain2002), main="Relative Frequency of Gain in 2002", labels=piechartlabels2002, col=piechartcolors) 
legend (1, 1, c("Loss","Poor","Moderate","Good"),fill=piechartcolors)

#Creates a pie chart for Gain for the year 2007, with legend and % labels
piechartlabels2007 <- round((table(Gain2007))/sum(table(Gain2007))*100,1)
piechartlabels2007 <- paste(piechartlabels2007, "%", sep=" ")
pie(table(Gain2007), main="Relative Frequency of Gain in 2007", labels=piechartlabels2007, col=piechartcolors) 
legend (1, 1, c("Loss","Poor","Moderate","Good"),fill=piechartcolors)

#Creates a pie chart for Gain for the year 2012, with legend and % labels
piechartlabels2012 <- round((table(Gain2012))/sum(table(Gain2012))*100,1)
piechartlabels2012 <- paste(piechartlabels2012, "%", sep=" ")
pie(table(Gain2012), main="Relative Frequency of Gain in 2012", labels=piechartlabels2012, col=piechartcolors) 
legend (1, 1, c("Loss","Poor","Moderate","Good"),fill=piechartcolors)

##

#In the year 1992, 0.22 of the Gains made were considered a loss (less than 0 net job creation rate).
#In the year 1997, 0.2 of the Gains made were considered a loss.
#In the year 2002, 0.8 of the Gains made were considered a loss.
#In the year 2007, 0.02 of the Gains made were considered a loss.

########## TASK 4 ###########

##Creates specific Establishments Entered Rate and Establishments Exited Rate variables for 1992 and 2002
eer1992 <- BDS[1:51, 6]
eer2002 <- BDS[103:153, 6]
exr1992 <- BDS[1:51, 7]
exr2002 <- BDS[103:153, 7]

#Sample Size for EER and EXR for the years 1992 and 2002
length(eer1992)
length(eer2002)
length(exr1992)
length(exr2002)

#Mean for EER and EXR for the years 1992 and 2002
round(mean(eer1992),4)
round(mean(eer2002),4)
round(mean(exr1992),4)
round(mean(exr2002),4)

#Five-Number Summary for EER and EXR for the years 1992 and 2002
summary(eer1992)
summary(eer2002)
summary(exr1992)
summary(exr2002)

#Standard Deviation for EER and EXR for the years 1992 and 2002
round(sd(eer1992),4)
round(sd(eer2002),4)
round(sd(exr1992),4)
round(sd(exr2002),4)

#Interquartile Range for EER and EXR for the years 1992 and 2002
IQR(eer1992)
IQR(eer2002)
IQR(exr1992)
IQR(exr2002)

#Histograms for EER and EXR for the years 1992 and 2002
hist(eer1992, main="Establishments Entered Rate in 1992", xlab="Rate")
hist(eer2002, main="Establishments Entered Rate in 2002", xlab="Rate")
hist(exr1992, main="Establishments Exited Rate in 1992", xlab="Rate")
hist(exr2002, main="Establishments Exited Rate in 2002", xlab="Rate")

########## TASK 5 ###########

#Creating a subset of the data for the year 2012
year2012 <- subset(BDS, year=="2012")

#Creating subsets of the 2012 data for each region
MW2012 <- subset(year2012, region=="MW")
NE2012 <- subset(year2012, region=="NE")
SE2012 <- subset(year2012, region=="SE")
SW2012 <- subset(year2012, region=="SW")
W2012 <- subset(year2012, region=="W")

#Descriptive Statistics for Net Job Creation Rate in the MW in 2012
length(MW2012$njcr)
round(mean(MW2012$njcr),2)
round(sd(MW2012$njcr),2)
summary(MW2012$njcr, na.rm=TRUE)
IQR(MW2012$njcr)

#Confidence Interval for NJCR in the MW in 2012
nbMW2012 <- length(MW2012$njcr)
mbMW2012 <- mean(MW2012$njcr)
sebMW2012 <- sd(MW2012$njcr)/sqrt(nbMW2012)
cibMW2012 <- mbMW2012 + c(-1,1)*qt(p=0.95, df=nbMW2012 - 1)*sebMW2012
outbMW2012 <-cbind(nbMW2012, mbMW2012, sebMW2012, cibMW2012)
outbMW2012

#Descriptive Statistics for Net Job Creation Rate in the NE in 2012
length(NE2012$njcr)
round(mean(NE2012$njcr),2)
round(sd(NE2012$njcr),2)
summary(NE2012$njcr, na.rm=TRUE)
IQR(NE2012$njcr)

#Confidence Interval for NJCR in the NE in 2012
nbNE2012 <- length(NE2012$njcr)
mbNE2012 <- mean(NE2012$njcr)
sebNE2012 <- sd(NE2012$njcr)/sqrt(nbNE2012)
cibNE2012 <- mbNE2012 + c(-1,1)*qt(p=0.95, df=nbNE2012 - 1)*sebNE2012
outbNE2012 <-cbind(nbNE2012, mbNE2012, sebNE2012, cibNE2012)
outbNE2012

#Descriptive Statistics for Net Job Creation Rate in the SE in 2012
length(SE2012$njcr)
round(mean(SE2012$njcr),2)
round(sd(SE2012$njcr),2)
summary(SE2012$njcr, na.rm=TRUE)
IQR(SE2012$njcr)

#Confidence Interval for NJCR in the SE in 2012
nbSE2012 <- length(SE2012$njcr)
mbSE2012 <- mean(SE2012$njcr)
sebSE2012 <- sd(SE2012$njcr)/sqrt(nbSE2012)
cibSE2012 <- mbSE2012 + c(-1,1)*qt(p=0.95, df=nbSE2012 - 1)*sebSE2012
outbSE2012 <-cbind(nbSE2012, mbSE2012, sebSE2012, cibSE2012)
outbSE2012

#Descriptive Statistics for Net Job Creation Rate in the SW in 2012
length(SW2012$njcr)
round(mean(SW2012$njcr),2)
round(sd(SW2012$njcr),2)
summary(SW2012$njcr, na.rm=TRUE)
IQR(SW2012$njcr)

#Confidence Interval for NJCR in the SW in 2012
nbSW2012 <- length(SW2012$njcr)
mbSW2012 <- mean(SW2012$njcr)
sebSW2012 <- sd(SW2012$njcr)/sqrt(nbSW2012)
cibSW2012 <- mbSW2012 + c(-1,1)*qt(p=0.95, df=nbSW2012 - 1)*sebSW2012
outbSW2012 <-cbind(nbSW2012, mbSW2012, sebSW2012, cibSW2012)
outbSW2012

#Descriptive Statistics for Net Job Creation Rate in the W in 2012
length(W2012$njcr)
round(mean(W2012$njcr),2)
round(sd(W2012$njcr),2)
summary(W2012$njcr, na.rm=TRUE)
IQR(W2012$njcr)

#Confidence Interval for NJCR in the W in 2012
nbW2012 <- length(W2012$njcr)
mbW2012 <- mean(W2012$njcr)
sebW2012 <- sd(W2012$njcr)/sqrt(nbW2012)
cibW2012 <- mbW2012 + c(-1,1)*qt(p=0.95, df=nbW2012 - 1)*sebW2012
outbW2012 <-cbind(nbW2012, mbW2012, sebW2012, cibW2012)
outbW2012

#Side-by-side Box and Whisker Plots for NJCR for each region in 2012
boxplot(njcr~region, data=year2012, main="2012 Net Job Creation Rate by Region", ylab= "Net Job Creation Rate",xlab ="Region")

########## TASK 6 ###########

#Assigning subsets for both 2007 and 2012
year2007 <- subset(BDS, year=="2007")
year2012 <- subset(BDS, year=="2012")

#Frequency table of Gain by Region
table(year2007$region,ordered(year2007$Gain, c("Loss","Poor","Moderate","Good")))

#Relative frequency table of Gain by Region
round(prop.table(table(year2007$region,ordered(year2007$Gain, c("Loss","Poor","Moderate","Good")))),4)

#Side-by-side bar chart of Gain by Region
barplot(prop.table(table(year2007$region,ordered(year2007$Gain, c("Loss","Poor","Moderate","Good")))),main="Distribution of 2007 Gains Across Regions",xlab="Gain Type",ylab="Proportion",ylim= c(0, 0.25),beside=TRUE, col=c("springgreen","violet","skyblue","lightsalmon","midnightblue"),legend=NULL)
legend("topright", fill=c("springgreen","violet","skyblue","lightsalmon","midnightblue"), c("MW","NE","SE","SW","W"))

#Row Relative frequency table of Gain by Region
prop.table(table(year2007$region,ordered(year2007$Gain, c("Loss","Poor","Moderate","Good"))),1)

#100% Stacked bar chart of Gain by Region
barplot(prop.table(table(year2007$region,ordered(year2007$Gain, c("Loss","Poor","Moderate","Good"))))*100,main="Distribution of 2007 Gains Across Regions",xlab="Gain Type",ylab="Percent",ylim= c(0, 100),beside=FALSE, col=c("springgreen","violet","skyblue","lightsalmon","midnightblue"),legend=NULL)
legend("topright", fill=c("springgreen","violet","skyblue","lightsalmon","midnightblue"), c("MW","NE","SE","SW","W"))

#Column Relative frequency table of Gain by Region
prop.table(table(year2007$region,ordered(year2007$Gain, c("Loss","Poor","Moderate","Good"))),2)

#Frequency table of Gain by Region
table(year2012$region,year2012$Gain)

#Relative frequency table of Gain by Region
round(prop.table(table(year2012$region,ordered(year2012$Gain, c("Loss","Poor","Moderate","Good")))),4)

#Side-by-side bar chart of Gain by Region
barplot(prop.table(table(year2012$region,ordered(year2012$Gain, c("Loss","Poor","Moderate","Good")))),main="Distribution of 2012 Gains Across Regions",xlab="Gain Type",ylab="Proportion",ylim= c(0, 0.25),beside=TRUE, col=c("springgreen","violet","skyblue","lightsalmon","midnightblue"),legend=NULL)
legend("topright", fill=c("springgreen","violet","skyblue","lightsalmon","midnightblue"), c("MW","NE","SE","SW","W"))

#Row Relative frequency table of Gain by Region
prop.table(table(year2012$region,ordered(year2012$Gain, c("Loss","Poor","Moderate","Good"))),1)

#100% Stacked bar chart of Gain by Region
barplot(prop.table(table(year2012$region,ordered(year2012$Gain, c("Loss","Poor","Moderate","Good"))))*100,main="Distribution of 2012 Gains Across Regions",xlab="Gain Type",ylab="Percent",ylim= c(0, 100),beside=FALSE, col=c("springgreen","violet","skyblue","lightsalmon","midnightblue"),legend=NULL)
legend("topright", fill=c("springgreen","violet","skyblue","lightsalmon","midnightblue"), c("MW","NE","SE","SW","W"))

#Column Relative frequency table of Gain by Region
prop.table(table(year2012$region,ordered(year2012$Gain, c("Loss","Poor","Moderate","Good"))),2)

########## TASK 7 ###########

#Assigning subsets for both 1997 and 2007
year1997 <- subset(BDS, year=="1997")
year2007 <- subset(BDS, year=="2007")

#correlation coefficient between Establishments Entered Rate and Job Creation Rate by Firm Birth in 1997
r1997 <- cor(year1997$eer,year1997$jcrb,method=c("pearson"),use="complete.obs")
r1997

#Numerical summary for the correlation in 1997
linearMod1997 <- lm(year1997$jcrb~year1997$eer, data=year1997)
summary(linearMod1997)

#Scatter plot with regression line for EER and JCRB in 1997
plot(x=year1997$eer,y=year1997$jcrb, main="Figure 1: Scatter plot of Establishments Entered Rate vs Job Creation Rate by Firm Birth", xlab="Establishments Entered Rate",ylab="Job Creation Rate by Firm Birth", pch=3)
abline(lm(year1997$jcrb~year1997$eer), col="blue",lty=5,lwd=2)

#correlation coefficient between Establishments Entered Rate and Job Creation Rate by Firm Birth in 2007
r2007 <- cor(year2007$eer,year2007$jcrb,method=c("pearson"),use="complete.obs")
r2007

#Numerical summary for the correlation in 1997
linearMod2007 <- lm(year2007$jcrb~year2007$eer, data=year2007)
summary(linearMod2007)

#Scatter plot with regression line for EER and JCRB in 2007
plot(x=year2007$eer,y=year2007$jcrb, main="Figure 1: Scatter plot of Establishments Entered Rate vs Job Creation Rate by Firm Birth", xlab="Establishments Entered Rate",ylab="Job Creation Rate by Firm Birth", pch=3)
abline(lm(year2007$jcrb~year2007$eer), col="blue",lty=5,lwd=2)





