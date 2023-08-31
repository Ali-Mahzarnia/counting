path = '/Users/ali/Desktop/Aug23/count/MasterSheet_Experiments2021.xlsx'

library(xlsx) 
 
 data= read.xlsx2(path, sheetName = "18ABB11_readable02.22.22_BJ_Cor") %>%select( Genotype, Age_Months, Sex, Treatment)
 
 data = na.omit(data)
 data$Age_Months = as.numeric(data$Age_Months)
 data = na.omit(data)
 
 data$Genotype = gsub(" ","",data$Genotype)
 data$Sex = gsub(" ", "", data$Sex)
 
 
 data$age_cat = data$Age_Months
 median = median(as.numeric(data$Age_Months))
# median = 14
 data$age_cat[as.numeric(data$Age_Months)< median] = "Young"
 data$age_cat[as.numeric(data$Age_Months)>= median] = "Old"
 
mean( data$Age_Months[ data$age_cat=="Young"])
mean( data$Age_Months[ data$age_cat=="Old"])
sd( data$Age_Months[ data$age_cat=="Young"])
sd( data$Age_Months[ data$age_cat=="Old"])
 
table1 = table(data$Treatment, data$age_cat, data$Genotype, data$Sex)
table2 = table(data$Sex, data$Genotype,data$age_cat , data$Treatment)

table2

write.xlsx2(table1, "table1.xlsx")
write.xlsx2(table2, "table2.xlsx")
