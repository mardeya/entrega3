# Datos cuantitativos
df=read.csv("dataset_tidy.csv")[6:10] %>% drop_na()
df$Population=log(df$Population)

# Revisamos la normalidad multivariante con la funcion ya implentada.

library(tidyverse)
library(mvnormtest)
# Shapiro-Wilk
mshapiro.test(t(df))

# El p-valor  de Shapiro-Wilk prácticamente nulo indica que no hay normalidad
# multivariante. Veamos, variable a variable, si las distribuciones marginales
# son normales.

library(car)
qqPlot(df$HDI,main="HDI",xlab="Cuantiles normales", ylab="Cuantiles de HDI")
qqPlot(df$CO2_prod,main="CO2_prod",xlab="Cuantiles normales", ylab="Cuantiles de CO2_prod")
qqPlot(df$GNIPC,main="GNIPC",xlab="Cuantiles normales", ylab="Cuantiles de GNIPC")
qqPlot(df$Life_expect,main="Life_expect",xlab="Cuantiles normales", ylab="Cuantiles de Life_expect")
qqPlot(df$Population,main="Population",xlab="Cuantiles normales", ylab="Cuantiles de log(Population)")
