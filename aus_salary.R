## Tidy Tuesday week 4 
## High Income Female Occupations in Australia
## jblewis49
## ------------------------------
library(tidyverse)
aus.sal <- read.csv("./tidytuesday-0.1.04/data/week4_australian_salary.csv")

aus.sal$occupation <- sub("\\\x96", "-", aus.sal$occupation)
aus.sal$occupation <- sub(";", " -", aus.sal$occupation)

top.10.female <- aus.sal %>% 
      filter(gender == "Female") %>%
      arrange(desc(average_taxable_income)) %>% 
      top_n(10)
all.male <- filter(aus.sal, gender == "Male")

plot1 <- left_join(top.10.female, all.male, by = "occupation") %>% 
      arrange(average_taxable_income.x) %>% 
      ggplot() +
      geom_point(aes(x = fct_reorder(occupation, average_taxable_income.x / 1000), 
                     y = average_taxable_income.x / 1000), color = "pink", size = 5) + 
      geom_point(aes(x = fct_reorder(occupation, average_taxable_income.y / 1000), 
                     y = average_taxable_income.y / 1000), color = "light blue", size = 5) +
      coord_flip() + 
      ggtitle("Top 10 Highest Income Occupations for Females in Australia [pink]", 
              subtitle = "Comparison of Male Counterpart Salaries [blue]") +
      labs(x = NULL, 
           y = "Average Income ($K)", 
           caption = "Source: data.gov.au   |   graphic by jblewis49") + 
      theme(plot.caption = element_text(size = 8, hjust = 0))
      
ggsave("fem_high_salary_plot.png",  plot = last_plot(), width = 12, height = 6, dpi = 600)   
      
# ---------- Top 10 Highest Income Occupations for Males in Australia --------
      
top.10.male <- aus.sal %>% 
      filter(gender == "Male") %>%
      arrange(desc(average_taxable_income)) %>% 
      top_n(10)

