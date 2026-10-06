## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## -----------------------------------------------------------------------------
library(zuhtml)

## -----------------------------------------------------------------------------
html_limits()

## -----------------------------------------------------------------------------
err <- tryCatch(
  html_parse(strrep("<div>", 1e5)),
  zuhtml_limit_error = function(e) e
)
conditionMessage(err)
err$limit

## -----------------------------------------------------------------------------
strict <- html_limits(max_input = 2 * 1024^2, max_memory = 64 * 1024^2,
                      max_depth = 128)
doc <- html_parse("<p>Small page</p>", limits = strict)

## -----------------------------------------------------------------------------
bytes <- as.raw(c(0x3c, 0x70, 0x3e, 0x63, 0x61, 0x66, 0xe9))  # "<p>caf\xe9"
html_text_clean(html_parse(bytes, encoding = "latin1"))

## -----------------------------------------------------------------------------
try(html_parse(bytes))

## -----------------------------------------------------------------------------
page <- c(charToRaw("<meta charset=iso-8859-1><p>"), as.raw(0x93),
          charToRaw("Quoted"), as.raw(0x94))
doc <- html_parse(page)
html_text_clean(doc)
html_info(doc)[c("encoding", "encoding_source")]

## -----------------------------------------------------------------------------
tryCatch(
  html_elements(html_parse("<p>"), "p:hover"),
  zuhtml_selector_error = function(e) paste("unsupported at", e$position)
)

