# Pesquisa_Operacional
Resolvendo problemas e plotando gráficos com RStudio
# MAXIMIZAÇÃO
![Enunciado](./Grafico_funcao_objetivo[MAX_LUCRO].png)
![Enunciado](./Localizacao_Solução_Otima(Maximizacao).png)
![Enunciado](./Gráfico_manuscrito[MAX_LUCRO].jpg)

*Restrições Ativas:* As restrições de Acabamento ($2B+T=100$) e Carpintaria ($B+T=80$) estão sendo usadas em sua totalidade. A demanda de bonecos não é atingida ($20 \le 40$).

# MINIMIZAÇÃO
![Enunciado](./Grafico_funcao_objetivo[MIN_CUSTO].png)
![Enunciado](./Localizacao_Solucao_Otima(Minimizacao).png)
![Enunciado](./Gráfico_manuscrito[MIN_CUSTO].jpg)

*Restrições Ativas:* A restrição de Produção Mínima ($B+T=60$) está ativa, assim como a restrição $B=0$ (Eixo T).

# COMPARAÇÃO
![Enunciado](./Maximizacao_Lucro_vs_Minimizacao_Custo.png)

No primeiro modelo, a produção de Bonecos era priorizada, pois cada unidade gerava R$ 4 de lucro, o dobro dos Trens. A empresa produzia o máximo de bonecos que as restrições permitiam (entre 20 e 40 unidades).

No segundo modelo, o objetivo mudou para minimizar custos. Como o Boneco é significativamente mais caro de produzir (R$ 5) do que o Trem (R$ 3), a estratégia ótima inverteu-se completamente. Para atingir a meta mínima de 60 unidades ao menor custo possível, a empresa foca 100% no produto mais barato, produzindo 0 Bonecos e 60 Trens.
