library(tidyverse)
aus.sal <- read.csv("./tidytuesday-0.1.04/data/week4_australian_salary.csv")
str(aus.sal)
head(aus.sal)

aus.sal %>% 
      group_by(gender) %>%
      summarise(med_inc = median(average_taxable_income))

aus.sal %>% 
      group_by(gender) %>%
      arrange(desc(average_taxable_income)) %>% 
      select(c(3,4,6))
