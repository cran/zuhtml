## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## -----------------------------------------------------------------------------
library(zuhtml)

## -----------------------------------------------------------------------------
doc <- html_parse("
<table>
  <thead><tr><th>Code<th>Price</thead>
  <tr><td>0012<td>12.50
  <tr><td>0034<td>9.00
</table>")
html_table(html_element(doc, "table"))

## -----------------------------------------------------------------------------
doc <- html_parse("
<table>
  <tr><th rowspan=2>Region<th colspan=2>Sales
  <tr><th>2025<th>2026
  <tr><td>North<td>10<td>12
  <tr><td rowspan=2>South<td>7<td>9
  <tr><td>8<td>11
</table>")
html_table(html_element(doc, "table"))

## -----------------------------------------------------------------------------
doc <- html_parse("<table><tr><td>a<td rowspan=2>b<tr><td colspan=2>c</table>")
try(html_table(html_element(doc, "table")))

## -----------------------------------------------------------------------------
doc <- html_parse("<table><tr><td>name<td>qty<tr><td>tea<td>2</table>")
tab <- html_element(doc, "table")
html_table(tab)
html_table(tab, header = TRUE)

## -----------------------------------------------------------------------------
doc <- html_parse("<table><tr><th>a<th>b<tr><td>1<td>-<tr><td>2</table>")
html_table(html_element(doc, "table"), na = "-")

## -----------------------------------------------------------------------------
doc <- html_parse("
<ul>
  <li>Fruit
    <ul><li>Apple<li>Pear</ul>
  <li>Tools
    <div><ol><li>Hammer<li>Saw</ol></div>
</ul>")
menu <- html_element(doc, "ul")
html_list(menu)

## -----------------------------------------------------------------------------
tree <- html_list(menu, mode = "tree")
tree
tree$items[[2]]$children[[1]]$type

## -----------------------------------------------------------------------------
lapply(html_elements(doc, "ul ul, ol"), html_list)

