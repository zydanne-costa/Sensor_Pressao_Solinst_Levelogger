import pandas as pd
from datetime import datetime

def read_solinst_csv(filename, offset):
    """
    Lê dados do Levelogger 5 da Solinst em um CSV.
    
    Parâmetros:
    - filename: nome do arquivo CSV
    - offset: valor para calibrar os níveis (ex: 15.064)

    Retorna:
    - DataFrame com colunas: dt (datetime), level (corrigido), temperature
    """

    # Lê pulando as 11 primeiras linhas (metadados)
    df = pd.read_csv(filename, skiprows=11)

    # Concatena 'Date' e 'Time' em um novo campo datetime
    dt_strings = df['Date'].astype(str).str.strip() + ' ' + df['Time'].astype(str).str.strip()

    # Converte para datetime
    df['dt'] = pd.to_datetime(dt_strings, format='%m/%d/%Y %I:%M:%S %p', errors='coerce')

    # Corrige o nível aplicando o offset
    df['level'] = df['LEVEL'] / offset

    # Renomeia temperatura
    df['temperature'] = df['TEMPERATURE']

    # Seleciona apenas as colunas finais
    result = df[['dt', 'level', 'temperature']].copy()

    return result