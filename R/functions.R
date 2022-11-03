

download_data <- function () {
  
  dest_fich <- "data/coralfishglobal.csv"
  
  if ( file.exists(dest_fich)  ) {  
    
  } else {

    download.file(url = "https://raw.githubusercontent.com/giovannistrona/fish_coral/master/coralfishglobal.csv",
                  destfile = dest_fich)
    
  } #eo if/else
  
} #end of download_data



moyenne <- function (valeurs) {
  
  somme <- sum(valeurs)
  
  moy <- somme / length(valeurs)
  
  return(moy)
  
}# end of moyenne



clean_data <- function () {
  
  dest_fich <- "data/coralfishglobal.csv"
  
  d <- read.csv(dest_fich)
  
  d_clean <- d[, c("lat", "lon", "cor_diversity", "fish_sp_div")]

  names(d_clean)[3] <- c("cor_gen_div")
  
  write.csv(d_clean, file = "outputs/data_clean.csv",
            row.names = FALSE)
  
    
}# eo clean_data


plot_hist <- function (taxon) {
  
  # taxon is "coral" or "fish"
  
  # taxon <- "coral"
  
  dat_fich <- "outputs/data_clean.csv"
  dat <- read.csv(file = dat_fich)
  
  if (taxon == "coral") {
    
    png(filename = "outputs/hist_coral.png")
    
    hist(dat$cor_gen_div,
         main = "Distribution of coral genera number",
         xlab = "")
    
  } # eo if coral
  
  if (taxon == "fish") {
    
    png(filename = "outputs/hist_fish.png")
    
    hist(dat$fish_sp_div,
         main = "Distribution of fish species number",
         xlab = "")
    
  }# eo if fish
  
  dev.off()

  
}# eo plot_hist




