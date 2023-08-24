path = '/Users/ali/Desktop/Aug23/count_excercise_mouse/Animal_Inventory.xlsx'

library(xlsx) 
 
 data= read_excel(path , sheet = "6mthCtrl BehavioralVsScan") %>%select(Sex, Genotype, Month )
 data$Month = as.numeric(data$Month)
 data = data[data$Month<9,]
 
 #unique(data$Genotype)
 # 
 # data$age_cat = data$Month
 # data$age_cat[as.numeric(data$Month)< median(as.numeric(data$Month))] = "Young"
 # data$age_cat[as.numeric(data$Month)>= median(as.numeric(data$Month))] = "Old"
 # 
 
 table(data$Genotype, data$Sex)
   