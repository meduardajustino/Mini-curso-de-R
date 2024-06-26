# Questao 01. (Wooldridge, 2013 – Adaptada) A tabela a seguir contem as pontuações do ACT  ̃
# e do GPA de oito estudantes universitários. O ACT é um teste, de escala 1 a 36, que mede o  ́
# desempenho dos estudantes universitários americanos em leitura, escrita, matemática e ciência,
# enquanto o GPA (em uma escala de quatro pontos) e a média de pontuação ao longo da graduação 
# e, por simplicidade, foi arredondada para um dígito após a vírgula.
# Estudante GPA ACT
# 1 2.8 21
# 2 3.4 24
# 3 3.0 26
# 4 3.5 27
# 5 3.6 29
# 6 3.0 25
# 7 2.7 25
# 8 3.7 30
# Tabela 1: Wooldridge (2013)

library(ggplot2)

# i. Plote o gráfico de dispersão dos dados. Comente acerca da nuvem de pontos encontrada.  
data <- data.frame(
  Estudante = 1:8,
  GPA = c(2.8, 3.4, 3.0, 3.5, 3.6, 3.0, 2.7, 3.7),
  ACT = c(21, 24, 26, 27, 29, 25, 25, 30)
)

ggplot(data, aes(x = ACT, y = GPA)) +
  geom_point(shape =  21, fill = "lightpink", color = "skyblue", size = 3, stroke = 0.5) +
  labs(title = "   Gráfico de dispersão entre GPA e ACT",
       x = "Pontuaçãpo ACT",
       y = "GPA") +
  theme_minimal()


print("A nuvem de pontos reflete uma tendência crescente entre as variáveis ACT e GPA.
      Sugerindo que uma maior pontuação no ACT está associada a um GPA mais elevado.")

# ii. Realize uma análise descritiva para ambas as variáveis e comente. 

summary(data$GPA)
print("O GPA médio é aproximadamente 3.212, com um mínimo de 2.7 e um máximo de 3.7. 
      Dessa forma, metade dos estudantes analisados tem um desempenho acadêmico acima da média.")

summary(data$ACT)

print("A média do ACT é de 25.88, com um mínimo de 21 e máximo de 30. Assim, a maiori dos
      estudantes analisados tem pontuações dos testes acima da média.")


# iii. Estime a relação entre GPA e ACT, i.e., obtenha as estimativas do intercepto e da inclinação
# GPA = βˆ0 + βˆ1 · ACT.Comente sobre a direção da relação. O intercepto tem uma interpretação  útil aqui? 

model <- lm(GPA ~ ACT, data = data)
summary(model)

print("A inclinação (𝛽1) de 0.10220 indica que, em média, para cada aumento de uma unidade na pontuação do ACT, o GPA aumenta em 0.10220 unidades.
      O valor p significativo para o coeficiente do ACT sugere que há uma relação significativa entre a pontuação do ACT e o GPA.
      O intercepto (𝛽0) não é estatisticamente significativo, indicando que não há uma interpretação prática útil para o GPA quando a pontuação do ACT é zero.
      Com isso, há uma relação positiva e significativa entre as pontuações do ACT e o GPA dos estudantes.")


#   iv. Trace a reta de regressão na nuvem de pontos plotada no item (i). 

ggplot(data, aes(x = ACT, y = GPA)) +
  geom_point(shape =  21, fill = "lightpink", color = "pink", size = 3, stroke = 0.5) +
  geom_smooth(method = "lm", color = "brown", se = FALSE) +
  labs(title = "   Gráfico de dispersão entre GPA e ACT",
       x = "Pontuaçãpo ACT",
       y = "GPA") +
  theme_minimal()

# v. Qual é o valor previsto de GPA quando ACT é 20? 

predict(model, newdata = data.frame(ACT = 20))


# Questão 2. (Gujarati e Porter, 2011 – Adaptada) 
# Tabela 2: Gujarati e Porter (2011)
# i. Estimar um modelo de regressão linear para os dados

dados <- data.frame(
  Despesas_Alimentacao = c(217, 196, 303, 270, 325, 260, 300, 325, 336, 345, 325, 362, 315, 355, 325, 370, 390, 420, 410, 383, 315, 267, 420, 300, 410, 220, 403, 350, 390, 385, 470, 322, 540, 433, 295, 340, 500, 450, 415, 540, 360, 450, 395, 430, 332, 397, 446, 480, 352, 410, 380, 610, 530, 360, 305),
  Despesas_Totais = c(382, 388, 391, 415, 456, 460, 472, 478, 494, 516, 525, 554, 575, 579, 585, 586, 590, 608, 610, 616, 618, 623, 627, 630, 635, 640, 648, 650, 655, 662, 663, 677, 680, 690, 695, 695, 695, 720, 721, 730, 731, 733, 745, 751, 752, 752, 769, 773, 773, 775, 785, 788, 790, 795, 801)
)

modelo <- lm(Despesas_Alimentacao ~ Despesas_Totais, data = dados)

summary(modelo)


# ii. Represente graficamente os dados dispondo as despesas com alimentac ̧ao no eixo vertĩcal
# e os gastos totais no eixo horizontal. Trace tambem uma linha de regressão.

ggplot(dados, aes(x = Despesas_Totais, y = Despesas_Alimentacao)) +
  geom_point(shape = 21, fill = "white", color = "black", size = 3, stroke = 0.5) +
  geom_smooth(method = "lm", color = "lightgreen", se = FALSE) +
  labs(title = "Gráfico de Dispersão com Reta de Regressão",
       x = "Despesas Totais (em Rupias)",
       y = "Despesas com Alimentação (em Rupias)") +
  theme_minimal()

# iii. Conclusões gerais

print("Há uma relação positiva entre as despesas totais e as despesas com alimentação,
      visto que à medida que as despesas totais aumentam, as despesas com alimentação também tendem a aumentar.")

# Análise da homocedasticidade
install.packages("lmtest")
library(lmtest)

ggplot(data.frame(Ajustados = fitted(modelo), Residuos = resid(modelo)), aes(x = Ajustados, y = Residuos)) +
  geom_point(shape = 21, fill = "white", color = "black", size = 3, stroke = 0.5) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "darkgreen") +
  labs(title = "Resíduos vs. Valores Ajustados",
       x = "Valores Ajustados",
       y = "Resíduos") +
  theme_minimal()

# Teste de Breusch-Pagan
bptest(modelo)

print("se o teste de Breusch-Pagan indicar heterocedasticidade (valor p < 0.05),
      precisa ajustar um modelo de regressão linear robusta.")
#iv.
print("Espera-se que as despesas com alimentação aumentem com o aumento das despesas totais (ou renda total). Isso porque,
      com maior renda, os indivíduos têm mais recursos para gastar em alimentação. No entanto, considerando a Lei de Engel,
      a relação pode não ser perfeitamente linear. À medida que a renda aumenta, a proporção de renda gasta em alimentação
      tende a diminuir, pois uma maior parte da renda pode ser destinada a outras categorias de despesas.")


















