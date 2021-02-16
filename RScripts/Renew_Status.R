library(RMongo)
mongo <- mongoDbConnect("PrismData","localhost",27017)

output <- dbGetQuery(mongo,'Renew_Status','{}')
args=commandArgs(TRUE)
args[1]

piepercent<- round(100*output$Y/sum(output$Y), 1)

pdf(args[1],height = 20,width = 40)
barplot((output$Y),names.arg = (output$X),col=c("darkorange","#599ad3"),
   
        main="Renew Status Analysis",
        xlab="Status",
        ylab="Frequency",
        border = "black",
        cex.main=5, cex.lab=2.5,cex.names =2,cex.axis = 2)

dev.off()

