# This code was written as part of Assignment 2 of Coursera's Exploratory Data Analysis Course. 

NEI <- readRDS('summarySCC_PM25.rds')
NEI <- NEI[NEI$fips==24510,]

total <- aggregate(Emissions~year,NEI,sum)

png(filename = 'plot2.png')
barplot(height=total$Emissions,names.arg=total$year, col = "red", xlab="Year", ylab="Emissions", main="Total PM2.5 emissions per year for Baltimore")
dev.off()
