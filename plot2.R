## Coursera course Exploratory Data analysis
## Programmer VogueOOO
## Task Project 1
## File plot2.R


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


 ## the instructions for the project require width and height of the png to be 480
 png("plot2.png", width = 480, height = 480)
 
 plot(dfSub$Global_active_power ~ dfSub$in_seconds, 
      ylab = "Global Active Power (kilowatts)",
	  xlab = "",
	  type = "l")
	  
 dev.off()
 
