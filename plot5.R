# This code is written as part of Assignment-2 of Coursera's Exploratory Data Analysis course.

library(ggplot2)
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

NEI_SCC <- merge(NEI,SCC)

# Grepping for all Mobile levels in the EI.Sector field. This excludes emissions from Non-Road equipment.
NEI_SCC_vehicles <- droplevels(NEI_SCC[grepl("Mobile - [A|C|L|O]",NEI_SCC$EI.Sector,ignore.case=T)& NEI$fips==24510,])

total <- aggregate(Emissions~year,NEI_SCC_vehicles,sum)

png(filename = "plot5.png")
g <- ggplot(total, aes(factor(year),Emissions))
p <- g + geom_bar(stat="identity",fill='blue') + labs(title='Total emissions from Motor Vehicle sources in Baltimore \n (Excludes Mobile - Non Road Equipment)') + labs(x = " Year", y= "PM 2.5 Emissions")
print(p)
dev.off()
