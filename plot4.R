setwd("~/Nandini/Coursera/Specialization_Data Science/4.Exploratory Data Analysis/Project2")

## Reading Data into R
NEI <- readRDS("summarySCC_PM25.rds")  ## 6497651 rows
SCC <- readRDS("Source_Classification_Code.rds")  ##11717 rows

m <- merge(NEI,SCC,by="SCC",all.x=TRUE) ## 6497651
#as.factor(m$year)

# fetch all  records with Short.Name == Coal
coalMatches  <- grepl("coal", m$Short.Name, ignore.case=TRUE)
coal_data <- m[coalMatches, ] ##53400 rows


em_year <- aggregate(Emissions ~ year, coal_data, sum)

png("plot4.png")
p <- ggplot(em_year, aes(factor(year), Emissions))
p <- p + geom_bar(stat="identity") + xlab("year") + 
  ylab("Emissions (tons)") +
  ggtitle("Total Emissions from coal sources across United States")
print(p)
dev.off()

