# Sensor_Pressao_Solinst_Levelogger
Essa rotina foi desenvolvida para analisar dados de um sensor de pressão, com foco na variação do nível d'água em um determinado período. A rotina realiza o seguinte processo:

1. Importação dos Dados: Os dados são carregados a partir de um arquivo CSV que contém as colunas de data, hora e pressão. As demais colunas não são relevantes, portanto são excluídas.
   
2. Processamento de Data e Hora: As colunas de data e hora são concatenadas para formar uma única variável de tempo (`datetime`), permitindo a representação precisa do instante de cada medição.

3. Cálculo do Nível Relativo: Os valores de pressão medidos são normalizados pela média dos dados, removendo qualquer offset do equipamento, o que permite obter uma estimativa precisa da variação do nível d'água.

4. Plotagem dos Resultados: Os dados processados são plotados em um gráfico que apresenta a variação do nível d'água ao longo do tempo. O gráfico é configurado para exibir o tempo no eixo `x` no formato `dia/mês` e o nível de água no eixo `y` em metros.

Este script é útil para visualização rápida e clara das variações no nível do mar, permitindo uma análise temporal do comportamento da maré em um local específico.
