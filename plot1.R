plot1 <- function(){
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
        hist(GAP,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)",ylim=c(0,1200))
        dev.copy(png,file="plot1.png")
        dev.off()
        print("Your Histogram is ready... have a good day!")
        
}