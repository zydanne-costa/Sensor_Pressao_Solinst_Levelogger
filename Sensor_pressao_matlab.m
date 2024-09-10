%==========================================================================
% SCRIPT DE PROCESSAMENTO DE DADOS DE NIVEL DA AGUA
%--------------------------------------------------------------------------
% Autor: Zydanne Costa
% Data: 09 de setembro de 2024
% Analise de Variacao de Mare - Sensor de Pressao Solinst Levelogger
% Descricao: Este script destina-se ao tratamento e visualizacao de dados 
% adquiridos por um sensor de pressão, com o objetivo de analisar a variacao 
% do nivel da agua (mare). O script realiza a importacao, manipulacao e 
% normalizacao dos dados, bem como a plotagem da variacao do nivel d'agua 
% em funcao do tempo de forma detalhada e clara.
%--------------------------------------------------------------------------
% 
%==========================================================================

clear all; clc;

%% importando dados
path = ('C:\SEU\CAMINHO\AQUI\NomeDoArquivo.csv');
data = readtable(path);
% manipulando dados
data = data(:, 1:3); % excluindo colunas inoperantes
date = string(data{:,1}); % definindo data como string
time = string(data{:,2}); % definindo tempo como string
% a transformacao para string permite a concatenacao no proximo passo:
datetime_str = strcat(date, {' '}, time); % concatenando data + hora
dt = datetime(datetime_str, 'InputFormat', 'MM/dd/yyyy hh:mm:ss a'); % transformando data + hora em "tempo"
% a valor real de nivel (n) precisa ser dividido pela media (m) ou offset do equipamento
% para assim retirar os valores de pressão fora da coluna d'agua
n = data{:,3};
m = mean(data{:,3});
nivel = n/m; 

%% graficos
fig = figure(1); % criar uma fig melhora a manipulacao do grafico
set(fig, 'Position', [30, 400, 900, 600]) % definindo a posicao e o tamano da imagem
plot(dt, nivel, 'k', 'LineWidth', 1.1) % plot(x,y). O 'k' define a cor preta para a linha. 'LineWidth' = Expessura da linha.
title('Variacao do nivel dagua', 'FontName', 'Times New Roman', 'FontSize', 18) % titulo
xlabel('Tempo (dia/mes)', 'FontName', 'Times New Roman', 'FontSize', 18) % rotulo eixo x
ylabel('Nivel (m)', 'Fontname', 'Times New Roman', 'FontSize', 18) % rotulo eixo y
xlim([dt(1) dt(end)]) % limites do eixo x
datetick('x', 'dd/mm', 'keeplimits', 'keepticks') % configuracoes do eixo x
set(gca, 'FontName', 'Times New Roman'); % Define a fonte e o tamanho dos numeros dos eixos
grid minor % grade de fundo minimalista

%% fim do script