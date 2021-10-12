.libPaths('/home/USER_NAME/.R')
# Jupyter kernel
install.packages(c('repr', 'IRkernel', 'IRdisplay'), lib="/home/USER_NAME/.R")
IRkernel::installspec()
# Base
install.packages(c('performance', 'assertr', 'evaluate', 'V8', 'crayon', 'devtools', 'uuid', 'pbdZMQ', 'digest'), lib="/home/USER_NAME/.R")
# Formatter
install.packages('formatR', lib="/home/USER_NAME/.R")
# Data manipulation
install.packages(c('dplyr', 'data.table', 'fields'), lib="/home/USER_NAME/.R")
# Graphics
install.packages(c('ggplot2', 'lattice', 'gridExtra', 'rgl'), lib="/home/USER_NAME/.R")
# Documentation
install.packages(c('ggvis', 'knitr', 'rmarkdown'), lib="/home/USER_NAME/.R")
# Machine learning, Non-paramtric regression, etc 
install.packages(c('mlr', 'xgboost', 'caret', 'prophet', 'randomForest', 'gss', 'mgcv', 'gam', 'glmnet', 'glmnetUtils', 'performance', 'assertr' ), lib="/home/USER_NAME/.R")
