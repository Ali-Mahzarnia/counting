path = '/Users/ali/Desktop/Aug23/count/MasterSheet_Experiments2021.xlsx'

library(xlsx) 
 
 data= read.xlsx2(path, sheetName = "18ABB11_readable02.22.22_BJ_Cor") %>%select( Genotype, Age_Months, Sex, Treatment, Mn2Cl.pump, Lifestyle)
 
 data = na.omit(data)
 data$Age_Months = as.numeric(data$Age_Months)
 data = na.omit(data)
 
 data$Genotype = gsub(" ","",data$Genotype)
 data$Sex = gsub(" ", "", data$Sex)
 
 
 data$age_cat = data$Age_Months
 median = median(as.numeric(data$Age_Months))
# median = 14
 data$age_cat[as.numeric(data$Age_Months)< 9] = "6 MO"
 data$age_cat[as.numeric(data$Age_Months)>= 9 & as.numeric(data$Age_Months)< 14 ] = "12 MO"
 data$age_cat[as.numeric(data$Age_Months)>=14] = "16 MO"
 
mean( data$Age_Months[ data$age_cat=="6 MO"])
mean( data$Age_Months[ data$age_cat=="12 MO"])
mean( data$Age_Months[ data$age_cat=="16 MO"])
#sd( data$Age_Months[ data$age_cat=="Young"])
#sd( data$Age_Months[ data$age_cat=="Old"])
 


data_pump = data[data$Mn2Cl.pump=="1",]

table1 = ftable(data_pump$Genotype, data_pump$Sex, data_pump$age_cat, data_pump$Treatment)

data_pump = data[data$Mn2Cl.pump=="1",]
table1 = ftable(data_pump$Genotype, data_pump$Sex, data_pump$age_cat, data_pump$Treatment)

# 
# table2 = table(data$Mn2Cl.pump, data$Sex, data$Genotype,data$age_cat , data$Treatment)
# 
# table2
# 
# # write.xlsx2(table1, "table1.xlsx")
# # write.xlsx2(table2, "table2.xlsx")
# 
# 
# data2 = data
# data2 = data[data$Mn2Cl.pump=="1",]
# 
# table2 = table(data2$Sex, data2$Genotype,data2$age_cat , data2$Treatment)
# 
