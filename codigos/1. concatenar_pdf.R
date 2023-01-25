
require(pdftools)

path <- 'C:/'

pdfs <- list.files(path)

pdf_combine(
  c(paste0(path, pdfs)),
  output = paste0(path, 'Extratos de Investimento - Conta de Doação - jan a nov.pdf')
)

path <- 'C:/'

pdfs <- list.files(path)

pdf_combine(
  c(paste0(path, pdfs)),
  output = paste0(path, 'Movimentações - Conta de Doação - jan a nov.pdf')
)

path <- 'S:/'

pdfs <- list.files(path)

pdf_combine(
  c(paste0(path, pdfs)),
  output = paste0(path, 'Extratos de Investimento.pdf')
)
