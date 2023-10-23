library(tidyverse)
library(ggplot2)


df <- read.csv("dataset_tidy.csv", header = TRUE)

df$Continent <- df$Continent %>% as.factor

df$HDI_level <- df$HDI_level %>% factor(
  levels = c("Low", "Medium", "High", "Very High"),
  ordered = TRUE
)

str(df)


df %>% ggplot(aes(x = ISO3, y = Population)) +
  geom_bar(stat="identity")
