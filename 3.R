library(ggplot2);

library(sqldf);

## Loading data
NEI <- readRDS("summarySCC_PM25.rds");

SCC <- readRDS("Source_Classification_Code.rds");

## Select the total emissions in Baltimore City each year and each type
data <- sqldf("select type, year, SUM(Emissions) as emission from NEI where fips==24510 group by type, year order by type, year");

## Plot with type equals to "line"
qplot(year,emission,data=data,color=type,geom="line", xlab="Year", ylab="Total Emissions (tons)");

## Export the plot to png file
dev.copy(png,"3.png",width=480, height=480);

dev.off();