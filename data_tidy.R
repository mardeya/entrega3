library(tidyverse)


# Leer los diferentes tablas
db1 = read.csv("co2_production.csv")
db2 = read.csv("gross_national_income_per_capital.csv")
db3 = read.csv("human_development_index.csv")
db4 = read.csv("life_expectancy_by_birth.csv")
db5 = read.csv("population.csv")
db6 = read.csv("country_continent.csv")


db1 <- db1 %>% 
  select(1:3, 5, co2_prod_2021) %>% 
  dplyr::filter(ISO3 != "")

db2 <- db2 %>% 
  select(ISO3, gnipc_2021) %>% 
  dplyr::filter(ISO3 != "")

db3 <- db3 %>% 
  select(ISO3, hdi_2021) %>% 
  dplyr::filter(ISO3 != "")

db4 <- db4 %>% 
  select(ISO3, le_2021) %>% 
  dplyr::filter(ISO3 != "")

db5 <- db5 %>% 
  dplyr::filter(Year == 2021) %>% 
  rename(Country = Country.name) %>% 
  select(Country, Population)

db6 <- db6 %>% 
  select(code_3, continent) %>% 
  rename(ISO3 = code_3, Continent = continent)


# Junto las primeras tablas
db <- db1 %>% 
  left_join(db2, by = "ISO3") %>% 
  left_join(db3, by = "ISO3") %>% 
  left_join(db4, by= "ISO3")


# Arreglar los datos para hacer el join

db5[27, "Country"] <- db[23, "Country"]   # Bolivia
db5[33, "Country"] <- db[26, "Country"]   # Brunei
db[34, "Country"] <- db5[51, "Country"]   # Costa de marfil
db5[57, "Country"] <- db[36, "Country"]   # Rep. Congo
db5[40, "Country"] <- db[40, "Country"]   # Cabo Verde
db5[149, "Country"] <- db[60, "Country"]  # Micronesia
db5[98, "Country"] <- db[73, "Country"]   # Hong Kong
db5[103, "Country"] <- db[81, "Country"]  # Iran
db[95, "Country"] <- db5[215, "Country"]  # Corea del Sur
db5[120, "Country"] <- db[97, "Country"]  # Laos
db5[150, "Country"] <- db[110, "Country"] # Moldova
db[143, "Country"] <- db5[169, "Country"] # Corea del Norte
db5[178, "Country"] <- db[146, "Country"] # Palestina
db5[190, "Country"] <- db[149, "Country"] # Russia
db5[69, "Country"] <- db[167, "Country"]  # Eswatini
db5[223, "Country"] <- db[169, "Country"] # Syria
db5[62, "Country"] <- db[175, "Country"]  # Timor-Leste
db[179, "Country"] <- db5[233, "Country"] # Turquia
db5[226, "Country"] <- db[181, "Country"] # Tanzania
db5[247, "Country"] <- db[188, "Country"] # Venezuela
db5[248, "Country"] <- db[189, "Country"] # Vietnam


# data final

db <- db %>% 
  left_join(db5, by= "Country") %>% 
  left_join(db6, by="ISO3")
