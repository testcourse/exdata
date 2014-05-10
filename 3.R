library(ggplot2);

library(sqldf);

NEI <- readRDS("summarySCC_PM25.rds");

SCC <- readRDS("Source_Classification_Code.rds");

data <- sqldf("select type, year, SUM(Emissions) as emission from NEI where fips==24510 group by type, year order by type");

qplot(year,emission,data=data,color=type,geom="line", xlab="Year", ylab="Total Emissions (tons)")

dev.copy(png,"3.png",width=480, height=480);

dev.off();