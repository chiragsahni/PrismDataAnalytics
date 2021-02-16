library(RMongo)
mongo <- mongoDbConnect("PrismData","localhost",27017)

output <- dbGetQuery(mongo,'Opp_Stage_Name','{}')
args=commandArgs(TRUE)
args[1]

piepercent<- round(100*output$Y/sum(output$Y), 1)

pdf(args[1],height = 30,width = 50)
barplot((output$Y),names.arg = (output$X),col=c("darkorange","#599ad3"), 
        main="Opportunity Stage name",
        xlab="Stage Name",
        ylab="Frequency",
        border = "black",
        cex.main=7, cex.lab=2.5,cex.names =2,cex.axis = 2)

dev.off()

