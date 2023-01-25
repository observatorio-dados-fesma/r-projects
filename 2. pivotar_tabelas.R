
data <- readxl::read_excel(choose.files())

data <- data |>
  tidyr::pivot_longer(!c(Município, Status), names_to = "Mês", values_to = "Valor") |>
  tidyr::pivot_wider(names_from = Status, values_from = Valor)

write.csv2(
  data, file = 'Passivo CAPS.csv', row.names = FALSE
)
