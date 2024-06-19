# Atividade 1 - Minicurso de R
# Aula: Caio Jos ́e Fran ̧ca
# Organiza ̧c ̃ao: PET Economia UFPE
# UFPE - 2024.1


# Questão 1:
# Considerando dois conjuntos de dados: um contendo os nomes dos alunos e
# outro com suas respectivas notas, deseja-se imprimir a situa ̧c ̃ao de cada aluno
# em um formato espec ́ıfico. A situa ̧c ̃ao de cada aluno ser ́a determinada com base
# em sua nota, sendo ”Aprovado” para notas maiores que 7,̃"Avaliação Final”
# para notas entre 7 e 3, e ”Reprovado” para notas menores que 3. Imprimir
# Resultado no formato: ”Aluno: []; Situa ̧c ̃ao: []”
# Dica: Utilizar la̧co for

nomes <- c("Olivia Thomas", "William White", "James Moore",
          "Mia Thompson","Charlotte White", "Sophia White", "Mason Hall",
           "Emily Robinson", "Alexander Lopez", "Lily Young", "Jackson Perez",
           "Liam Anderson", "Benjamin Martin", "Lucas Gonzalez", "Henry Allen",
           "Jacob Hernandez", "Logan Martinez", "Isabella Young",
           "Mia Anderson", "Mia Gonzalez", "Benjamin Clark", "Daniel Gonzalez",
           "Jack Martinez", "Ella Wilson", "Aiden Johnson")

notas <- c(8.75, 5.44, 2.89, 7.77, 1.30, 8.01, 1.50, 2.00, 6.90, 7.89,
           6.47, 4.01, 5.30, 7.63, 2.27, 8.34, 7.45, 6.78, 3.45, 8.90, 4.56,
           7.80, 9.50, 2.60, 5.32)
nomes
notas
resultado <- c()

for (i in notas) {
  if(i > 7){
    resultado <- c(resultado, "Aprovado")
  } else if(i > 3){
    resultado <- c(resultado, "Avaliação Final")
  } else{
    resultado <- c(resultado, "Reprovado")
  }
}
resultado <- c(sprintf("Aluno: %s; Situação: %s", nomes[i], resultado))

for (res in resultado) {
  print(res)
}

Quest̃ao 2:

Escreva uma fun ̧c ̃ao que converta temperaturas entre graus Celsius, graus Fahren-
heit e Kelvin. As instru ̧c ̃oes sobre como realizar essas convers ̃oes est ̃ao descritas
abaixo.

(Celsius · 9/5) + 32 = F ahrenheit
Celsius + 273, 15 = Kelvin
(F ahrenheit − 32) · 5/9 + 273, 15 = Kelvin


converter_temp_input <- function() {
  temperatura <- as.numeric(readline(prompt = "Digite apenas o valor da temperatura: "))
  entrada <- readline(prompt = "Digite a unidade atual (se Celsius = C; se Fahrenheit = F e se Kelvin = K): ")
  saida <- readline(prompt = "Digite a unidade que será convertida (C, F ou K): ")
  #chamar a função
  resultado <- converter_temp(temperatura, entrada, saida)
  cat("A temperatura convertida é: ", resultado, "º",saida, sep = "")
}

#&& = AND que confere a segunda condição apenas se a primeira for true
converter_temp <- function(temperatura, entrada, saida){
  if (entrada == "C" && saida == "F"){
    return((temperatura*9/5) + 32)
  } else if (entrada == "C" && saida =="K"){
      return(temperatura + 273.15)
  } else if(entrada == "F" && saida == "C"){
      return((temperatura - 32)*5/9)
  } else if(entrada == "F" && saida == "K"){
      return((temperatura - 32)*5/9 + 273.15)
  }
    else if(entrada == "K" && saida == "C"){
      return((temperatura-273.15))
  } else if(entrada  == "K" && saida == "F"){
      return((temperatura - 273.15)* 9/5 + 32)
  }
    else {
    return ("Unidades de conversão desconhecidas, coloque apenas C, K e F")
  }
   
}
  
converter_temp_input()

# Quest̃ao 3:
# Fa ̧ca um programa que fa ̧ca 5 perguntas para uma pessoa sobre um crime. As
# perguntas s ̃ao:
# 1. ”Telefonou para a v ́ıtima?”
# 2. ”Esteve no local do crime?”
# 3. ”Mora perto da v ́ıtima?”
# 4. ”Devia para a v ́ıtima?”
# 5. ”J ́a trabalhou com a v ́ıtima?”
# O programa deve no final emitir uma classifica ̧c ̃ao sobre a participa ̧c ̃ao da pessoa
# no crime. Se a pessoa responder positivamente a 2 quest ̃oes ela deve ser clas-
# sificada como ”Suspeita”, entre 3 e 4 como ”C ́umplice” e 5 como ”Assassino”.
# Caso contr ́ario, ele ser ́a classificado com ”Inocente”

print("☠️🔪 Para iniciarmos o interrogatório é importante que responda apenas (sim) ou (não).")
telefonou <- tolower(readline(prompt = "1.⚰️ Você telefonou para a vítima? "))
local <- tolower(readline(prompt = "2.⚰️ Você esteve no local do crime? "))
moradia <- tolower(readline(prompt = "3.⚰️ Você mora perto da vítima? "))
divida <- tolower(readline(prompt = "4.⚰️ Você devia para a vítima? "))
trabalho <- tolower(readline(prompt = "5.⚰️ Você trabalhava com a vítima? "))

  
respostas <- c(telefonou, local, moradia, divida, trabalho)
contagem <- sum(respostas == "sim")

if (contagem == 5) {
  print("Assassino 💀")
} else if (contagem >= 3) {
  print("Cúmplice 🪦")
} else if (contagem == 2) {
  print("Suspeita ⛏️")
} else {
  print("Inocente 🌍♥️🫵")
}



