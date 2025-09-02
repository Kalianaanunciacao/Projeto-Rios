-- Objetivo: Visualizar o peso total e a quantidade total de itens coletados
--           em cada mutirão, identificando o local e a data.
-- Insight: Ajuda a identificar as áreas (cidades/estados) com maior volume de resíduos
--          e a tendência de coleta ao longo do tempo.
SELECT
    m.data_mutirao,
    m.estado,
    m.cidade,
    m.instituicao_organizadora,
    m.peso_total_residuos_kg AS peso_coletado_kg,
    m.quantidade_total_itens AS itens_coletados_total,
    m.tempo_coleta_horas AS tempo_gasto_horas
FROM
    mutiroes m
ORDER BY
    m.data_mutirao DESC, m.estado, m.cidade;

-- Objetivo: Identificar quais tipos de resíduos são mais frequentemente coletados
--           em termos de quantidade total de itens.
-- Insight: Ajuda a compreender a composição da poluição e direcionar campanhas
--          de conscientização e prevenção para os itens mais problemáticos.
SELECT
    tr.nome_residuo AS tipo_de_residuo,
    SUM(cr.quantidade_coletada) AS quantidade_total_coletada
FROM
    coleta_residuos cr
INNER JOIN
    tipos_residuos tr ON cr.id_tipo_residuo = tr.id_tipo_residuo
GROUP BY
    tr.nome_residuo
ORDER BY
    quantidade_total_coletada DESC
LIMIT 10; 

-- Limita aos 10 tipos mais coletados para maior relevância

-- Objetivo: Analisar a distribuição das categorias principais de resíduos
--           (Plástico, Borracha, Madeira) por localidade.
-- Insight: Permite entender se há padrões regionais de poluição por tipo de material.
--          Ex: Alta presença de "Borracha" (pneus, câmaras de ar) pode indicar problemas
--          com descarte industrial ou de veículos.
SELECT
    m.estado,
    m.cidade,
    tr.categoria_principal,
    SUM(cr.quantidade_coletada) AS quantidade_total_coletada
FROM
    coleta_residuos cr
INNER JOIN
    tipos_residuos tr ON cr.id_tipo_residuo = tr.id_tipo_residuo
INNER JOIN
    mutiroes m ON cr.id_mutirao = m.id_mutirao
GROUP BY
    m.estado, m.cidade, tr.categoria_principal
ORDER BY
    m.estado, m.cidade, quantidade_total_coletada DESC;

-- Objetivo: Avaliar o desempenho das diferentes instituições organizadoras
--           em termos de volume de resíduos coletados.
-- Insight: Ajuda a identificar parceiros mais eficazes e a comparar metodologias.
--          Também pode ser usado para reconhecer e incentivar as organizações mais ativas.
SELECT
    m.instituicao_organizadora,
    SUM(m.peso_total_residuos_kg) AS peso_total_instituicao_kg,
    SUM(m.quantidade_total_itens) AS itens_total_instituicao,
    COUNT(m.id_mutirao) AS total_de_mutiroes_organizados
FROM
    mutiroes m
GROUP BY
    m.instituicao_organizadora
ORDER BY
    peso_total_instituicao_kg DESC;
    
    -- Objetivo: Examinar as descrições detalhadas dos itens classificados como 'Outros'
--           para identificar padrões e possíveis novas categorias de resíduos.
-- Insight: Ajuda a refinar a lista de tipos de resíduos e a adaptar as metodologias
--          de coleta e classificação no futuro.
SELECT
    m.data_mutirao,
    m.cidade,
    tr.nome_residuo AS tipo_residuo_geral, -- Será 'Plástico - Outros', 'Borracha - Outros', etc.
    cr.descricao_outros,
    cr.quantidade_coletada
FROM
    coleta_residuos cr
INNER JOIN
    tipos_residuos tr ON cr.id_tipo_residuo = tr.id_tipo_residuo
INNER JOIN
    mutiroes m ON cr.id_mutirao = m.id_mutirao
WHERE
    tr.nome_residuo LIKE '%Outros%' -- Filtra apenas os registros onde a descrição 'Outros' foi usada
    AND cr.descricao_outros IS NOT NULL AND cr.descricao_outros <> ''
ORDER BY
    m.data_mutirao DESC, cr.quantidade_coletada DESC;
    
    -- Objetivo: Analisar a tendência de volume de resíduos coletados ao longo do tempo,
--           agrupando por ano e mês.
-- Insight: Ajuda a identificar sazonalidades na poluição ou no engajamento dos mutirões,
--          e a avaliar o impacto de ações preventivas de longo prazo.
SELECT
    YEAR(m.data_mutirao) AS ano,
    MONTH(m.data_mutirao) AS mes,
    SUM(m.peso_total_residuos_kg) AS peso_total_mensal_kg,
    SUM(m.quantidade_total_itens) AS itens_total_mensal,
    COUNT(m.id_mutirao) AS numero_mutiroes_mensal
FROM
    mutiroes m
GROUP BY
    ano, mes
ORDER BY
    ano ASC, mes ASC;

