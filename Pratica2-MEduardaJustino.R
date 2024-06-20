# QUESTÃO 1

# Carregando os dados do PIB
library(readr)
library(dplyr)
library(stringr)
library(lubridate)
library(purrr)
library(ggplot2)
install.packages("tidyr")
library(tidyr)

pib_precos <- read.csv2('C:/Users/Maria Eduarda/OneDrive/Documents/Minicurso R/ipeadata[19-06-2024-08-52].csv',
                header = F)
colnames(pib_precos) <- c("V1")
head(pib_precos)

pib_tibble <- as_tibble(pib_precos)
pib_tibble
#Data,PIB - preços básicos - índice real encadeado dessazonalizado (média 1995 = 100)

pib_tibble <- pib_tibble[-1, ] # tirar a primeira linha

pib_tibble <- pib_tibble %>%
  separate(V1, into = c("Ano_Trim", "PIB"), sep = ",")
View(pib_tibble)

pib_tibble$PIB <- as.numeric(pib_tibble$PIB)

ggplot(pib_tibble, aes(x = Ano_Trim, y = PIB)) +
  geom_line(color = "lightpink") +  # Linha para representar a série histórica
  labs(title = "Série Histórica do PIB", x = "Ano Trimestre", y = "PIB") +  # Títulos dos eixos e do gráfico
  theme_minimal()  

# pib_tibble <- pib_precos %>%
#   separate(V1, into = c("Ano", "Trimestre"), sep = " T") %>%
#   mutate(
#     Ano_Trim = paste0(Ano, "-0", Trimestre),  # Adiciona o trimestre ao ano
#     Ano_Trim = ymd(paste(Ano_Trim, sep = "-")),  # Converte para data
#     ) %>%
#   select(Ano_Trim, PIB)
# Converter a coluna "Ano_Trim" para formato de data
#pib_tibble$Ano_Trim <- as.Date(paste0(pib_tibble$Ano_Trim, " T01"), format = "%Y T%m")



# Criando o gráfico
plot(pib_data$Data, pib_data$Valor, type = "l", xlab = "Ano", ylab = "PIB (índice real)")
title("Série Histórica do PIB")

# Visualizar o resultado
print(pib_tibble)


# IMPORTAÇÃO
pib_import <- read.csv2('C:/Users/Maria Eduarda/OneDrive/Documents/Minicurso R/ipeadata[19-06-2024-07-56].csv',
                        header = F)

import_tibble <- as_tibble(pib_import)
import_tibble

import_tibble <- import_tibble[-1 ,] 

import_tibble <- import_tibble %>%
  separate(V1, into = c("Ano_Trim", "PIB_importações"), sep = ",") %>%
  mutate(PIB_importações = as.numeric(PIB_importações))


# EXPORTAÇÃO
pib_export <- read.csv2('C:/Users/Maria Eduarda/OneDrive/Documents/Minicurso R/ipeadata[19-06-2024-07-55].csv',
                        header = F)

export_tibble <- as_tibble(pib_export)
export_tibble

export_tibble <- export_tibble[-1 ,] 

export_tibble <- export_tibble %>%
  separate(V1, into = c("Ano_Trim", "PIB_exportações"), sep = ",") %>%
  mutate(PIB_exportações = as.numeric(PIB_exportações))

# BALANÇO COMERCIAL

# Unindo os dataframes de importação e exportação pelo Ano_Trim
balanco_comercial <- full_join(import_tibble, export_tibble, by = "Ano_Trim")

balanco_comercial <- balanco_comercial %>%
  mutate(Balanço_comercial = PIB_exportações - PIB_importações)
  
head(balanco_comercial)

ggplot(balanco_comercial, aes(x = Ano_Trim, y = Balanço_comercial)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  labs(title = "Balanço Comercial do Brasil (1995-2024)", x = "Ano Trimestre", y = "Balanço Comercial") +
  theme_minimal()



# QUESTÃO 2

data(USArrests) #USArrests: Taxas de Crimes Violentos por Estado nos EUA

USArrests

par(mar = c(5, 6, 4, 2) + 0.1)
# Gráfico de barras das taxas de assassinatos por estado
barplot(USArrests$Murder, names.arg = rownames(USArrests), 
        main = "Taxa de Assassinatos por Estado nos EUA",
        ylab = "Taxa de Assassinatos (por 100.000 habitantes)",
        col = "#FF3800", ylim = c(0, max(USArrests$Murder) + 5))

# usando as colunas com os tipos de crimes
crimes <- USArrests[, c("Murder", "Assault", "Rape")]

# transpor os dados p/ usar funções gráficas como barplot
crimes <- t(crimes)

cores <- c("#FF6347", "#4682B4", "#FFD700")

# Criar o gráfico de barras empilhadas
barplot(crimes, beside = TRUE, 
        main = "Taxas de Crimes Violentos por estado nos EUA",
        ylab = "Taxa por 100.000 habitantes",
        col = cores,
        legend.text = rownames(crimes),
        args.legend = list(title = "Tipo de Crime", x = "topright", cex = 0.7))

#Análise
print("O gráfico Taxas de Crimes Violentos por Estado nos EUA mostra a taxa de
assassinatos por 100.000 habitantes em cada estado dos EUA. Percebe-se que alguns
estados têm taxas mais altas dos diferentes crimes abordados do que outros,
proporcionando uma visão geral da variação geográfica desses crimes nos Estados Unidos")

# LifeCycleSavings: Dados de Economia de Ciclo de Vida entre Países

data(LifeCycleSavings)
LifeCycleSavings

dados <- LifeCycleSavings[, c("sr", "dpi")]

# Criar o gráfico de dispersão
plot(dados$dpi, dados$sr,
     main = "Poupança Pessoal versus Renda Per Capita",
     xlab = "Renda Per Capita (dólares)",
     ylab = "Poupança Pessoal (% da renda disponível)",
     col = "darkgreen", pch = 16)

# Adicionar etiquetas para os países
text(dados$dpi, dados$sr, labels = rownames(dados), pos = 3, col = "black", cex = 0.5)

grid()

legend("topright", legend = "Países", col = "darkgreen", pch = 16, bty = "n")


print("No gráfico Dados de Economia de Ciclo de Vida entre Países é evidenciado a
relação entre a poupança pessoal (como percentual da renda disponível) e a renda
per capita entre países. Ao analisar o resultado dos países por meio da associação
entre essas duas variáveis, percebe-se padrões econômicos em diferentes países.
Como por exemplo, o Brasil tem uma população que valoriza a poupança pessoal mais
que a dos EUA, no entanto a renda per capita do Brasil é inferior a dos EUA consideravelmente.
Assim, os brasileiros poupam mais, porem podem ter poupanças com valores inferiores
em dólares que a dos estadunidenses, visto que a renda bruta e a disponível são menores.")

# Carregar dados
data(sleep)

# Gráfico de caixas do tempo de sono por tipo de tratamento
boxplot(extra ~ group, data = sleep, 
        main = "Tempo de Sono por Tipo de Tratamento",
        xlab = "Tipo de Tratamento",
        ylab = "Tempo Extra de Sono (horas)",
        col = "lightpink")

# tempo de sono prolongado
sleep1 <- with(sleep, extra[group == 2] - extra[group == 1])

# gráfico de caixas 
boxplot(sleep1, horizontal = TRUE,
        main = "Tempo de Sono Prolongado (n = 10)",
        xlab = "Horas", boxwex = 0.5, staplewex = 0.25)


print("Para analisar os dados, é preciso comparar o tempo extra de sono (em horas)
entre os estudantes que receberam diferentes tipos de tratamento. Ele mostra a
distribuição e a variação no tempo de sono adicional proporcionado pelos diferentes
tratamentos, permitindo uma análise visual das diferenças entre os grupos.")

      
      
print("O gráfico mostra que a maioria dos pacientes (mediana de em torno de 2h,
com variação de 30 minutos para mais e para menos) experimentou um aumento
moderado no tempo de sono após o tratamento. Com um outlier(resultado atípico)
que teve um aumento substancial (cerca de 4h).")
