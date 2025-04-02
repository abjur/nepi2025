library(tidyverse)
novos_cnj_tjsp <- readr::read_delim('data-raw/brutos/TJSP_CN_G1.csv',delim = ';')

novos_cnj_tjsp_ <- novos_cnj_tjsp |>
  janitor::clean_names() |>
  dplyr::filter(
    ano %in% 2021:2024,
    nome_da_ultima_classe %in% c('TUTELA CAUTELAR ANTECEDENTE','TUTELA ANTECIPADA ANTECEDENTE'),
    !stringr::str_detect(processo,'sigiloso')
    )

readr::write_rds(novos_cnj_tjsp_,'data-raw/brutos/01.base_filtrada.rds')

processos_lista <- novos_cnj_tjsp_ |>
  dplyr::pull(processo) |>
  unique()

readr::write_rds(processos_lista,'data-raw/brutos/02.lista_processos.rds')
