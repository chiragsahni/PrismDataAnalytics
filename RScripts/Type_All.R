library(RMongo)
mongo <- mongoDbConnect("PrismData","localhost",27017)

output <- dbGetQuery(mongo,'Type_All','{}')


piepercent<- round(100*output$Y/sum(output$Y), 1)

pdf('/home/IMPETUS/chirag.sahni/Desktop/PrismDataAnalytics/Graphs/Type_All.pdf',height = 5,width = 8)
pie(output$Y,labels = output$Y,col=rainbow(length(output$Y)),main = "DIFFERENT TYPES OF INPUT DATA")
legend("topright",output$X,cex=0.6,fill = rainbow(length(output$Y)))

dev.off()

