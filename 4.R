library(ggplot2);

library(sqldf);

## Loading data
NEI <- readRDS("summarySCC_PM25.rds");

SCC <- readRDS("Source_Classification_Code.rds");

## Select SCC data from coal combustion-related sources
data4 <- SCC[grep("Coal",SCC$EI.Sector),];


## Merge/Inner join the NEI data with SCC data by "SCC"
data <- merge(NEI,data4,by.x="SCC",by.y="SCC",all=FALSE);

## Selct the total emissions each year
data5 <- sqldf("select year,sum(Emissions) as emissions from data group by year order by year");


## Plot the total emissions each year with geom equals to "line"
qplot(year,emissions,data=data5,geom="line", xlab="Year", ylab="Total Emissions (tons)");

## Export the plot to png file
dev.copy(png,"4.png",width=480, height=480);

dev.off();