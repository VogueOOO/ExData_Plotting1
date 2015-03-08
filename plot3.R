## Coursera course Exploratory Data analysis
## Programmer VogueOOO
## Task Project 1
## File plot3.R


 dataFile <- "household_power_consumption.txt"

## declare the data type of the columns for the numbers and read it into a data.frame
df <- read.csv(dataFile, header = TRUE, sep = ";",
               na.strings = "?", 
			   colClasses = c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
 
 ## the instructions for the project say to subset the data of these days
 ## it is sufficient to use strings to do this.
 dfSub <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007" ,]
  
 ## the data is ordered by seconds so add a column to the left of the 
 ## data.frame that is the time in seconds. this will be the X-axis.
 dfSub <- cbind( in_seconds=strptime(paste(dfSub$Date, dfSub$Time), "%d/%m/%Y %H:%M:%S"), dfSub)

 
 ## assign color names to symbols to insure that the color of the legend
 ## matches the colot of the plot.
 colorP1 = "black"
 colorP2 = "red"
 colorP3 = "blue"
 
 ## the instructions for the project require width and height of the png to be 480 pixels
 png("plot3.png", width = 480, height = 480)
 
 plot(dfSub$Sub_metering_1 ~ dfSub$in_seconds, 
      ylab = "Energy sub metering",
	  xlab = "",
	  type = "l",
	  col = colorP1)

lines(dfSub$Sub_metering_2 ~ dfSub$in_seconds, col = colorP2)

lines(dfSub$Sub_metering_3 ~ dfSub$in_seconds, col = colorP3)	  

legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
	   col = c(colorP1,colorP2,colorP3),
	   lty = 1)

dev.off()
 
