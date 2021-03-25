Geographic Distribution Trends Compared to Extinction Risk of Mammals on
the IUCN Red List
================
Faith
2021-03-25

## Abstract

The IUCN Red List of Threatened Species was created in to record
information on extinction risk statuses for plants, animals, and fungi.
It includes information about population sizes, threats, and ecology of
each animal that is considered threatened. This project will serve to
analyze the geographical distribution of the seven equine species on the
Red List and observe if the trends match what would be expected of
dominantly Asian equine species. The data set being used to determine
this was collected from GBIF and is called the IUCN Red List of
Threatened Species. The data will be taken and exploratory data analysis
will be used to find equines that are listed on the Red List and then
quantitatively summarize their geographic distribution in the years 2010
and 2020 and visualize it. A conclusion will then be drawn as to whether
or not the seven species are falling farther into risk or beginning to
climb out of it. Finally, a statistical test will determine the
significance of the occurrences between 2010 and 2020.

## Introduction

## Methods

### Data Acquisition

For this project, all of the data was analyzed and manipulated using
RStudio (RStudio Team 2021). Data was acquired from the Global
Biodiversity Information Facility, abbreviated GBIF (GBIF, 2021). The
data was acquired in two ways. Firstly, data was imported from the IUCN
Red List of Endangered Species data set (IUCN 2020)–abbreviated IUCN
List throughout the rest of the presentation. This data set was used to
acquire information on which equine species were on the IUCN’s Red List.
Secondly, the R package know as rgbif (Chamberlain et al. 2021,
Chamberlain and Boettiger 2017) was utilized to acquire the occurrence
data for each of the equine species on the list. No special access was
required to for any of these resources, but rgbif had to be downloaded
into R Studio using the function before the occurrence data on GBIF
could be accessed. Furthermore, the data from the IUCN List had to be
manually dropped into the project folder once downloaded. There were
three files, but only the file labeled taxon.txt contained relevant
information. Once the file was in the project folder, it could be read
in and transformed into a tibble using the read\_tsv(“\[file name\]”)
function from the tibble package (Muller and Wickham, 2020). This
imported the data in a manner that would allow for more convenient
analysis and modification in the future.

Finally, the occurrence data for each of the seven species were acquired
using the function with the amount limit being set at its maximum to
ensure the most accurate information be returned. The search function
was applied to each species individually to allow for occurrence
searches based on each one’s specific scientific name.

### Data Preparation

Beginning with the IUCN List, data was prepared for analysis first by
filtering through all the species present on the Red List so that only
the equine species were present. This was done by filtering the data to
only show species who’s family was Equidae. Once the equine species were
located, only those that had accepted taxonomic status were selected
for. Then, the data was filtered to only show species as opposed to
including subspecies and species.

Next, to make the data easier to navigate several columns not relevant
to the goal were removed, leaving only the taxon ID, the genus, and the
specific epithet. Once this was finished, this data was used in the
previously mentioned acquisition of occurrence data.

Once the occurrence data was acquired, it had to undergo several changes
to make it more usable. Firstly, the data had to be transformed from a
RGBIF format to a tibble format. Once the data set was placed into
tibble format, unnecessary columns were removed. The columns that
remained were the scientific Name, the Latitude, the Longitude, the
year, and the state province. Once all of the species were refined,
their individual tibbles were combined into a master tibble that would
allow for collection of all occurrences to be seen together.

Due to several “not applicable” values, the longitude, latitude and
scientific name were removed from the tibble. This left the state
province, year, and the number of occurrences remaining.

Finally, due to discrepancies in how each state province was named–such
as capitalization, use of unique characters, and abbreviations–the data
was manipulated to make all the naming styles uniform. This allowed for
cleaning appearances in the graph, and more accurate representation of
the distribution of the seven species.

Once all the data was organized in a manner that could allow
visualization, a bar graph was used to depict the occurrence numbers in
relation to state provinces for two different years that were 10 years
apart. A second bar graph was created to depict overall trends in
occurrences between the two years. A t-test was then performed to
determine if the differences between the two years was significant.

## Results

## Discussion

## Literature Cited

IUCN (2020). The IUCN Red List of Threatened Species. Version 2020-3.
<https://www.iucnredlist.org>. Downloaded on 2021-02-24.
<https://doi.org/10.15468/0qnb58> accessed via GBIF.org on 2021-03-23.

GBIF.org (2021), GBIF Home Page. Available from: <https://www.gbif.org>
\[24 February 2021\].

Chamberlain S, Barve V, Mcglinn D, Oldoni D, Desmet P, Geffert L, Ram K
(2021). *rgbif: Interface to the Global Biodiversity Information
Facility API*. R package version 3.5.2, \<URL:
<https://CRAN.R-project.org/package=rgbif>\>.

R Core Team (2020). R: A language and environment for statistical
computing. R Foundation for Statistical Computing, Vienna, Austria. URL
<https://www.R-project.org/>.

Hadley Wickham, Romain François, Lionel Henry and Kirill Müller (2020).
dplyr: A Grammar of Data Manipulation. R package version 1.0.2.
<https://CRAN.R-project.org/package=dplyr>

H. Wickham. ggplot2: Elegant Graphics for Data Analysis. Springer-Verlag
New York, 2016.

Kirill Müller and Hadley Wickham (2020). tibble: Simple Data Frames. R
package version 3.0.4. <https://CRAN.R-project.org/package=tibble>

RStudio Team (2020). RStudio: Integrated Development Environment for R.
RStudio, PBC, Boston, MA URL <http://www.rstudio.com/.E>
