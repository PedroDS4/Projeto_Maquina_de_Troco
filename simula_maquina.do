vsim work.maquina_de_troco

# Adiciona todos os sinais
add wave *

# Inicializa clock com per�odo de 2ns (1ns alto, 1ns baixo)
force clk 0 0ns, 1 0.015625ns -repeat 0.03125ns

# Inicializa V = 500 (em bin�rio: 111110100)
#force V "0111110100" 0ns

force V "0111111110" 0ns 

force c "111111" 0ns

# Inicializa T com pulso em 3ns
force T 0 0ns, 1 0.0625ns, 0 0.125ns

# Roda simula��o at� 20ns
run 5ns