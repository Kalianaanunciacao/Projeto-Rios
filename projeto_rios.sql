-- Tabela de países

CREATE TABLE paises (
    id_pais INT PRIMARY KEY AUTO_INCREMENT,
    nome_pais VARCHAR(100) NOT NULL
    );
    -- Tabela de bacias hidrográficas
CREATE TABLE bacias (
    id_bacia INT PRIMARY KEY AUTO_INCREMENT,
    nome_bacia VARCHAR(100) NOT NULL
);
-- Tabela de classificações ambientais/econômicas
CREATE TABLE classificacoes (
    id_classificacao INT PRIMARY KEY AUTO_INCREMENT,
    descricao_classificacao VARCHAR(100) NOT NULL
);

-- Tabela principal de rios
CREATE TABLE rios (
    id_rio INT PRIMARY KEY AUTO_INCREMENT,
    nome_rio VARCHAR(100) NOT NULL,
    comprimento_km DECIMAL(10,2),
    vazao_media DECIMAL(12,2),
    id_bacia INT,
    id_classificacao INT,
    FOREIGN KEY (id_bacia) REFERENCES bacias(id_bacia),
    FOREIGN KEY (id_classificacao) REFERENCES classificacoes(id_classificacao)
);