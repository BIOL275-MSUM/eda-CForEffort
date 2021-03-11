## Installing Packages

install.packages("rgbif")

## Reading in Packages

library(tidyverse)
library(rgbif)

## Reading in Data

taxon <- read_tsv("taxon.txt")
taxon

## Table of horses

equus <- filter(taxon,  family == "EQUIDAE")
equus

accepted <- filter(equus, taxonomicStatus == "accepted")
accepted

horses <- filter(accepted, taxonRank == "species")
horses


## Select for Specific Rows

table <- select(horses, taxonID, order, family, genus, specificEpithet)
table




## locating all occurrences of of equus africanus

equus_africanus <- occ_search(scientificName = "Equus africanus", limit = 100000)
equus_africanus
equus_africanus$data

## Removing irrelevant columns from the equus africanus table

africanus <- select(equus_africanus$data, decimalLatitude, decimalLongitude, stateProvince, year, month, day, eventDate)
africanus

## locating all occurrences of equus kiang

equus_kiang <- occ_search(scientificName = "Equus kiang", limit = 100000)
equus_kiang
equus_kiang$data

## Removing irrelevant columns from the equus kiang table

kiang <- select(equus_kiang$data, decimalLatitude, decimalLongitude, stateProvince, year, month, day, eventDate)
kiang

## locating all equus quagga

equus_quagga <- occ_search(scientificName = "Equus quagga", limit = 100000)
equus_quagga
equus_quagga$data

## Removing irrelevant columns from the equus quagga table

quagga <- select(equus_quagga$data, scientificName, decimalLatitude, decimalLongitude, stateProvince, year, month, day, eventDate)
quagga

## locating all equus grevyi

equus_grevyi <- occ_search(scientificName = "Equus grevyi", limit = 100000)
equus_grevyi
equus_grevyi$data

## Removing irrelevant columns from the equus grevyi table

grevyi <- select(equus_grevyi$data, scientificName, decimalLatitude, decimalLongitude, stateProvince, year, month, day, eventDate)
grevyi

## locating all equus ferus

equus_ferus <- occ_search(scientificName = "Equus ferus", limit = 100000)
equus_ferus
equus_ferus$data

## Removing irrelevant columns from the equus ferus table

ferus <- select(equus_ferus$data, scientificName, decimalLatitude, decimalLongitude, stateProvince, year, month, day, eventDate)
ferus

## locating all equus zebra

equus_zebra <- occ_search(scientificName = "Equus zebra", limit = 100000)
equus_zebra
equus_zebra$data

## Removing irrelevant columns from the equus zebra table

zebra <- select(equus_zebra$data, scientificName, decimalLatitude, decimalLongitude, stateProvince, year, month, day, eventDate)
zebra

## locating all equus hemionus

equus_hemionus <- occ_search(scientificName = "Equus hemionus", limit = 100000)
equus_hemionus
equus_hemionus$data

## Removing irrelevant columns from the hemionus kiang table

hemionus <- select(equus_hemionus$data, scientificName, decimalLatitude, decimalLongitude, stateProvince, year, month, day, eventDate)
hemionus

## combine all tables

full_table <- bind_rows(africanus, kiang, quagga, grevyi, ferus, zebra, hemionus)
full_table

## count the state province occurrences

occurrences <- count(full_table, stateProvince)
occurrences

## visual display of occurrence distribution