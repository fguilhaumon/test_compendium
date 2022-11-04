##############################################
#
# make.R
#
# make the entire project
#
##############################################

# load all the functions
source("R/functions.R")

# download and clean the data
source(file = "analyses/01_data.R")

# make the histograms
source(file = "analyses/02_visualisation.R")

# make the 'memoire' docx
quarto::quarto_render(input = "outputs/memoire.qmd")

# make the 'memoire' pptx
quarto::quarto_render(input = "outputs/memoire.qmd",
                      output_format = "pptx")
