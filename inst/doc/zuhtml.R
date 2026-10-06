## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## -----------------------------------------------------------------------------
library(zuhtml)

## -----------------------------------------------------------------------------
page <- '
<!DOCTYPE html>
<title>Tea shop</title>
<nav><ul><li><a href="/">Home</a><li><a href="sale/">Sale</a></ul></nav>
<p>Free shipping over 30 EUR</span>
<div class=product>
  <h2 class=name>Sencha</h2><span class=price>3.50</span>
  <a href="sencha.html">details</a>
</div>
<div class=product>
  <h2 class=name>Genmaicha</h2>
  <a href="genmaicha.html">details</a>
</div>
<table>
  <thead><tr><th>Size<th>Grams</thead>
  <tr><td>Small<td>0100
  <tr><td>Large<td>0250
</table>'

doc <- html_parse(page, base_url = "https://example.org/shop/")
doc

## -----------------------------------------------------------------------------
cards <- html_elements(doc, ".product")
cards

products <- data.frame(
  name = html_text_clean(html_element(cards, ".name")),
  price = html_text_clean(html_element(cards, ".price")),
  url = html_url(html_element(cards, "a"))
)
products

## -----------------------------------------------------------------------------
html_text_clean(html_element(doc, "title"))
html_attr(html_elements(doc, "nav a"), "href")
html_serialize(html_element(doc, "h2"))

## -----------------------------------------------------------------------------
html_links(doc, absolute = TRUE)
lapply(html_elements(doc, "nav ul"), html_list)
html_tables(doc)

## -----------------------------------------------------------------------------
html_problems(doc)

