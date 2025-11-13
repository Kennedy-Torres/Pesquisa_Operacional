# --- Código para desenhar o gráfico da Minimização de Custos ---

# 1. Definir os vértices da NOVA região viável
B_vertices_min <- c(0, 0, 20, 40)
T_vertices_min <- c(60, 80, 60, 20)

# 2. Configurar o gráfico (plot)
plot(NULL, xlim=c(0, 110), ylim=c(0, 110), 
     xlab="Bonecos (B)", ylab="Trens (T)", 
     main="Resolução Gráfica - Minimização de Custos (Pinocchio S.A.)")

# 3. Desenhar a Região Viável
polygon(B_vertices_min, T_vertices_min, 
        col=rgb(0.2, 0.2, 0.2, 0.3), # Cor de preenchimento
        border="black")

# 4. Desenhar as LINHAS de restrição
# R1: 2B + T = 100  (ou T = 100 - 2B)
abline(a=100, b=-2, col="red", lty=2)
# R2: B + T = 80   (ou T = 80 - B)
abline(a=80, b=-1, col="blue", lty=2)
# R3: B = 40
abline(v=40, col="green", lty=2)
# R4 (Nova): B + T = 60 (ou T = 60 - B)
abline(a=60, b=-1, col="orange", lty=2, lwd=2)

# 5. Desenhar a LINHA da Função Objetivo Ótima
# C = 180 (Custo Mínimo) => T = 60 - (5/3)B
abline(a=60, b=-(5/3), col="purple", lty=1, lwd=3)

# 6. Adicionar Legenda 
legend("topright", 
       legend=c("Acabamento (R1)", "Carpintaria (R2)", "Demanda (R3)", 
                "Prod. Mínima (R4)", "Região Viável", "Custo Ótimo (C=180)"),
       col=c("red", "blue", "green", "orange", "grey", "purple"), 
       lty=c(2, 2, 2, 2, 1, 1), 
       lwd=c(1, 1, 1, 2, 10, 3),

       cex = 0.9) # <-- Adicionei 'cex = 0.8' para diminuir o tamanho
