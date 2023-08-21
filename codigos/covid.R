
require(dplyr)
require(tidyr)
require(ggplot2)
require(readr)
require(showtext)
require(showtextdb)
require(lubridate)

font_install(
  google_fonts('Montserrat')
)
showtext_auto() # instância da fonte

options(scipen = 999)

link <- 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv'

temp <- tempdir() # criando diretório temporário

download.file(link, paste0(temp, '\\casos.csv')) # baixando dados

list.files(temp)

data <- read_csv(paste0(temp, '\\casos.csv')) # lendo dados

data_tratado <- data |>
  filter(`Country/Region` %in% c('US', 'China', 'Brazil')) |> # filtrando países
  pivot_longer(cols = !c(1:4), names_to = 'Date', values_to = 'Cases') |> # pivotando países e províncias
  mutate(
    Date = as.Date(Date, '%m/%d/%y'), # arrumando data
    NewCases = c(1, diff(Cases, 1)) # calculando novos casos (1)
  ) |> 
  group_by(`Country/Region`, Date) |> # agrupando
  summarise(Cases = sum(Cases), NewCases = sum(NewCases)) |> # resumindo
  mutate(
    NewCases = ifelse(NewCases < 0, 0, NewCases) # calculando novos casos (2)
  )

data_tratado |>
  ggplot() +
  geom_line(aes(x = Date, y = NewCases, col = `Country/Region`), size = 1) +
  labs(
    title = 'Novos Casos por Mês - COVID-19 - 2020 a 2023',
    subtitle = 'Brasil, China e Estados Unidos',
    caption = 'Elaborado por autor.',
    x = '',
    y = 'Novos Casos (Qtd.)'
  ) +
  theme_minimal() + 
  theme(
    plot.title = element_text(face = 'bold'),
    text = element_text(family = 'Fira Sans'),
  )
