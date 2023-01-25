
require(pdftools)

path <- 'C:/Users/jersiton.matos/Desktop/rendimentos/'

pdfs <- list.files(path)

pdf_combine(
  c(paste0(path, pdfs)),
  output = paste0(path, 'Extratos de Investimento - Conta de Doação - jan a nov.pdf')
)

path <- 'C:/Users/jersiton.matos/Desktop/movimentacoes/'

pdfs <- list.files(path)

pdf_combine(
  c(paste0(path, pdfs)),
  output = paste0(path, 'Movimentações - Conta de Doação - jan a nov.pdf')
)

path <- 'S:/04. DEPARTAMENTO DE FINANCAS/04. ANO 2022/01. CONTROLE FINANCEIRO/13. RENDIMENTOS/10. Outubro 2022/Caixa/'

pdfs <- list.files(path)

pdf_combine(
  c(paste0(path, pdfs)),
  output = paste0(path, 'Extratos de Investimento da CAIXA.pdf')
)
