setwd("~/Nandini/Coursera/Specialization_Data Science/4.Exploratory Data Analysis/Project2")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")  ## 6497651 rows
SCC <- readRDS("Source_Classification_Code.rds")  ##11717 rows

m <- merge(NEI,SCC,by="SCC",all.x=TRUE) ## 6497651
as.factor(m$year)

## Subset data for Baltimore City, Maryland
baltimore <- subset(m, fips=="24510")
##2096 records

## Subsetting for rows with "Mobile" keyword in column names "EI.Sector" 
##Not sure what should be exact keywords

vehicle <- grepl("mobile",baltimore$EI.Sector,ignore.case=TRUE)
 data <- baltimore[vehicle,] ##1564

png("plot5.png")
em_sum <- tapply(data$Emissions,data$year,sum)
xx <- barplot(em_sum, main="PM2.5 Emissions from Motor vehicles, Baltimore City",xlab="year",ylab="PM2.5 Emissions (tons)",ylim=c(0,1000))
text(x = xx, y = em_sum+10, label = round(em_sum), pos = 3, cex = 0.8, col = "green")
dev.off()