source("data_tidy.R")


contraste_correlacion<- function(df, continente,var1,k){  
  # Contrastes a realizar, para var1 y var2:
  # H0: corr_continente=corr_global
  # H1: corr_continente!=corr_global
  
  df<-df %>% select(c("Continent",var1))
  filter(df,Continent==continente)[,var1] -> continente_df_var1
  num_paises_cont=table(df$Continent)[continente]
  n=nrow(df)
  
  sample_df=sample_n(df,num_paises_cont,replace=FALSE)
  
  nH1_var1=0
  
  for (x in 1:k){
    set.seed(x)
    
    sample_df=sample_n(df,num_paises_cont,replace=FALSE)
    
    # Test de correlacion
    # var1
    pval_var1=cor.test(sample_df[,var1],continente_df_var1)$p.value
    if (pval_var1<0.05){nH1_var1=nH1_var1+1}
  }
  res_test_var1=(nH1_var1<(3/4)*k) # TRUE ~ H0, FALSE ~ H1
  
  print(nH1_var1)
  return (res_test_var1)
}


kruskal.test(db$Population~db$Continent)

pairwise.wilcox.test(db$hdi_2021, db$Continent, paired=FALSE,
                     p.adjust.method="bonferroni")
