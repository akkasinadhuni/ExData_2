# This code is written as part of Assignment-2 of Coursera's Exploratory Data Analysis course.

library(ggplot2)
NEI <- readRDS('summarySCC_PM25.rds')
NEI <- NEI[NEI$fips==24510,]
total <- aggregate(Emissions~year+type,NEI,sum)

png(filename = 'plot3.png')
g <- ggplot(total, aes(year,Emissions,color=type)) 
p <- g + geom_line() + labs(title='Total PM 2.5 emissions in Baltimore for each type of emission') + labs(x = " Year", y= "PM 2.5 Emissions")
print(p)
dev.off()
