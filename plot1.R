# This code was written as part of Assignment 2 of Coursera's Exploratory Data Analysis Course. 

NEI <- readRDS('summarySCC_PM25.rds')

total <- aggregate(Emissions~year,NEI,sum)

png(filename = 'plot1.png')
barplot(height=total$Emissions,names.arg=total$year, col = "red", xlab="Year", ylab="Emissions", main="Total PM2.5 emissions per year")
dev.off()
