# Part 1

# First Try

.f = function() {
    
    
pollutantmean <- function(directory, pollutant, id = 1:332) {
    df <- data.frame()
    files_full <- list.files(directory, full.names=TRUE)
    for(i in id) {
        df <- rbind(df, read.csv(files_full[i]))
    }
    print(mean((unlist(df[pollutant])), na.rm = TRUE))
}
pollutantmean("specdata", "nitrate")


}


# Second Try
pollutantmean <- function(directory, pollutant, id = 1:332) {
    files_full <- list.files(directory, full.names=TRUE)
    tmp <- lapply(files_full, read.csv)
    df <- do.call (rbind, tmp)
    print(mean((unlist(df[pollutant])), na.rm = TRUE))
}
a <- pollutantmean("specdata", "sulfate", 1:10)

   






