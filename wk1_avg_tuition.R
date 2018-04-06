library(readxl)
library(ggplot2)
# setwd()

avg_tuition <- read_xlsx("../TidyTuesday/data/us_avg_tuition.xlsx")
head(avg_tuition)
str(avg_tuition)
ggplot(data = avg_tuition) + 
      geom_col(mapping = aes(x = State, y = `2015-16`),fill = "blue") +
      coord_flip()

# Do the same with geom_bar but change stat to equal "identity"
# Use reorder() function to display lowest to highest tuition by state
# Provide a Title and axis labels to the plot
ggplot(data = avg_tuition) +
      geom_bar(mapping = aes(x = reorder(State, -`2015-16`), y = `2015-16`), stat = "identity", fill = "blue") +
      coord_flip() +
      ggtitle("Average US Tuition Costs for 2015-2016 ordered by State") +
      ylab("Academic Year 2015-16 Tuition ($)") +
      xlab("50 US States")


# I want to add a row of the column means to this dataframe to display the US AVG Tuition, 
# but cannot figure out how.
US_avg <- apply(avg_tuition[,2:13], 2, mean)
t(USAVG)





