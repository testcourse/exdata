library(ggplot2);

library(sqldf);

## Loading data
NEI <- readRDS("summarySCC_PM25.rds");

SCC <- readRDS("Source_Classification_Code.rds");

## Select NEI data for Baltimore City
data5_1 <- NEI[which(NEI$fips==24510),];


## Select SCC data from motor vehicle sources
data5_2 <- SCC[grep("Vehicles",SCC$EI.Sector),];

## Merge the eligible NEI data and SCC data by "SCC"
data5 <- merge(data5_1,data5_2,by.x="SCC",by.y="SCC",all=FALSE);

## Select the total emissions caused by vehicle for each year
data <- sqldf("select year,sum(Emissions) as emissions from data5 group by year order by year");


## Plot the total emissions caused by vehicle for each year
qplot(year,emissions,data=data,geom="line", xlab="Year", ylab="Total Emissions (tons)", main="Emissions from motor vehicle sources in Baltimore City");

## Export the plot to png file
dev.copy(png,"5.png",width=480, height=480);

dev.off();