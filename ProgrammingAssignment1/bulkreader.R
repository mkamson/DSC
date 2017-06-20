
bulk_data_reader <- function(directory) {
    df <- data.frame()
    files_full <- list.files(directory, full.names=TRUE)
    for(i in 1:length(files_full)) {
        df <- rbind(df, read.csv(files_full[i]))
    }
    df
}