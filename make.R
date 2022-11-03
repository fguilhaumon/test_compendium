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
