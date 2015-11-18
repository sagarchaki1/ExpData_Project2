## Project2 Exploratory Data Analysis 

setwd("~/Nandini/Coursera/Specialization_Data Science/4.Exploratory Data Analysis/Project2")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")  ## 6497651 rows
SCC <- readRDS("Source_Classification_Code.rds")  ##11717 rows

##few checks
head(NEI)
head(SCC)
unique(m$year)

m <- merge(NEI,SCC,by="SCC",all.x=TRUE) ## 6497651
as.factor(m$year)
##write.table(m,"./merged_data",sep=",")
## m <- read.table("./merged_data",sep=",",header=TRUE)

png("plot1.png")
em_sum <- tapply(m$Emissions,m$year,sum)
xx <- barplot(em_sum, main="Total PM2.5 Emissions",xlab="year",ylab="PM2.5 Emissions (tons)",ylim=c(0,8e+06))
text(x = xx, y = em_sum+1000, label = round(em_sum), pos = 3, cex = 0.8, col = "green")
dev.off()

