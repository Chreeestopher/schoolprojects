####### Python Project #######

#Import the various packages
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns #Load seaborn and assign to it the variable sns
import math as math
import scipy as scipy
from scipy import stats
import scipy.stats as st


#Imports the CancerRisk CSV to a variable named CancerRisk INSERT YOUR FILE LOCATION HERE
CancerRisk = pd.read_csv('C:/Users/Chris Lee/Downloads/CancerRisk.csv')

###### TASK 2 ######

#Frequency table for Gender
print(CancerRisk['Gender'].value_counts())
gf=pd.crosstab(CancerRisk.Gender, columns='Frequency')
print(gf)

#Relative frequency table for Gender
gf_rel = gf/gf.sum()
print(gf_rel)

#Cumulative frequency for Gender
gf_cum = gf.cumsum()
print(gf_cum)

#Bar chart for Gender
gnd = ['Male', 'Female']
gndpos = np.arange(len(gnd))
gndct = [42,273]

plt.bar(gndpos, gndct, color='blue', edgecolor= 'black')
plt.xticks(gndpos, gnd)
plt.xlabel('Gender', fontsize=14)
plt.ylabel('Count', fontsize=14)
plt.title('Bar Chart of Gender')
plt.show()

#Pie chart for Gender
gndlabels = ['Male', 'Female']
gndcolors = ['blue', 'orange']
gndsizes = [42,273]
plt.pie(gndsizes, labels = gndlabels, colors = gndcolors, startangle = 90, autopct='%1.1f%%')
plt.title('Pie Chart of Gender')
plt.axis('equal')
plt.show()

#42 of the people surveyed were Male, which accounts for 13.3% of the total people surveyed.

#Frequency table for Smoking Status
print(CancerRisk['SmokeStat'].value_counts())
sf=pd.crosstab(CancerRisk.SmokeStat, columns='Frequency')
print(sf)

#Relative frequency table for Gender
sf_rel = sf/sf.sum()
print(sf_rel)

#Cumulative frequency for Gender
sf_cum = sf.cumsum()
print(sf_cum)

#Bar chart for Gender
smk = ['Never', 'Former', 'Current Smoker']
smkpos = np.arange(len(smk))
smkct = [157,115,43]

plt.bar(smkpos, smkct, color='blue', edgecolor= 'black')
plt.xticks(smkpos, smk)
plt.xlabel('Smoking Status', fontsize=14)
plt.ylabel('Count', fontsize=14)
plt.title('Bar Chart of Smoking Status')
plt.show()

#Pie chart for Gender
smklabels = ['Never Smoked', 'Former Smoker', 'Current Smoker']
smkcolors = ['blue', 'orange', 'pink']
smksizes = [157,115,43]
plt.pie(smksizes, labels = smklabels, colors = smkcolors, startangle = 90, autopct='%1.1f%%')
plt.title('Pie Chart of Smoking Status')
plt.axis('equal')
plt.show()

#43 of the people surveyed are current smokers, which accounts for 13.7% of the total people surveyed.


###### TASK 3 ######

#Descriptive Statistics for all Quantitative Variables.  Gender and SmokeStat can be ignored.
print(CancerRisk.describe(include=[np.number]) , '\n')

#Boxplot for Age
plt.boxplot(CancerRisk['Age'])
plt.xlabel('Age')
plt.title('Boxplot of Age')
plt.show()

#Histogram for Age
plt.hist(CancerRisk['Age'], color = 'blue', edgecolor ='black')
plt.xlabel('Age')
plt.ylabel('Frequency')
plt.title('Histogram of Age')
plt.show()

#Boxplot for Calories
plt.boxplot(CancerRisk['Calories'])
plt.xlabel('Calories')
plt.title('Boxplot of Calories')
plt.show()

#Histogram for Calories
plt.hist(CancerRisk['Calories'], color = 'blue', edgecolor ='black')
plt.xlabel('Calories')
plt.ylabel('Frequency')
plt.title('Histogram of Calories')
plt.show()

#Boxplot for Fat
plt.boxplot(CancerRisk['Fat'])
plt.xlabel('Fat')
plt.title('Boxplot of Fat')
plt.show()

#Histogram for Fat
plt.hist(CancerRisk['Fat'], color = 'blue', edgecolor ='black')
plt.xlabel('Fat')
plt.ylabel('Frequency')
plt.title('Histogram of Fat')
plt.show()

###### TASK 4 ######

##Create a qualitative variable from a quantitative one
#Create the ordinal variable DataGrp from DataUse
a = 0
b = 40
c = 50
d = 60
e = max(CancerRisk['Age'])+1
filter_values =[a,b,c,d,e]
CancerRisk["agecat"]= pd.cut(np.array(CancerRisk['Age']), filter_values, right=False,
labels = ['age < 40','40 ≤ age < 50','50 ≤ age < 60','age ≥ 60'])

print((np.array(CancerRisk['agecat'])))

#Frequency Table for AgeCat
print(CancerRisk['agecat'].value_counts())
sagecat=pd.crosstab(CancerRisk.agecat, columns='agecat')
print (sagecat)

#Pie Chart for AgeCat
aclabels = ['Age <40', '40 ≤ Age < 50', '50 ≤ Age < 60', 'Age ≥ 60']
accolors = ['red', 'blue', 'green', 'pink']
sizes = [84, 93, 47, 91]
plt.pie(sizes, labels = aclabels, colors = accolors, startangle= 90, autopct='%1.1f%%')
plt.title('Pie Chart of AgeCat')
plt.axis('equal')
plt.show()

###### TASK 5 ######

#Side-by-side Box and Whisker Plot
t1 = CancerRisk.pivot_table(index='Gender', values='Calories', aggfunc=['count','mean','std','median','min','max'], dropna=True)
print(t1)

sns.boxplot(x= CancerRisk["Gender"], y= CancerRisk["Calories"])
plt.show()

#Confidence Interval Setup
gc=CancerRisk.filter(items=['Gender','Calories'])
gcm=gc[gc['Gender'].isin(['1'])] #Creates a dataframe “gcm” that consists of gender and calories for males
gcm=gcm.filter(items=['Calories']) #Updates the dataframe to only list calories
gcf=gc[gc['Gender'].isin(['2'])] #Creates a dataframe “gcf” that consists of gender and calories for females
gcf=gcf.filter(items=['Calories']) #Updates the dataframe to only list calories
gcms=gcm.describe(include='all') #Descriptive Stats
gcfs=gcf.describe(include='all') #Descriptive Stats


#Confidence Interval Calculation
gcmci=st.t.interval(alpha=0.95,df=len(gcm)-1,loc=np.mean(gcm),scale=st.sem(gcm)) #95% for males
gcmci
gcfci=st.t.interval(alpha=0.95,df=len(gcf)-1,loc=np.mean(gcf),scale=st.sem(gcf)) #95% for females
gcfci


###### TASK 6 ######

#Tables for SmokeStat by AgeCatA
t=pd.crosstab(CancerRisk.SmokeStat, CancerRisk.agecat, margins=True) #There are 29 under 40s smokers
print(t)
t2=t/CancerRisk.shape[0] #34.52% of under 40s are current smokers
print(t2)
t3=pd.crosstab(CancerRisk.SmokeStat,CancerRisk.agecat,margins=False).apply(lambda r:r/r.sum(),axis=1) #Of current smokers, 25% are under 40s
print(t3)
t4=pd.crosstab(CancerRisk.SmokeStat,CancerRisk.agecat,margins=False).apply(lambda c:c/c.sum(),axis=0).round(4) #About a third of under 40s smoke currently
print(t4)

CancerRisk.shape[0]

#Side by Side Bar Chart

ac=['Under 40s', '40-50s', '50-60s', '60s+'] #Subcategories for x-axis
ss=['Never','Former','Current'] #Legend
pos2=np.arange(4) #Number of subsections on x-axis
ct1=[38, 45, 23, 51] #Numbers for each count
ct2=[29, 34, 19, 33]
ct3=[17, 14,  5,  7]
barw=0.2 #Bar Width
plt.bar(pos2,ct1,barw,color='red',edgecolor='black'), plt.bar(pos2+barw,ct2,barw,color='white',edgecolor='black'),plt.bar(pos2+barw*2,ct3, barw, color='blue', edgecolor='blue'),plt.xticks(pos2, ac),plt.xlabel('Age of Participants',fontsize=14),plt.title('Bar Chart of Smoker Status by Age'),plt.legend(ss,loc=2)


print(CancerRisk.head(3))