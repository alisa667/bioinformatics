library(GEOquery)
gse11923 <- getGEO('GSE11923',GSEMatrix=TRUE)
experiment.data <- gse11923[["GSE11923_series_matrix.txt.gz"]]@assayData[["exprs"]]
f <- read.delim(file="D://R programming//18_10_21//mgi_data.txt", header=TRUE, sep="\t")
for (i in 1:100){
  if (unique(f$MGI.ID)[i] != "---")
    draw_graph_for_mgi(unique(f$MGI.ID)[i], i)
}


draw_graph_for_mgi <- function(mgi, ind){
  max.val <- 0
  probes.by.mgi <- f[f$MGI.ID == mgi,]$Probeset.ID
  for (i in 1:length(probes.by.mgi)){
    max.val = max(experiment.data[probes.by.mgi[i],], max.val)
  }
  jpeg(paste("D://R programming//18_10_21//rplot",ind,".jpg", sep=""))
  plot(experiment.data[probes.by.mgi[1],], type = "o", ylim = c(0,max.val))
  title(main=mgi, col.main="red", font.main=4)
  if (length(probes.by.mgi) > 1){
    for (i in 2:length(probes.by.mgi)){
      lines(experiment.data[probes.by.mgi[i],], type="o")
    }
  }
  dev.off()
}

