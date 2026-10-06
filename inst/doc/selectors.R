## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## -----------------------------------------------------------------------------
library(zuhtml)
doc <- html_parse('
<div id=main class="card wide">
  <h2 class=title>One</h2>
  <p class="a b" lang=en-US>first</p>
  <p title="">second</p>
  <ul><li>1<li>2<li>3<li>4</ul>
</div>')

## -----------------------------------------------------------------------------
html_text(html_elements(doc, "h2 ~ p"))
html_text(html_elements(doc, "li:nth-child(odd)"))
html_text(html_elements(doc, "p:not([title])"))
html_text(html_elements(doc, "[lang|=en]"))

## -----------------------------------------------------------------------------
try(html_elements(doc, "div:has(> h2)"))
try(html_elements(doc, "p::text"))

## -----------------------------------------------------------------------------
length(html_elements(doc, "P"))
length(html_elements(doc, ".CARD"))
length(html_elements(doc, "[lang=EN-US]"))
length(html_elements(doc, "[lang=EN-US s]"))

## -----------------------------------------------------------------------------
main <- html_element(doc, "#main")
length(html_elements(main, ".card"))
length(html_elements(main, ":scope.card"))
html_name(html_elements(main, ":scope > *"))

