
# install.packages("read.dbc")

require(read.dbc)
require(tidyverse)

read_all_dbc <- function(path){
  
  l <- list()
  
  for (i in list.files(path)) {
    l[[i]] = read.dbc(
      paste0(path, i)
    )
  }
  
  return(
    do.call('rbind', l)
  )
  
}

data <- read_all_dbc(path = 'arquivos_dbc/')

data_filt <- data |>
  select(CNES, DIAG_PRINC, MORTE) |>
  mutate(
    STATUS = case_when(
      MORTE == 1 ~ 'Morte',
      MORTE == 0 ~ 'Vida'
    )
  ) |> 
  group_by(CNES, DIAG_PRINC, STATUS) |>
  summarise(
    QTD = n()
  ) |> 
  pivot_wider(names_from = STATUS, values_from = QTD)

write.csv2(data_filt, 'base_de_dados.csv')


