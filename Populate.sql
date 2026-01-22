USE MonitoramentoConsumoDeAgua;

-- ==============================================================================
-- 1. ENDEREÇOS E IMÓVEIS
-- Gerando IDs para Endereço e Imóvel com sua função gerar_id
-- ==============================================================================

-- 1.1 Gerar IDs para os Endereços
SET @id_end1 = gerar_id('END', 10);
SET @id_end2 = gerar_id('END', 10);
SET @id_end3 = gerar_id('END', 10);

-- 1.2 Inserir Endereços (Agora com o ID gerado)
INSERT INTO Endereco (cod_endereco, cep, rua, bairro, cidade, estado) VALUES
(@id_end1, '01001000', 'Praça da Sé', 'Sé', 'São Paulo', 'SP'),
(@id_end2, '20040002', 'Rua da Assembleia', 'Centro', 'Rio de Janeiro', 'RJ'),
(@id_end3, '30140071', 'Rua dos Aimorés', 'Funcionários', 'Belo Horizonte', 'MG');

-- 1.3 Gerar IDs para os Imóveis
SET @id_imovel1 = gerar_id('IMO', 10);
SET @id_imovel2 = gerar_id('IMO', 10);
SET @id_imovel3 = gerar_id('IMO', 10);

-- 1.4 Inserir Imóveis
-- ATENÇÃO: A coluna da FK agora é 'cod_endereco' e passamos a variável @id_endX
INSERT INTO Imovel (cod_imovel, tipo_imovel, cod_endereco) VALUES
(@id_imovel1, 'Residencial', @id_end1),
(@id_imovel2, 'Comercial', @id_end2),
(@id_imovel3, 'Industrial', @id_end3);

-- ==============================================================================
-- 2. HIDRÔMETROS
-- ==============================================================================
INSERT INTO Hidrometro (num_serie_hidrometro, marca, modelo) VALUES
('HIDRO_A100', 'SabespTech', 'Digital v1'),
('HIDRO_B200', 'AquaMeasure', 'Analógico'),
('HIDRO_C300', 'FlowMaster', 'Industrial X');

-- ==============================================================================
-- 3. USUÁRIOS
-- ==============================================================================

SET @id_user1 = gerar_id('USR', 10);
SET @id_user2 = gerar_id('USR', 10);
SET @id_user3 = gerar_id('USR', 10);

INSERT INTO Usuario (cod_usuario, nome, senha, email, tipo_p) VALUES
(@id_user1, 'Carlos Silva', 'senha123', 'carlos@email.com', 'FISICA'),
(@id_user2, 'Padaria Central', 'paoquente', 'contato@padaria.com', 'JURIDICA'),
(@id_user3, 'Ana Souza', 'ana123', 'ana@email.com', 'FISICA');

INSERT INTO Pessoa_Fisica (cod_usuario, cpf, data_nasc) VALUES
(@id_user1, '12345678901', '1980-01-01'),
(@id_user3, '98765432100', '1995-05-20');

INSERT INTO Pessoa_Juridica (cod_usuario, cnpj, razao_social) VALUES
(@id_user2, '12345678000199', 'Padaria Central Ltda');

-- Associando ao grupo Cliente (ID 2)
INSERT INTO Grupos_Usuarios (cod_usuario, cod_grupo) VALUES 
(@id_user1, 2), (@id_user2, 2), (@id_user3, 2);

-- ==============================================================================
-- 4. CONTRATOS
-- ==============================================================================

CALL criar_contrato(@id_user1, @id_imovel1, 'HIDRO_A100', NOW(), 'ATIVO');
CALL criar_contrato(@id_user2, @id_imovel2, 'HIDRO_B200', NOW(), 'ATIVO');
CALL criar_contrato(@id_user3, @id_imovel3, 'HIDRO_C300', NOW(), 'ATIVO');

-- ==============================================================================
-- 5. LEITURAS E TESTE DE TRIGGERS
-- ==============================================================================

-- Leitura Normal
INSERT INTO Leitura (cod_leitura, valor_medido, data_hora_leitura, num_serie_hidrometro)
VALUES (gerar_id('L', 15), 10.5, DATE_SUB(NOW(), INTERVAL 2 MONTH), 'HIDRO_A100');

-- Leitura Normal
INSERT INTO Leitura (cod_leitura, valor_medido, data_hora_leitura, num_serie_hidrometro)
VALUES (gerar_id('L', 15), 12.0, DATE_SUB(NOW(), INTERVAL 1 MONTH), 'HIDRO_A100');

-- !!! GATILHO DE ALERTA: Consumo Alto (> 500) !!!
INSERT INTO Leitura (cod_leitura, valor_medido, data_hora_leitura, num_serie_hidrometro)
VALUES (gerar_id('L', 15), 600.0, NOW(), 'HIDRO_C300');

-- !!! GATILHO DE ALERTA: Valor Inválido (< 0) !!!
INSERT INTO Leitura (cod_leitura, valor_medido, data_hora_leitura, num_serie_hidrometro)
VALUES (gerar_id('L', 15), -5.0, NOW(), 'HIDRO_B200');

-- ==============================================================================
-- 6. TÉCNICO MASTER
-- ==============================================================================
SET @id_tec := gerar_id('U', 10);

INSERT INTO Usuario (cod_usuario, nome, senha, email, tipo_p)
VALUES (@id_tec, 'Tecnico Master', '$2a$10$yQKq4Y3cuwvFyGqgZnYcBOuJkQ4gvz3wJx6ywOqVvJh3HrDyc.0yS', 'tecnico@agua.com', 'FISICA');

INSERT INTO Pessoa_Fisica (cod_usuario, cpf, data_nasc)
VALUES (@id_tec, '00000000000', '1990-01-01');

INSERT INTO Grupos_Usuarios (cod_usuario, cod_grupo)
VALUES (@id_tec, 1);