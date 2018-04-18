## Tidy Tuesday week 3 
## World Mortality Causes in 2016
## jblewis49
## ------------------------------
install.packages("readxl")
library(tidyverse)
library(readxl)

g_mortality <- read_xlsx("global_mortality.xlsx")

# [[:punct:]] is a pre-built class that matches all punctuation
# str_trim removes all whitespace at the end after removing (%)
names(g_mortality) <- str_trim(
      str_remove_all(names(g_mortality), "[[:punct:]]")
)

g_mortality %>% 
      gather("cause", "percent", -c(1:3)) %>% 
            filter(year == 2016 & country == "World") %>% 
            ggplot(mapping = aes(x = reorder(cause, percent), y = percent)) +
            geom_bar(aes(fill = cause), stat = "identity", show.legend = F) + 
            geom_text(mapping = aes(label = paste0(format(percent, digits = 1), "%"), 
                                    hjust = 0), size = 2.5) +
            scale_y_continuous(breaks = c(0,5,10,15,20,25,30),
                               labels = c("0%","5%","10%","15%","20%","25%","30%")) +
            coord_flip() + 
            ggtitle("Share of deaths by cause, World, 2016", 
                    subtitle = "Data refers to the specific cause of death which is distinguished to risk factors for death, such as air pollution, diet and other lifestyle factors.\nThis is shown by cause of death as the percentage of total deaths.") +
            labs(y = NULL, x = NULL,
                 caption = "Source: IHME, Global Burden of Disease   |   graphic by jblewis49") +
            theme(plot.title = element_text(size = 16, hjust = 0)) +
            theme(plot.subtitle = element_text(size = 8, hjust = 0)) +
            theme(plot.caption = element_text(size = 8, hjust = 0))
      
ggsave("world_mortality_plot.png",  plot = last_plot(), width = 12, height = 6, dpi = 600)     
      
      
      