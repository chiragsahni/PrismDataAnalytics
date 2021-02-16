library(RMongo)
mongo <- mongoDbConnect("PrismData","localhost",27017)

output <- dbGetQuery(mongo,'Revision_Id','{}')
args=commandArgs(TRUE)
args[1]
piepercent<- round(100*output$Y/sum(output$Y), 1)

pdf(args[1],height = 25,width = 25)
barplot((output$Y),names.arg = (output$X),col=c("darkorange","#599ad3"),
        
        
        main="Type vs Average RevisionId",
        ylab="Average",
        xlab="Type",
        border = "black",
        cex.main=4, cex.lab=2.5,cex.names =2,beside = TRUE,cex.axis = 2)

dev.off()

