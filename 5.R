library(ggplot2);

library(sqldf);

NEI <- readRDS("summarySCC_PM25.rds");

SCC <- readRDS("Source_Classification_Code.rds");

data5_1 <- NEI[which(NEI$fips==24510),];

data5_2 <- SCC[grep("Vehicles",SCC$EI.Sector),];

data5 <- merge(data5_1,data5_2,by.x="SCC",by.y="SCC",all=FALSE);

data <- sqldf("select year,sum(Emissions) as emissions from data5 group by year order by year");

qplot(year,emissions,data=data,geom="line", xlab="Year", ylab="Total Emissions (tons)", main="Emissions from motor vehicle sources in Baltimore City");

dev.copy(png,"5.png",width=480, height=480);

dev.off();