library(ggplot2);

library(sqldf);

NEI <- readRDS("summarySCC_PM25.rds");

SCC <- readRDS("Source_Classification_Code.rds");

data6_1 <- sqldf("select fips, SCC, Emissions, year from NEI where fips='24510' or fips='06037'");

data6_1[which(data6_1$fips=="24510"),"fips"] <- "Baltimore City";

data6_1[which(data6_1$fips=="06037"),"fips"] <- "Los Angeles";

data6_2 <- SCC[grep("Vehicles",SCC$EI.Sector),];

data6 <- merge(data6_1,data6_2,by.x="SCC",by.y="SCC",all=FALSE);

data <- sqldf("select year, fips, sum(Emissions) as emissions from data6 group by year, fips order by year");

names(data)[2] <- "city";

qplot(year,log(emissions),data=data,color=city, geom="line", xlab="Year", ylab="Total Emissions (log(tons)", main="Emissions in Baltimore City vs. Emissions in Los Angeles");

dev.copy(png,"6.png",width=480, height=480);

dev.off();