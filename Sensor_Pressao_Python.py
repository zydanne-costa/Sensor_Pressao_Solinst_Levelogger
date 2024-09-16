import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Importando dados
path = 'C:/SEU/CAMINHO/AQUI/NomeDoArquivo.csv'
data = pd.read_csv(path)

# Manipulando dados
data = data.iloc[:, :3]  # Excluindo colunas inoperantes
data['datetime'] = pd.to_datetime(data.iloc[:, 0] + ' ' + data.iloc[:, 1], format='%m/%d/%Y %I:%M:%S %p')

# O valor real de nível (n) precisa ser dividido pela média (m) ou offset do equipamento
n = data.iloc[:, 2]
m = np.mean(n)
nivel = n / m

# Criar gráfico
plt.figure(figsize=(12, 8))  # Definindo o tamanho da imagem
plt.plot(data['datetime'], nivel, 'k', linewidth=1.1)  # 'k' define a cor preta para a linha. 'linewidth' define a espessura da linha.
plt.title('Variação do nível d\'água', fontsize=18, fontname='Times New Roman')  # Título
plt.xlabel('Tempo (dia/mês)', fontsize=18, fontname='Times New Roman')  # Rótulo eixo x
plt.ylabel('Nível (m)', fontsize=18, fontname='Times New Roman')  # Rótulo eixo y
plt.xlim([data['datetime'].iloc[0], data['datetime'].iloc[-1]])  # Limites do eixo x
plt.gca().xaxis.set_major_formatter(plt.matplotlib.dates.DateFormatter('%d/%m'))  # Configurações do eixo x
plt.grid(True, which='both', linestyle='--', linewidth=0.5)  # Grade de fundo minimalista
plt.gca().tick_params(axis='x', labelsize=14)  # Configura o tamanho da fonte dos números dos eixos
plt.gca().tick_params(axis='y', labelsize=14)  # Configura o tamanho da fonte dos números dos eixos

plt.show()
