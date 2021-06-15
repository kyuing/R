# install.packages("lubridate")
library(lubridate)
library(stringr)
library(ggplot2)

setwd("C:/Users/HP/Documents/R_projects/COVID_Vaccinations_JUNE2021/")

#load file 
data <- read.csv("owid-covid-data.csv", header=TRUE, sep=",", encoding="UTF-8") 

# extract location and people fully vaccinated
all <- data[c("iso_code", "location", "people_fully_vaccinated", "date")]
all


# to data frame
df <- data.frame(all)
df

# take location == "World" && people_fully_vaccinated > 0
world <- subset(df, location == "World"
                 & location != "<NA>"
                 & people_fully_vaccinated != "NA")
world

# export 
write.csv(world,file="world_vaccination_27122020_to12062021.csv", row.names=FALSE)



# extract # of people_fully_vaccinated based on 1st date of month
# from JAN to JUNE 2021
world$date <- as.Date(world$date)
monthly <- subset(world,date == floor_date(date, 'month')
                  # date == floor_date(world$date, 'month')
           )
monthly

#disable scientific notation
options(scipen = 999)


ggplot(monthly,
       aes(x=date,
           y=people_fully_vaccinated,
           fill=people_fully_vaccinated)) +
       geom_bar(stat="identity") +
       labs(title="Monthly Corona Vaccination Status 2021
            \n(based on the 1st of every month from JANUARY to JUNE)\n") +
       labs(y= "The number of people that have fully been vacinnated",
            x = "Month",
            fill = "") +
       geom_text(aes(y=people_fully_vaccinated,
                    label=people_fully_vaccinated),
                    position = position_stack(vjust=0.5),
                    col="green",size=3.5)



# refs
# https://ourworldindata.org/covid-vaccinations?country=OWID_WRL
# https://www.nature.com/articles/s41562-021-01122-8
# https://statisticsglobe.com/display-large-numbers-separated-with-comma-in-r
# https://www.stat.auckland.ac.nz/~ihaka/courses/787/lectures-r-graphics.pdf
# https://www.statmethods.net/advgraphs/axes.html
# http://environmentalcomputing.net/plotting-with-ggplot-adding-titles-and-axis-names/
# http://lumiamitie.github.io/r_tutorial/Rvis01
# https://dzone.com/articles/learn-r-how-extract-rows
# https://www.statmethods.net/management/operators.html
# https://lightblog.tistory.com/13
# https://bookdown.org/rdpeng/rprogdatascience/regular-expressions.html
# https://www.rdocumentation.org/packages/stringr/versions/1.4.0/topics/str_match
# https://www.statmethods.net/advgraphs/axes.html

