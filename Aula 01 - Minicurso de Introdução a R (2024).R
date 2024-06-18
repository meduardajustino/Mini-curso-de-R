#---------------------------------------------------
# MINICURSO DE INTRODUÇÃO À PROGRAMAÇÃO EM R (2024)
#                PET Economia UFPE
#                  Caio França
#---------------------------------------------------

print("Hello World")

### Operações Matemáticas
5 + 5  
8 - 4  
9 * 3  
9 / 3  
5**2   
5^2  
225^(1/2)  
sqrt(225)
exp(1)
pi

log(100)
log(2, base = 10)

32 %% 5 # resto
32 %/% 5 # quociente inteiro

### Declaração
a <- 25
print(a)
a

b = 5
print(b)

a / b
c <- a / b
print(c)

7 -> d

remove(d)
ls() # todas as variáveis do ambiente
rm(list = ls())

### Tipos de Variáveis
## Doubles, Integers, Characters e Logical
# Strings/Characters
nome <- 'madu'
sobrenome <- "justino"
print(nome)
print(sobrenome)


typeof(nome)

nome_completo <- paste(nome, sobrenome) #, sep = "-"
nome_completo
frase_1 <- sprintf("Meu nome é %s", nome_completo) #para números é %d

nchar(nome_completo) #números de caracteres, espaço também é contado           
sub("a", "W", nome_completo) #altera apenas o primeiro a    
gsub("a", "W", nome_completo) #altera todos os a 
strsplit(nome_completo, split = "  ")  
toupper(nome_completo) #maiúscula         
tolower(nome_completo) #minuscula

sprintf("A resposta é %s", readline(prompt = "Digite algo: "))

# Doubles/Integers
idade <- 20
typeof(idade)
nota <- 8.75
idade2 <- 19L # o L indica que o número é inteiro
typeof(idade2)
sci_not <- 3.12e15

round(nota, digits = 1)
ceiling(nota)
floor(nota)
as.integer(nota)

# Logical
logico <- TRUE
FALSE


# Operações Lógicas
num <- 10

num == 10
num != 10
num > 10
num >= 10
num < 10
num <= 10
!num == 10

num != 10 & num > 10
num == 10 & num >= 10
num == 10 & num > 10

num != 10 | num > 10
num == 10 | num >= 10
num == 10 | num > 10

### Estruturas de Dados
## Vectors, Lists e Factors
# Vectors
doubles <- c(-5.0, 5.0, -15.0, 35.0, -45.0)
doubles
inteiros <- c(-5L, 5L, 15L, 25L, 35L, 45L)
strings <- c("Minicurso", "de", "R", "PET", "Economia", "UPE")
logicos <- c(FALSE, FALSE, FALSE, TRUE, TRUE, TRUE)

head(strings, n=2)
tail(strings, n=4)
length(strings)
35 %in% doubles #conferir presença de algo no vetor

strings[4]
strings[4:6]
strings[c(2, 4)]

strings[6] <- "UFPE"

strings[7] <- "AULA 1"
strings <- append(strings, "novo")

strings <- strings[-7]

unique(logicos)
sort(doubles) #ordenar de forma crescente e de forma decrescente add o "decreasing =" 

# Vetores Númericos
notas <- c(9.0, 8.5, 4.5, 5.0, 7.5, 8.5, 5.0, 9.0, 9.0)
seq(0, 100, 0.1) # sequência e variação
100:200

sum(notas)
max(notas)
min(notas)
mean(notas)
var(notas)
sd(notas)
summary(notas)

notas[notas < 8]

notas + 1

# Vetores de Strings
nomes <- c("Pedro", "Edson", "Fabio", "Gabriele")

nomes <- paste(nomes, "Aluno UFPE", sep = " - ")
nomes

nomes <- nomes[grepl("a", nomes)] # verifica se há o elemento/caracter no vetor
nomes

numeros <- c(1, 2, 3, 5, "8")
typeof(numeros)

numeros <- as.numeric(numeros)
typeof(numeros)

# Lists
nome <- "Maria"
idade <- 22
notas <- c(10, 8.5, 7, 5, 4.5)
aluno <- list(nome, idade, notas)
str(aluno)

aluno[1] # continua como lista
aluno[[1]] # apenas o valor
aluno[[3]]
aluno[[3]][1]

aluno[2] <- 21

aluno[4] <- "APROVADO"

aluno <- aluno[-4]

names(aluno) <- c("nome", "idade", "notas")

aluno$nome
aluno$notas
aluno$notas[1]

aluno$situacao <- "APROVADO"
aluno$situacao <- NULL

# Fatores
alunos <- c("caio", "caio", "brunna", "lais")
ano <- c(2021, 2023, 2024, 2024)
fator_1 <- factor(alunos)
fator_2 <- factor(ano)

levels(fator_1)
levels(fator_2)

typeof(fator_1)
typeof(fator_2)

as.numeric(fator_1)
as.numeric(fator_2)

fator_1 <- factor(fator_1, levels = c("caio", "brunna", "lais"))
fator_1

levels(fator_1) <- c("Pedro", "Gaby", "Marcelo")
fator_1

summary(fator_1)

### Loops
## For e While
for (variable in vector) {
  
}

for (i in seq(1:10)) {
  
  print(i)
  
}

nomes <- c("Pedro", "Giulia", "Hugo", "Celso", "Mercia")
for (i in nomes) {
  
  print(sprintf("Meu nome é %s", i))
  
}

fibonacci <- c(0, 1)
for (i in seq(3, 20)) {
  fibonacci[i] <- fibonacci[i-1] + fibonacci[i-2]
}
fibonacci

while (condition) {
  
}

j <- 0
while (j < 20) {
  j <- j + 1
  print(j)
}

j <- 0
while (j < 20) {
  j <- j - 1
  print(j)
}
### Condicional
## If, Else e Else If
if (condition){
  
} else if(condition){
  
} else{
  
}
b <- 9
if(b < 10) {
  print("Hello World")
}

if(b > 10) {
  print("Hello World")
} else{
  print("Error")
}

if(b > 10) {
  print("Hello World")
} else if(b == 9){
  print("Try Again")
} else{
  print("Error")
}


aleatoria <- sample(1:20, 1)
chute <- 0
while (chute != aleatoria) {
  chute <- readline(prompt = "Diga um Valor: ")
  chute <- as.numeric(chute)
  if(chute == aleatoria) {
    print("GANHOUU!!!!")
  } else if((chute == aleatoria - 1) | (chute == aleatoria + 1)){
    print("QUASEEE")
  } else{
    print("ERRADO")
  }
}


### Funções
name <- function(variables) {
  
}

# x² - 6x + 5 = 0
(-(-6) + (sqrt((-6)^2 - 4*1*5))) / 2*1
(-(-6) - (sqrt((-6)^2 - 4*1*5))) / 2*1

eq_seg_grau <- function(a, b, c){
  
  x_1 <- (-(b) + (sqrt(((b)^2) - 4*a*c))) / (2*a)
  x_2 <- (-(b) - (sqrt(((b)^2) - 4*a*c))) / (2*a)
  
  print(x_1)
  print(x_2)
}

eq_seg_grau(1, -6, 5)
eq_seg_grau(1, -6, 9)
eq_seg_grau(-1, -8, 9)


notas <- sample(1:10, 200, replace = TRUE)
notas

automacao <- function(...){ # não definir a quantidade de parâmetros
  x <- c(...)
  resultado <- c()
  for (nota in x) {
    if(nota >= 7){
      resultado <- c(resultado, "Aprovado")
    } else if(nota >= 3){
      resultado <- c(resultado, "Prova Final")
    } else{
      resultado <- c(resultado, "Reprovado")
    }
  }
  return(resultado)
}

automacao(notas)
automacao(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

jogo <- function(from = 1, to = 10){
  aleatoria <- sample(from:to, 1)
  chute <- 0
  while (chute != aleatoria) {
    chute <- readline(prompt = "Diga um Valor: ")
    chute <- as.numeric(chute)
    if(chute == aleatoria) {
      print("GANHOUU!!!!")
    } else if((chute == aleatoria - 1) | (chute == aleatoria + 1)){
      print("QUASEEE")
    } else{
      print("ERRADO")
    }
  }
}

jogo(1, 10)


