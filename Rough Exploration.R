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

africanus <- select(equus_africanus$data, year, decimalLatitude, decimalLongitude, stateProvince)
africanus

## Selecting for occurences in 2010 and 2020

Afr2010 <- filter(africanus, year == "2010")
Afr2020 <- filter(africanus, year =="2020")

## locating all occurrences of equus kiang

equus_kiang <- occ_search(scientificName = "Equus kiang", limit = 100000)
equus_kiang
equus_kiang$data

## Removing irrelevant columns from the equus kiang table

kiang <- select(equus_kiang$data, year, decimalLatitude, decimalLongitude, stateProvince)
kiang

## Kiang occurrences 2010 and 2020

Kia2010 <- filter(kiang, year == "2010")
Kia2010
Kia2020 <- filter(kiang, year == "2020")
Kia2020

## locating all equus quagga

equus_quagga <- occ_search(scientificName = "Equus quagga", limit = 100000)
equus_quagga
equus_quagga$data

## Removing irrelevant columns from the equus quagga table

quagga <- select(equus_quagga$data, year, decimalLatitude, decimalLongitude, stateProvince)
quagga

## quagga occurrences 2010 and 2020

Qua2010 <- filter(quagga, year == "2010")
Qua2010
Qua2020 <- filter(quagga, year == "2020")
Qua2020

## locating all equus grevyi

equus_grevyi <- occ_search(scientificName = "Equus grevyi", limit = 100000)
equus_grevyi
equus_grevyi$data

## Removing irrelevant columns from the equus grevyi table

grevyi <- select(equus_grevyi$data, year, decimalLatitude, decimalLongitude, stateProvince)
grevyi

## Grevyi occurrences 2010 and 2020

Gre2010 <- filter(grevyi, year == "2010")
Gre2010
Gre2020 <- filter(grevyi, year == "2020")
Gre2020

## locating all equus ferus

equus_ferus <- occ_search(scientificName = "Equus ferus", limit = 100000)
equus_ferus
equus_ferus$data

## Removing irrelevant columns from the equus ferus table

ferus <- select(equus_ferus$data, year, decimalLatitude, decimalLongitude, stateProvince)
ferus

## Ferus occurrences 2010 and 2020

Fer2010 <- filter(ferus, year == "2010")
Fer2010
Fer2020 <- filter(ferus, year == "2020")
Fer2020

## locating all equus zebra

equus_zebra <- occ_search(scientificName = "Equus zebra", limit = 100000)
equus_zebra
equus_zebra$data

## Removing irrelevant columns from the equus zebra table

zebra <- select(equus_zebra$data, year, decimalLatitude, decimalLongitude, stateProvince)
zebra

## Zebra occurrences 2010 and 2020

Zeb2010 <- filter(zebra, year == "2010")
Zeb2010
Zeb2020 <- filter(zebra, year == "2020")
Zeb2020

## locating all equus hemionus

equus_hemionus <- occ_search(scientificName = "Equus hemionus", limit = 100000)
equus_hemionus
equus_hemionus$data

## Removing irrelevant columns from the hemionus kiang table

hemionus <- select(equus_hemionus$data, year, decimalLatitude, decimalLongitude, stateProvince)
hemionus

## hemionus occurrences 2010 and 2020

Hem2010 <- filter(hemionus, year == "2010")
Hem2010
Hem2020 <- filter(hemionus, year == "2020")
Hem2020

## combine all tables

Y2010 <- bind_rows(Afr2010, Kia2010, Qua2010, Gre2010, Fer2010, Zeb2010, Hem2010)
Y2010

Y2020 <- bind_rows(Afr2020, Kia2020, Qua2020, Gre2020, Fer2020, Zeb2020, Hem2020)
Y2020

## count the year occurrences

Y2010_occurrences <- count(Y2010, year)
Y2010_occurrences

Y2020_occurrences <- count(Y2020, year)
Y2020_occurrences

## combine the years

years <- bind_rows(Y2010_occurrences, Y2020_occurrences)
years

## visual display of occurrence distribution

ggplot(data = years) +
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