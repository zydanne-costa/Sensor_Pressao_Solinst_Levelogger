function data = read_solinst_csv(filename, offset)
    % Lê dados do Levelogger 5 da Solinst
    % filename: nome do arquivo CSV
    % offset: valor usado para calibrar os níveis (ex: 15.064)
    
    if nargin < 2
        error('Você deve fornecer o nome do arquivo e o offset de calibração.');
    end

    % Define opções de importação pulando as 11 primeiras linhas
    opts = detectImportOptions(filename, 'NumHeaderLines', 11);
    opts.SelectedVariableNames = {'Date', 'Time', 'LEVEL', 'TEMPERATURE'};
    opts = setvartype(opts, {'Date', 'Time'}, 'string');
    opts = setvartype(opts, {'LEVEL', 'TEMPERATURE'}, 'double');

    % Lê os dados
    T = readtable(filename, opts);

    % Concatena Date + Time
    dt_raw = strtrim(T.Date + " " + T.Time);

    % Converte para datetime com formatação esperada
    dt = datetime(dt_raw, 'InputFormat', 'M/d/yyyy hh:mm:ss a');

    % Corrige nível aplicando o offset
    level = T.LEVEL / offset;

    % Temperatura
    temp = T.TEMPERATURE;

    % Cria tabela final
    data = table(dt, level, temp, 'VariableNames', {'dt', 'level', 'temperature'});
end
