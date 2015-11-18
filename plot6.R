
setwd("~/Nandini/Coursera/Specialization_Data Science/4.Exploratory Data Analysis/Project2")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")  ## 6497651 rows
SCC <- readRDS("Source_Classification_Code.rds")  ##11717 rows

m <- merge(NEI,SCC,by="SCC",all.x=TRUE) ## 6497651
as.factor(m$year)

## Subset data for Baltimore City, Maryland
baltimore <- subset(m, fips=="24510")
##2096 records

## Subset data for Los Angeles, CA
la <- subset(m, fips == "06037")##9320 records

## Subsetting for rows with "Mobile" keyword in column names "EI.Sector" 
##Not sure what should be exact keywords

balti1 <- grepl("mobile",baltimore$EI.Sector,ignore.case=TRUE)
la1 <- grepl("mobile",la$EI.Sector,ignore.case=TRUE)

balti_data <- baltimore[balti1,] ##1564
la_data <- la[la1,] ##2319

png("plot6.png")
em_sum1 <- tapply(balti_data$Emissions,balti_data$year,sum)
em_sum2 <- tapply(la_data$Emissions,la_data$year,sum)

par(mfrow=c(1,2))
barplot(em_sum1, main="Motor Vehicle Emissions,Baltimore",xlab="year",cex.axis=0.8,cex.lab=0.8, ylab="PM2.5 Emissions (tons)",ylim=c(0,12000),cex.main=0.9)
barplot(em_sum2, main="Motor Vehicle Emissions,Los Angeles",xlab="year",ylab="PM2.5 Emissions (tons)",cex.axis=0.8,cex.lab=0.8,ylim=c(0,12000),cex.main=0.9)
##Maintaining equal scales

dev.off()







