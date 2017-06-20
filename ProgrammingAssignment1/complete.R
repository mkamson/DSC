# Part 2

complete <- function(directory, id = 1:20, threshold = 0) {
    files_full <- list.files(directory, full.names=TRUE)
    tmp <- lapply(files_full, read.csv)
    df <- do.call (rbind, tmp)
    nobs <- c()
    cr <- c()
    
    comp <- df[complete.cases(df), ]
    for(i in id) {
        nobs <- append(nobs, sum(comp["ID"] == i))
    }
    
    df_nobs <- data.frame(id, nobs) 
    df_nobs
}

set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])


