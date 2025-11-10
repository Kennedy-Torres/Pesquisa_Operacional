# Se você não tiver o pacote, instale-o primeiro com:
#install.packages("lpSolve")

# Carrega a biblioteca
library(lpSolve)

# 1. Coeficientes da Função Objetivo (Z = 4B + 2T)
f.obj <- c(4, 2)

# 2. Matriz de Restrições (cada linha é uma restrição)
#    (Acabamento: 2B + 1T)
#    (Carpintaria: 1B + 1T)
#    (Demanda:     1B + 0T)
f.con <- matrix(c(2, 1,
                  1, 1,
                  1, 0), nrow = 3, byrow = TRUE)

# 3. Direções das Restrições (todas são "menor ou igual a")
f.dir <- c("<=",
           "<=",
           "<=")

# 4. Lado Direito (Recursos disponíveis)
#    (100h de Acabamento)
#    (80h de Carpintaria)
#    (40 Bonecos)
f.rhs <- c(100,
           80,
           40)

# 5. Resolve o problema (maximização)
#    Usando os mesmos nomes de argumentos da sua imagem de exemplo
solucao <- lp(direction = "max",
              objective.in = f.obj,
              const.mat = f.con,
              const.dir = f.dir,
              const.rhs = f.rhs,
              compute.sens = TRUE) # compute.sens = TRUE calcula a análise de sensibilidade

# 6. Exibe os resultados
print(paste("Lucro Máximo (Z):", solucao$objval))
print(paste("Quantidade de Bonecos (B):", solucao$solution[1]))
print(paste("Quantidade de Trens (T):", solucao$solution[2]))




# --- Código para desenhar o gráfico da Região Viável ---

# 1. Definir os vértices da região viável (que já encontramos)
B_vertices <- c(0, 40, 40, 20, 0)
T_vertices <- c(0, 0, 20, 60, 80)

# 2. Configurar o gráfico (plot)
# Definimos os limites dos eixos X (B) e Y (T)
plot(NULL, xlim=c(0, 110), ylim=c(0, 110), 
     xlab="Bonecos (B)", ylab="Trens (T)", 
     main="Resolução Gráfica - Pinocchio S.A.")

# 3. Desenhar a Região Viável
# A função polygon() usa os vértices para desenhar o polígono
polygon(B_vertices, T_vertices, 
        col=rgb(0.2, 0.2, 0.2, 0.3), # Cor de preenchimento (cinza transparente)
        border="black") # Cor da borda

# 4. Desenhar as LINHAS de restrição
# R1: 2B + T = 100  (ou T = 100 - 2B)
abline(a=100, b=-2, col="red", lty=2)
# R2: B + T = 80   (ou T = 80 - B)
abline(a=80, b=-1, col="blue", lty=2)
# R3: B = 40
abline(v=40, col="green", lty=2)

# 5. Desenhar a LINHA da Função Objetivo Ótima
# Z = 200 (Lucro Máximo) => 200 = 4B + 2T => T = 100 - 2B
# (Note que ela é PARALELA à restrição de Acabamento!)
abline(a=100, b=-2, col="purple", lty=1, lwd=3) # lwd=3 deixa a linha mais grossa

# 6. Adicionar Legenda
legend("topright", 
       legend=c("Acabamento (R1)", "Carpintaria (R2)", "Demanda (R3)", 
                "Região Viável", "Lucro Ótimo (Z=200)"),
       col=c("red", "blue", "green", "grey", "purple"), 
       lty=c(2, 2, 2, 1, 1), 
       lwd=c(1, 1, 1, 10, 3))