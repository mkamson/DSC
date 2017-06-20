# Part 3

corr <- function(directory, threshold = 0) {
    files_full <- list.files(directory, full.names=TRUE)
    tmp <- lapply(files_full, read.csv)
    df <- do.call (rbind, tmp)
    nobs <- c()
    cr <- c()
    
    id = 1:332
    comp <- df[complete.cases(df), ]
    for(i in id) {
        nobs <- append(nobs, sum(comp["ID"] == i))
    }
    
    for(i in id) {
        x <- subset(comp$sulfate, comp$ID == i)
        y <- subset(comp$nitrate, comp$ID == i)      
        cr <- append(cr, cor(x, y))
    }
    
    df_nobs <- data.frame(id, nobs, cr)
    result <- subset(df_nobs$cr, df_nobs$nobs > threshold)
    result
}

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))

