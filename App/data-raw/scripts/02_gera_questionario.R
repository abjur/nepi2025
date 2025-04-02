library(tidyverse)

lista_processos = readr::read_rds('data-raw/brutos/02.lista_processos.rds')
link_questionario <- paste0('',lista_processos)
