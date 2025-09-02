INSERT INTO mutiroes (data_mutirao, estado, cidade, instituicao_organizadora, peso_total_residuos_kg, quantidade_total_itens, tempo_coleta_horas) VALUES
('2024-06-15', 'SP', 'São Paulo', 'Voluntários do Tietê', 150.50, 1200, 6.0),
('2024-06-20', 'RJ', 'Rio de Janeiro', 'Guardiões da Baía', 80.25, 800, 4.0),
('2024-06-22', 'MG', 'Belo Horizonte', 'Limpa Minas', 200.00, 1500, 7.5);

-- -----------------------------------------------------------------------------
-- Inserção de Dados na Tabela 'coleta_residuos'
-- Esta seção registra a quantidade de cada tipo de resíduo coletado em mutirões específicos.
-- Usamos subconsultas (SELECT id_tipo_residuo FROM tipos_residuos WHERE nome_residuo = '...')
-- para obter os IDs dos tipos de resíduos de forma segura e legível.
-- Assumimos que os 'id_mutirao' são 1, 2 e 3, respectivamente, para os mutirões inseridos acima.
-- -----------------------------------------------------------------------------

-- Dados de coleta para o Mutirão 1 (São Paulo):
INSERT INTO coleta_residuos (id_mutirao, id_tipo_residuo, quantidade_coletada, descricao_outros) VALUES
(1, (SELECT id_tipo_residuo FROM tipos_residuos WHERE nome_residuo = 'Plástico (total)'), 700, NULL),
(1, (SELECT id_tipo_residuo FROM tipos_residuos WHERE nome_residuo = 'Garrafas PET'), 450, NULL),
(1, (SELECT id_tipo_residuo FROM tipos_residuos WHERE nome_residuo = 'Sacos e sacolas'), 200, NULL),
(1, (SELECT id_tipo_residuo FROM tipos_residuos WHERE nome_residuo = 'Borracha (total)'), 100, NULL),
(1, (SELECT id_tipo_residuo FROM tipos_residuos WHERE nome_residuo = 'Plástico - Outros'), 50, 'Brinquedos quebrados, peças diversas');

-- Dados de coleta para o Mutirão 2 (Rio de Janeiro):
INSERT INTO coleta_residuos (id_mutirao, id_tipo_residuo, quantidade_coletada, descricao_outros) VALUES
(2, (SELECT id_tipo_residuo FROM tipos_residuos WHERE nome_residuo = 'Plástico (total)'), 400, NULL),
(2, (SELECT id_tipo_residuo FROM tipos_residuos WHERE nome_residuo = 'Tampas/lacres/argolas de garrafa'), 150, NULL),
(2, (SELECT id_tipo_residuo FROM tipos_residuos WHERE nome_residuo = 'Borracha (total)'), 80, NULL),
(2, (SELECT id_tipo_residuo FROM tipos_residuos WHERE nome_residuo = 'Chinelos/sandálias'), 50, NULL);

-- Dados de coleta para o Mutirão 3 (Belo Horizonte):
INSERT INTO coleta_residuos (id_mutirao, id_tipo_residuo, quantidade_coletada, descricao_outros) VALUES
(3, (SELECT id_tipo_residuo FROM tipos_residuos WHERE nome_residuo = 'Plástico (total)'), 900, NULL),
(3, (SELECT id_tipo_residuo FROM tipos_residuos WHERE nome_residuo = 'Isqueiros'), 100, NULL),
(3, (SELECT id_tipo_residuo FROM tipos_residuos WHERE nome_residuo = 'Madeira (total)'), 300, NULL),
(3, (SELECT id_tipo_residuo FROM tipos_residuos WHERE nome_residuo = 'Espetos/varas'), 150, NULL),
(3, (SELECT id_tipo_residuo FROM tipos_residuos WHERE nome_residuo = 'Borracha - Outros'), 50, 'Mangueiras velhas, vedantes');
--
SELECT * FROM mutiroes;
-- Voluntários
INSERT INTO voluntarios (nome_voluntario, email, telefone) VALUES
('Ana Ribeiro', 'ana@email.com', '11999999999'),
('Carlos Lima', 'carlos@email.com', '21988888888'),
('Fernanda Silva', 'fernanda@email.com', '31977777777');

--
-- Participações
INSERT INTO participacoes_voluntarios (id_mutirao, id_voluntario, horas_participadas) VALUES
(1, 1, 6.0),
(1, 2, 5.5),
(2, 2, 4.0),
(3, 3, 7.5);

--
-- Equipamentos
INSERT INTO equipamentos_utilizados (id_mutirao, nome_equipamento, quantidade) VALUES
(1, 'Luvas', 30),
(1, 'Sacos de lixo', 50),
(2, 'Pinças de coleta', 10),
(3, 'Cestas de triagem', 5);

select * from voluntarios;