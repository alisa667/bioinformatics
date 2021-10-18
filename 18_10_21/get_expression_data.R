library(GEOquery)
gse <- getGEO('GSE11923',GSEMatrix=TRUE)
show(gse)
#show first 10 columns 
#33 rows in total each (showing a few)
show(pData(phenoData(gse[[1]]))[1:10,c(1,6,8)])


