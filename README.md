Geographic Distribution Trends Compared to Extinction Risk of Mammals on
the IUCN Red List
================
Faith
2021-03-23

## Abstract

The IUCN Red List of Threatened Species was created in to record
information on extinction risk statuses for plants, animals, and fungi.
It includes information about population sizes, threats, and ecology of
each animal that is considered threatened. This project will serve to
analyze the geographical distribution of the seven equine species on the
Red List and determine if there is a significant trend in region of the
world and extinction risk through observing their occurences. The data
set being used to determine this was collected from GBIF and is called
the IUCN Red List of Threatened Species. The data will be taken and
exploratory data analysis will be used to find equines that are listed
on the Red List and then quantitatively summarize their geographic
distribution. By the end of this analysis a conclusion will be drawn
about whether there is a significant correlation between geographic
location and extinction risk.

## Introduction

## Methods

### Data Acquisition

For this project, data was acquired from the Global Biodiversity
Information Facility, abbreviated GBIF (GBIF, 2021). The data was
acquired in two ways. Firstly, data was imported from the IUCN Red List
of Endangered Species data set (IUCN 2020)–abbreviated IUCN List
throughout the rest of the presentation. This data set was used to
acquire information on which equine species were on the IUCN’s Red List.
Secondly, the R package know as rgbif (Chamberlain et al. 2021,
Chamberlain and Boettiger 2017) was utilized to acquire the occurrence
data for each of the equine species on the list. No special access was
required to for any of these resources, but rgbif had to be downloaded
into R Studio using the install.packages(“\[package name\]”) function
before the occurrence data on GBIF could be accessed. Furthermore, the
data from the IUCN List had to be manually dropped into the project
folder once downloaded. There were three files, but only the file
labeled taxon.txt contained relevant information. Once the file was in
the project folder, it could be read in and transformed into a tibble
using the read\_tsv(“\[file name\]”) function. This imported the data in
a manner that would allow for more convenient analysis in the future.

Finally, the occurrence data for each of the seven species were acquired
using the function occ\_search(ScientificName = “\[Species\]”, limit =
100000) with the amount limit being set at its maximum to ensure the
most accurate information be returned. The search function was applied
to each species individually to allow for occurrence searches based on
each one’s specific scientific name.

### Data Preparation

Beginning with the IUCN List, data was prepared for analysis first by
filtering through all the species present on the Red List so that only
the equine species were present. This was done by filtering the data to
only show species who’s family was Equidae. Once the equine species were
located, only those that had accepted taxonomic status were selected
for. This was done by setting Taxonomic Status to “Accepted”. Then, the
data was filtered to only show species as opposed to including
subspecies and species. All of this was done using the filter(\[data
set\], \[column name\] == \[key term\]) function.

Next, to make the data easier to navigate several columns were removed
using the select(\[data set\], \[desired column 1\], \[desired column
2\], etc.) function, leaving only the taxon ID, the genus, and the
specific epithet. Once this was finished, this data was used in the
previously mentioned acquisition of occurrence data.

Once the occurrence data was acquired as previously mentioned, it had to
undergo several changes to make it more usable. Firstly, the data had to
be transformed from a RGBIF format to a tibble format. To do this, the
data set was renamed using the \<- tool and then the renamed data set
was transformed with the following function: \[Data set name\]$data.
Once the data set was placed into tibble format, the previously noted
select function was used to filter out unnecessary columns and rename
the data into a more readily used term. The columns that remained were
the scientific Name, the Latitude, the Longitude, and the state
province,

Once all of the species were refined, their individual tibbles were
combined into a master tibble that would allow for collection of all
occurrences to be seen together. This was done using the
bind\_rows(\[tibble 1\], \[tibble 2\], etc.) function. This new tibble
was then renamed for easier usage.

Due to several “not applicable” values, the logitude, latitude and
scientific name were removed from the tibble. This left the state
province and the number of occurrences remaining.

Finally, due to discrepencies in how each state province was named–such
as capitalization, use of unique characters, and abbreviation–the data
was manually organized in an excel document to combine occurrences
values for the same region under the same name.

## Results

## Discussion

## Literature Cited

## References

IUCN (2020). The IUCN Red List of Threatened Species. Version 2020-3.
<https://www.iucnredlist.org>. Downloaded on 2021-02-24.
<https://doi.org/10.15468/0qnb58> accessed via GBIF.org on 2021-03-23.

GBIF.org (2021), GBIF Home Page. Available from: <https://www.gbif.org>
\[24 February 2021\].

citation(“rgbif”)

citation()

citation(“dplyr”)

citation(“ggplot2”)
