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

table <- select(horses, taxonID, genus, specificEpithet)
table




## locating all occurrences of of equus africanus

equus_africanus <- occ_search(scientificName = "Equus africanus", limit = 100000)
equus_africanus
equus_africanus$data

## Removing irrelevant columns from the equus africanus table

africanus <- select(equus_africanus$data, year, country, countryCode)
africanus

## Selecting for occurences in 2010 and 2020

Afr <- filter(africanus, year == "2010" | year == "2020")
Afr

## locating all occurrences of equus kiang

equus_kiang <- occ_search(scientificName = "Equus kiang", limit = 100000)
equus_kiang
equus_kiang$data

## Removing irrelevant columns from the equus kiang table

kiang <- select(equus_kiang$data, year, country, countryCode)
kiang

## Kiang occurrences 2010 and 2020

Kia <- filter(kiang, year == "2010" | year == "2020")
Kia

## locating all equus quagga

equus_quagga <- occ_search(scientificName = "Equus quagga", limit = 100000)
equus_quagga
equus_quagga$data

## Removing irrelevant columns from the equus quagga table

quagga <- select(equus_quagga$data, year, country, countryCode)
quagga

## quagga occurrences 2010 and 2020

Qua <- filter(quagga, year == "2010" | year == "2020")
Qua

## locating all equus grevyi

equus_grevyi <- occ_search(scientificName = "Equus grevyi", limit = 100000)
equus_grevyi
equus_grevyi$data

## Removing irrelevant columns from the equus grevyi table

grevyi <- select(equus_grevyi$data, year, country, countryCode)
grevyi

## Grevyi occurrences 2010 and 2020

Gre <- filter(grevyi, year == "2010" | year == "2020")
Gre

## locating all equus ferus

equus_ferus <- occ_search(scientificName = "Equus ferus", limit = 100000)
equus_ferus
equus_ferus$data

## Removing irrelevant columns from the equus ferus table

ferus <- select(equus_ferus$data, year, country, countryCode)
ferus

## Ferus occurrences 2010 and 2020

Fer <- filter(ferus, year == "2010" | year == "2020")
Fer

## locating all equus zebra

equus_zebra <- occ_search(scientificName = "Equus zebra", limit = 100000)
equus_zebra
equus_zebra$data

## Removing irrelevant columns from the equus zebra table

zebra <- select(equus_zebra$data, year, country, countryCode)
zebra

## Zebra occurrences 2010 and 2020

Zeb <- filter(zebra, year == "2010" | year == "2020")
Zeb

## locating all equus hemionus

equus_hemionus <- occ_search(scientificName = "Equus hemionus", limit = 100000)
equus_hemionus
equus_hemionus$data

## Removing irrelevant columns from the hemionus kiang table

hemionus <- select(equus_hemionus$data, year, country, countryCode)
hemionus

## hemionus occurrences 2010 and 2020

Hem <- filter(hemionus, year == "2010" | year == "2020")
Hem

## combine all tables

Y<- bind_rows(Afr, Kia, Qua, Gre, Fer, Zeb, Hem)
Y

tbl <- count(tbl, year, country)
tbl

tbl2 <- arrange(tbl, desc(country))
tbl2


## count the year occurrences

Y_occurrences <- count(tbl2, year)
Y_occurrences

## visual display of occurrence distribution

ggplot(data = Y_occurrences) +
  geom_col(mapping = aes(x = as.factor(year), y = n), fill = "#c5351B",
           width = .75) +
  labs(x = "Year", y = "Number of Occurrences") +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(.9)),
    axis.text.x = element_text(angle = 90, hjust = 1),
    axis.ticks.x = element_blank()
  )


[Insert Bar graph of state prov by year]