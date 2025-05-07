library(tidyverse)
url <- 'https://docs.google.com/forms/d/e/1FAIpQLSfUj1Fdhzq_iYZdkRU6zyyKdTJZ4rMJkkW3CwGosJ0uwq2ssA/viewform?usp=pp_url&entry.132596897='

lista_processos = readr::read_rds('data-raw/brutos/02.lista_processos.rds')
link_questionario <- paste0(url,lista_processos)

set.seed(42)
tab <- tibble::tibble(
  lista_processos = lista_processos,
  link_questionario = link_questionario
) |>
  dplyr::sample_frac(1) |>
  dplyr::mutate(
    pesquisador = c(
      rep('Ana Beatriz Chamon', 370),
      rep('Athena Mascarenhas da Cunha', 370),
      rep('Beatriz Leite Rocha', 370),
      rep('Camilla Silva Correa', 370),
      rep('Cristina da Motta Soares', 370),
      rep('Daniele da Silva Bananeira', 370),
      rep('Eduardo Gazoni', 370),
      rep('Evellin Cristina da Silva Camargo', 370),
      rep('Giovanna Freitas', 369),
      rep('Giulia Ottani Gonçalves', 369),
      rep('Guilherme Souza Parralego', 369),
      rep('Ilio Gregolin Sanchez', 369),
      rep('Janielma de Sousa Gonzaga', 369),
      rep('João Vitor Ferreira', 369),
      rep('juanito costa', 369),
      rep('Letícia Marina da Silva Moura', 369),
      rep('Luiz Otavio Louzada', 369),
      rep('Maria Magalhães Diniz Martins', 369),
      rep('Paola Iaquinta', 369),
      rep('Rafael Moreira Faria', 369),
      rep('Victor Salgado', 369),
      rep('Victoria de Azevedo Torres Silveira', 369),
      rep('Camila Hypolito', 369)
    )
  ) |>
  dplyr::select(pesquisador,dplyr::everything())

  tab_jb <- tab |>
    dplyr::filter(
      pesquisador %in% c(
      "Ana Beatriz Chamon",
      "Athena Mascarenhas da Cunha",
      "Beatriz Leite Rocha",
      "Camilla Silva Correa",
      "Cristina da Motta Soares"
    ))
  
  tab_cg <- tab |>
    dplyr::filter(
      pesquisador %in% c(
      "Daniele da Silva Bananeira",
      "Eduardo Gazoni",
      "Evellin Cristina da Silva Camargo",
      "Giovanna Freitas",
      "Giulia Ottani Gonçalves"
    ))
  
  tab_jbu <- tab |>
    dplyr::filter(
      pesquisador %in% c(
      "Guilherme Souza Parralego",
      "Ilio Gregolin Sanchez",
      "Janielma de Sousa Gonzaga",
      "João Vitor Ferreira",
      "juanito costa"
    ))
  
  tab_rd <- tab |>
    dplyr::filter(
      pesquisador %in% c(
      "Letícia Marina da Silva Moura",
      "Luiz Otavio Louzada",
      "Maria Magalhães Diniz Martins",
      "Paola Iaquinta",
      "Rafael Moreira Faria"
    ))
  
  tab_rv <- tab |>
    dplyr::filter(
      pesquisador %in% c(
      "Victor Salgado",
      "Victoria de Azevedo Torres Silveira",
      "Camila Hypolito"
    ))


    writexl::write_xlsx(
      list(
        "Juliana Biochi" = tab_jb,
        "Cybelle Guedes" = tab_cg,
        "Juliana Bumachar" = tab_jbu,
        "Rodrigo D'Orio" = tab_rd,
        "Ronaldo V." = tab_rv
      ),
      'data-raw/brutos/base_questionario.xlsx'
    )


# Pré teste
# Vetor com os 23 nomes de pesquisadores
pesquisadores <- c(
  "Ana Beatriz Chamon",
  "Athena Mascarenhas da Cunha",
  "Beatriz Leite Rocha",
  "Camilla Silva Correa",
  "Cristina da Motta Soares",
  "Daniele da Silva Bananeira",
  "Eduardo Gazoni",
  "Evellin Cristina da Silva Camargo",
  "Giovanna Freitas",
  "Giulia Ottani Gonçalves",
  "Guilherme Souza Parralego",
  "Ilio Gregolin Sanchez",
  "Janielma de Sousa Gonzaga",
  "João Vitor Ferreira",
  "juanito costa",
  "Letícia Marina da Silva Moura",
  "Luiz Otavio Louzada",
  "Maria Magalhães Diniz Martins",
  "Paola Iaquinta",
  "Rafael Moreira Faria",
  "Victor Salgado",
  "Victoria de Azevedo Torres Silveira",
  "Camila Hypolito"
)

# Preteste
set.seed(42)
tab_preteste <- tab |>
  dplyr::select(-pesquisador) |>
  dplyr::sample_n(50) 

# Replicar base para cada pesquisador
tab_preteste <- tidyr::crossing(
  pesquisador = pesquisadores,
  tab_preteste
)


tab_jb_preteste <- tab_preteste |>
    dplyr::filter(
      pesquisador %in% c(
      "Ana Beatriz Chamon",
      "Athena Mascarenhas da Cunha",
      "Beatriz Leite Rocha",
      "Camilla Silva Correa",
      "Cristina da Motta Soares"
    ))
  
  tab_cg_preteste<- tab_preteste |>
    dplyr::filter(
      pesquisador %in% c(
      "Daniele da Silva Bananeira",
      "Eduardo Gazoni",
      "Evellin Cristina da Silva Camargo",
      "Giovanna Freitas",
      "Giulia Ottani Gonçalves"
    ))
  
  tab_jbu_preteste <- tab_preteste |>
    dplyr::filter(
      pesquisador %in% c(
      "Guilherme Souza Parralego",
      "Ilio Gregolin Sanchez",
      "Janielma de Sousa Gonzaga",
      "João Vitor Ferreira",
      "juanito costa"
    ))
  
  tab_rd_preteste <- tab_preteste |>
    dplyr::filter(
      pesquisador %in% c(
      "Letícia Marina da Silva Moura",
      "Luiz Otavio Louzada",
      "Maria Magalhães Diniz Martins",
      "Paola Iaquinta",
      "Rafael Moreira Faria"
    ))
  
  tab_rv_preteste <- tab_preteste |>
    dplyr::filter(
      pesquisador %in% c(
      "Victor Salgado",
      "Victoria de Azevedo Torres Silveira",
      "Camila Hypolito"
    ))


    writexl::write_xlsx(
      list(
        "Juliana Biochi" = tab_jb_preteste,
        "Cybelle Guedes" = tab_cg_preteste,
        "Juliana Bumachar" = tab_jbu_preteste,
        "Rodrigo D'Orio" = tab_rd_preteste,
        "Ronaldo V." = tab_rv_preteste
      ),
      'data-raw/brutos/preteste_base_questionario.xlsx'
    )