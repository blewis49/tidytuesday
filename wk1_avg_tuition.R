library(tidyr)
library(readxl)
library(ggplot2)
library(dplyr)

avg_tuition <- read_xlsx("./data/us_avg_tuition.xlsx")
tuition_plot <- avg_tuition %>% 
      gather(key = "year", value = "tuition", `2004-05`:`2015-16`) %>% 
      filter(year == "2015-16") %>% 
      ggplot(mapping = aes(x = reorder(State, tuition), y = tuition)) + 
      geom_bar(stat = "identity") +
      coord_flip() +
      labs(title = "US Tuition Costs for 2015-2016 by State",
      y = "Academic Year 2015-16 Tuition ($)", 
      x = "US State",
      caption = "Source: https://trends.collegeboard.org/college-pricing/ | graphic by @jblewis49")

tuition_plot # view plot 

ggsave("tuition_plot.png",  plot = last_plot(), width = 12, height = 6, dpi = 600)


# I want to add a row of the column means to this dataframe to display the US AVG Tuition, 
# but cannot figure out how.





