## Coursera course Exploratory Data analysis
## Programmer VogueOOO
## Task Project 1
## File plot1.R


dataFile <- "household_power_consumption.txt"

## declare the data type of the columns for the numbers
df <- read.csv(dataFile, 
               header = TRUE,
			   sep = ";",
			   na.strings = "?", 
               colClasses = c("character", "character","numeric","numeric","numeric","numeric","numeric"))
 
 ## the instructions for the project say to subset the data of these days
 ## it is sufficient to use strings to do this because the date, in any form,
 ## is not part of the histogram
 dfSub <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007" ,]
 
 ## the hist() method produces the desired graph
 ## 'main' parameter will change the title of the histogram
 ## the instructions for the project require width and height of the png to be 480
 png("plot1.png", width = 480, height = 480)
 hist(dfSub$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main = "Global Active Power")
 dev.off()
 
