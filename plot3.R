setwd("~/Nandini/Coursera/Specialization_Data Science/4.Exploratory Data Analysis/Project2")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")  ## 6497651 rows
SCC <- readRDS("Source_Classification_Code.rds")  ##11717 rows

m <- merge(NEI,SCC,by="SCC",all.x=TRUE) ## 6497651
#as.factor(m$year)

## Subset data for Baltimore City, Maryland
baltimore <- subset(m, fips=="24510")
##2096 records

## using ggplot2
library(ggplot2)

png("plot3.png")
qplot(year, data=baltimore, geom="bar", weight=Emissions, binwidth=0.5,main="PM2.5 Emissions by Type for Baltimore City, Maryland",ylab="Emissions (tons)",facets=.~type)
dev.off()


## Or line type 
aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, baltimore, sum)



png("plot3b.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()

