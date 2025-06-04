from read_solinst import read_solinst_csv

# Lê os dados e aplica o offset
data = read_solinst_csv('SCO_Mar2025.csv', 15.064)

# Mantém só os dados dentro d'água (equivalente a linhas 7 até 889 no MATLAB)
data = data.iloc[6:889]  # índices começam em 0

# Mostra os 5 primeiros valores
print(data.head())
