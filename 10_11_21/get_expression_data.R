library(GEOquery)
#gse <- getGEO('GSE135875',GSEMatrix=FALSE)

#show(pData(phenoData(gse[[1]]))[1,c(1:25)])
gds[["GSE11923_series_matrix.txt.gz"]]@assayData[["exprs"]]
t <- read.table(file = "D://R programming//18_10_21//mgi_data.txt", header = TRUE, fill = TRUE, sep = "\t")
probeset <- t$Probeset.ID
h <- hash(unique(t$MGI.ID), vector("list", length(unique(t$MGI.ID))))
for (i in 1:length(probeset)){
  if (is.null(h$t$MGI.ID[i])) 
    h[t$MGI.ID[i]] <- vector()
  print(length(h[[t$MGI.ID[i]]]))
  h[[t$MGI.ID[i]]][length(h[[t$MGI.ID[i]]]) + 1] = t$Probeset.ID[i]
}

h2 <- hash(t$MGI.ID, t$Probeset.ID)


