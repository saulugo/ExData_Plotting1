plot2 <- function(){
        require(dplyr) # make sure you have 'dplyr' package installed in your system
        
        myfile <- "./data/household_power_consumption.txt"
        if(!file.exists(myfile)) stop("The data file is not located in the ./data directory")
        # make sure your data file is in a "data" directory inside your working directory
        print("Reading the data file, please wait!")
        data <- read.table(myfile, header=TRUE,sep=";")
        
        data <- mutate(data,my_date=as.Date(Date,"%d/%m/%Y"))
        data <- filter(data,(my_date=="2007-02-01" | my_date=="2007-02-02"))
        
        GAP <- as.vector(data$Global_active_power)
        GAP <- as.numeric(GAP)
        
        date_time <- paste(data$Date, data$Time)
        date_time <- strptime(date_time,"%d/%m/%Y %H:%M:%S")
        
        plot(date_time,GAP,type="n",ylab="Global Active Power (kilowatts)",xlab="")
        lines(date_time,GAP)
        dev.copy(png,file="plot2.png")
        dev.off()
        print("Your Plot is ready... have a good day!")
        

        
}