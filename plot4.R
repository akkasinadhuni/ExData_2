# This code is written as part of Assignment-2 of Coursera's Exploratory Data Analysis course.

library(ggplot2)
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

NEI_SCC <- merge(NEI,SCC)

NEI_SCC_coal <- NEI_SCC[grepl("coal",NEI_SCC$EI.Sector,ignore.case=T),]
total <- aggregate(Emissions~year,NEI_SCC_coal,sum)


png(filename = 'plot4.png')
g <- ggplot(total, aes(factor(year),Emissions)) 
p <- g + geom_bar(stat="identity") + labs(title='Total emissions from Coal combustion related sources over the years') + labs(x = " Year", y= "PM 2.5 Emissions")
print(p)
dev.off()
