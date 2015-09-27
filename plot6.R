# This code is written as part of Assignment-2 of Coursera's Exploratory Data Analysis course.

library(ggplot2)
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

NEI_SCC <- merge(NEI,SCC)
# Grepping for all Mobile levels in the EI.Sector field. This excludes emissions from Non-Road equipment.
NEI_SCC_baltimore <- droplevels(NEI_SCC[grepl("Mobile - [A|C|L|O]",NEI_SCC$EI.Sector,ignore.case=T) & NEI_SCC$fips=="24510",])

NEI_SCC_losangeles <- droplevels(NEI_SCC[grepl("Mobile - [A|C|L|O]",NEI_SCC$EI.Sector,ignore.case=T) & NEI_SCC$fips=="06037",])

NEI_SCC_baltimore$city <- "baltimore"
NEI_SCC_losangeles$city <- "losangeles"
combined_data <- rbind(NEI_SCC_baltimore, NEI_SCC_losangeles)

total <- aggregate(Emissions~year+city,combined_data,sum)

png(filename = "plot6.png")
g <- ggplot(total, aes(factor(year),Emissions))
p <- g + geom_bar(stat="identity",aes(fill=city),position="dodge") + labs(title='Total emissions from Motor Vehicle sources in Baltimore and LosAngeles \n (Excludes Mobile - Non Road Equipment)') + labs(x = " Year", y= "PM 2.5 Emissions")
print(p)
dev.off()
