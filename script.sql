create database torneio;

use torneio;
CREATE TABLE grupo (
    idGrupo INT PRIMARY KEY AUTO_INCREMENT,
    nome CHAR(1) NOT NULL
);

CREATE TABLE viking (
    idViking INT PRIMARY KEY AUTO_INCREMENT,
    fkGrupo INT,
    nome VARCHAR(45) NOT NULL,
    peso VARCHAR(45),
    idade INT,
    FOREIGN KEY (fkGrupo) REFERENCES grupo(idGrupo)
);


CREATE TABLE etapa (
    idEtapa INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45) NOT NULL
);


CREATE TABLE luta (
    idLuta INT PRIMARY KEY AUTO_INCREMENT,
    fkViking1 INT,
    fkViking2 INT,
    fkGrupoViking INT,
    fkEtapa INT,
    dtLuta DATETIME,
    vencedor INT,
    FOREIGN KEY (fkViking1) REFERENCES viking(idViking),
    FOREIGN KEY (fkViking2) REFERENCES viking(idViking),
    FOREIGN KEY (fkGrupoViking) REFERENCES grupo(idGrupo),
    FOREIGN KEY (fkEtapa) REFERENCES etapa(idEtapa),
    FOREIGN KEY (vencedor) REFERENCES viking(idViking)
);








INSERT INTO grupo (nome) VALUES ('A'), ('B'), ('C'), ('D');


INSERT INTO viking (fkGrupo, nome, peso, idade) VALUES
(1, 'Ragnar', '90kg', 30),
(1, 'Lagertha', '70kg', 28),
(1, 'Bjorn', '85kg', 25),
(1, 'Floki', '75kg', 35),
(2, 'Ivar', '65kg', 27),
(2, 'Ubbe', '80kg', 29),
(2, 'Hvitserk', '78kg', 26),
(2, 'Sigurd', '72kg', 24),
(3, 'Harald', '88kg', 32),
(3, 'Halfdan', '82kg', 31),
(3, 'Olaf', '95kg', 40),
(3, 'Eyvind', '70kg', 34),
(4, 'Eirik', '92kg', 36),
(4, 'Torvi', '68kg', 29),
(4, 'Astrid', '65kg', 27),
(4, 'Gunnar', '85kg', 33);


INSERT INTO etapa (descricao) VALUES
('Primeira Fase'),
('Quartas de Final'),
('Semifinal'),
('Final');



-- Grupo A
INSERT INTO luta (fkViking1, fkViking2, fkGrupoViking, fkEtapa, dtLuta, vencedor) VALUES
(1, 2, 1, 1, '2024-06-01 10:00:00', 1), -- Ragnar vs Lagertha, vencedor: Ragnar (1)
(1, 3, 1, 1, '2024-06-01 11:00:00', 1), -- Ragnar vs Bjorn, vencedor: Ragnar (1)
(1, 4, 1, 1, '2024-06-01 12:00:00', 1), -- Ragnar vs Floki, vencedor: Ragnar (1)
(2, 3, 1, 1, '2024-06-01 13:00:00', 2), -- Lagertha vs Bjorn, vencedor: Lagertha (2)
(2, 4, 1, 1, '2024-06-01 14:00:00', 2), -- Lagertha vs Floki, vencedor: Lagertha (2)
(3, 4, 1, 1, '2024-06-01 15:00:00', 3); -- Bjorn vs Floki, vencedor: Bjorn (3)



-- Grupo B
INSERT INTO luta (fkViking1, fkViking2, fkGrupoViking, fkEtapa, dtLuta, vencedor) VALUES
(5, 6, 2, 1, '2024-06-02 10:00:00', 5), -- Ivar vs Ubbe, vencedor: Ivar (5)
(5, 7, 2, 1, '2024-06-02 11:00:00', 5), -- Ivar vs Hvitserk, vencedor: Ivar (5)
(5, 8, 2, 1, '2024-06-02 12:00:00', 5), -- Ivar vs Sigurd, vencedor: Ivar (5)
(6, 7, 2, 1, '2024-06-02 13:00:00', 6), -- Ubbe vs Hvitserk, vencedor: Ubbe (6)
(6, 8, 2, 1, '2024-06-02 14:00:00', 6), -- Ubbe vs Sigurd, vencedor: Ubbe (6)
(7, 8, 2, 1, '2024-06-02 15:00:00', 7); -- Hvitserk vs Sigurd, vencedor: Hvitserk (7)


-- Grupo C
INSERT INTO luta (fkViking1, fkViking2, fkGrupoViking, fkEtapa, dtLuta, vencedor) VALUES
(9, 10, 3, 1, '2024-06-03 10:00:00', 9), -- Harald vs Halfdan, vencedor: Harald (9)
(9, 11, 3, 1, '2024-06-03 11:00:00', 9), -- Harald vs Olaf, vencedor: Harald (9)
(9, 12, 3, 1, '2024-06-03 12:00:00', 9), -- Harald vs Eyvind, vencedor: Harald (9)
(10, 11, 3, 1, '2024-06-03 13:00:00', 10), -- Halfdan vs Olaf, vencedor: Halfdan (10)
(10, 12, 3, 1, '2024-06-03 14:00:00', 10), -- Halfdan vs Eyvind, vencedor: Halfdan (10)
(11, 12, 3, 1, '2024-06-03 15:00:00', 11); -- Olaf vs Eyvind, vencedor: Olaf (11)


-- Grupo D
INSERT INTO luta (fkViking1, fkViking2, fkGrupoViking, fkEtapa, dtLuta, vencedor) VALUES
(13, 14, 4, 1, '2024-06-04 10:00:00', 13), -- Eirik vs Torvi, vencedor: Eirik (13)
(13, 15, 4, 1, '2024-06-04 11:00:00', 13), -- Eirik vs Astrid, vencedor: Eirik (13)
(13, 16, 4, 1, '2024-06-04 12:00:00', 13), -- Eirik vs Gunnar, vencedor: Eirik (13)
(14, 15, 4, 1, '2024-06-04 13:00:00', 14), -- Torvi vs Astrid, vencedor: Torvi (14)
(14, 16, 4, 1, '2024-06-04 14:00:00', 14), -- Torvi vs Gunnar, vencedor: Torvi (14)
(15, 16, 4, 1, '2024-06-04 15:00:00', 15); -- Astrid vs Gunnar, vencedor: Astrid (15)


-- Distribuição dos Quartos de Final
 -- Cada grupo enviará dois vikings para as quartas de final. Suponhamos a seguinte distribuição:

-- Grupo A: 1º Ragnar (idViking 1), 2º Lagertha (idViking 2)
-- Grupo B: 1º Ivar (idViking 5), 2º Ubbe (idViking 6)
-- Grupo C: 1º Harald (idViking 9), 2º Halfdan (idViking 10)
-- Grupo D: 1º Eirik (idViking 13), 2º Torvi (idViking 14)
-- Organização das Lutas das Quartas de Final
-- Para as quartas de final, geralmente se faz cruzamentos entre os vencedores e vice-campeões de grupos diferentes. Vamos criar os confrontos:

-- Vencedor do Grupo A (Ragnar) vs Vice do Grupo B (Ubbe)
-- Vencedor do Grupo B (Ivar) vs Vice do Grupo A (Lagertha)
-- Vencedor do Grupo C (Harald) vs Vice do Grupo D (Torvi)
-- Vencedor do Grupo D (Eirik) vs Vice do Grupo C (Halfdan)

-- Quartas de Final
INSERT INTO luta (fkViking1, fkViking2, fkGrupoViking, fkEtapa, dtLuta, vencedor) VALUES
-- Ragnar vs Ubbe
(1, 6, NULL, 2, '2024-06-10 10:00:00', 1), -- Supondo que Ragnar (idViking 1) vence

-- Ivar vs Lagertha
(5, 2, NULL, 2, '2024-06-10 11:00:00', 5), -- Supondo que Ivar (idViking 5) vence

-- Harald vs Torvi
(9, 14, NULL, 2, '2024-06-10 12:00:00', 9), -- Supondo que Harald (idViking 9) vence

-- Eirik vs Halfdan
(13, 10, NULL, 2, '2024-06-10 13:00:00', 13); -- Supondo que Eirik (idViking 13) vence

-- Semifinais
INSERT INTO luta (fkViking1, fkViking2, fkGrupoViking, fkEtapa, dtLuta, vencedor) VALUES
-- Ragnar vs Harald
(1, 9, NULL, 3, '2024-06-17 10:00:00', 1), -- Supondo que Ragnar (idViking 1) vence

-- Ivar vs Eirik
(5, 13, NULL, 3, '2024-06-17 11:00:00', 5); -- Supondo que Ivar (idViking 5) vence


-- Final
INSERT INTO luta (fkViking1, fkViking2, fkGrupoViking, fkEtapa, dtLuta, vencedor) VALUES
-- Ragnar vs Ivar
(1, 5, NULL, 4, '2024-06-24 10:00:00', 1); -- Supondo que Ragnar (idViking 1) vence





-- 1. Qual o nome dos vikings do grupo A?

SELECT nome FROM viking WHERE fkGrupo = 1;
-- 2. Qual o nome dos vikings do grupo B ordenados em ordem alfabética?

SELECT nome FROM viking WHERE fkGrupo = 2 ORDER BY nome ASC;
-- 3. Qual o nome dos vikings do grupo C cujo nome começa com 'H'?

SELECT nome FROM viking WHERE fkGrupo = 3 AND nome LIKE 'H%';
-- 4. Liste os nomes dos vikings do grupo D em ordem decrescente.

SELECT nome FROM viking WHERE fkGrupo = 4 ORDER BY nome DESC;
-- 5. Qual o nome dos vikings do grupo A cujo nome contém a letra 'o'?

SELECT nome FROM viking WHERE fkGrupo = 1 AND nome LIKE '%o%';
-- 6. Qual o nome dos vikings do grupo B cujo nome termina com 'k'?

SELECT nome FROM viking WHERE fkGrupo = 2 AND nome LIKE '%k';
-- 7. Liste os vikings de todos os grupos ordenados pelo idViking.

SELECT nome FROM viking ORDER BY idViking ASC;
-- 8. Liste os vikings do grupo C cujo nome tenha exatamente 6 caracteres.

SELECT nome FROM viking WHERE fkGrupo = 3 AND LENGTH(nome) = 6;
-- 9. Liste todos os vikings cujo nome comece com 'R' ou 'L'.

SELECT nome FROM viking WHERE nome LIKE 'R%' OR nome LIKE 'L%';
-- 10. Qual o nome dos vikings do grupo D cujo nome tenha mais de 5 caracteres?

SELECT nome FROM viking WHERE fkGrupo = 4 AND LENGTH(nome) > 5;
-- 11. Liste os nomes dos vikings do grupo A em ordem crescente pelo idViking.

SELECT nome FROM viking WHERE fkGrupo = 1 ORDER BY idViking ASC;
-- 12. Qual o nome dos vikings do grupo B cujo nome não contém a letra 'i'?

SELECT nome FROM viking WHERE fkGrupo = 2 AND nome NOT LIKE '%i%';
-- 13. Liste os nomes dos vikings cujo nome tenha menos de 5 caracteres.

SELECT nome FROM viking WHERE LENGTH(nome) < 5;
-- 14. Qual o nome dos vikings do grupo C ordenados pelo nome em ordem decrescente?

SELECT nome FROM viking WHERE fkGrupo = 3 ORDER BY nome DESC;
-- 15. Liste os nomes dos vikings cujo nome contenha a letra 'a' em qualquer posição.

SELECT nome FROM viking WHERE nome LIKE '%a%';



-- Desafios Médios
-- 1. Quantos vikings há em cada grupo?

SELECT fkGrupo, COUNT(*) AS total_vikings FROM viking GROUP BY fkGrupo;
-- 2. Qual o nome e o grupo dos vikings que participaram da primeira luta da fase 1?


SELECT v.nome, g.nome AS grupo
FROM luta l
JOIN viking v ON l.fkViking1 = v.idViking
JOIN grupo g ON v.fkGrupo = g.idGrupo
WHERE l.fkEtapa = 1 AND l.dtLuta = '2024-06-01 10:00:00';
-- 3. Qual a média de lutas vencidas por cada viking?


SELECT v.nome, COUNT(l.idLuta) AS total_vitorias
FROM luta l
JOIN viking v ON l.vencedor = v.idViking
GROUP BY v.idViking, v.nome;
-- 4. Liste o nome dos grupos e o número total de vikings em cada um.

SELECT g.nome, COUNT(v.idViking) AS total_vikings
FROM grupo g
JOIN viking v ON g.idGrupo = v.fkGrupo
GROUP BY g.idGrupo, g.nome;
-- 5. Qual o maior número de vitórias de um viking?

SELECT v.nome, COUNT(l.idLuta) AS total_vitorias
FROM luta l
JOIN viking v ON l.vencedor = v.idViking
GROUP BY v.idViking, v.nome
ORDER BY total_vitorias DESC
LIMIT 1;
-- 6. Liste o nome dos vikings e a quantidade de lutas que eles participaram.

SELECT v.nome, COUNT(l.idLuta) AS total_lutas
FROM luta l
JOIN viking v ON l.fkViking1 = v.idViking OR l.fkViking2 = v.idViking
GROUP BY v.idViking, v.nome;
-- 7. Qual a média de lutas que cada viking participou?

SELECT AVG(total_lutas) AS media_lutas
FROM (
    SELECT v.idViking, COUNT(l.idLuta) AS total_lutas
    FROM luta l
    JOIN viking v ON l.fkViking1 = v.idViking OR l.fkViking2 = v.idViking
    GROUP BY v.idViking
) AS subquery;
-- 8. Liste os nomes dos vikings que participaram de mais de 2 lutas.

SELECT v.nome
FROM luta l
JOIN viking v ON l.fkViking1 = v.idViking OR l.fkViking2 = v.idViking
GROUP BY v.idViking, v.nome
HAVING COUNT(l.idLuta) > 2;
-- 9. Liste os nomes dos vikings que nunca venceram uma luta.

SELECT nome
FROM viking
WHERE idViking NOT IN (SELECT vencedor FROM luta);
--  10. Liste os nomes dos vikings e a quantidade de lutas que venceram, ordenados pelo número de vitórias.

SELECT v.nome, COUNT(l.idLuta) AS total_vitorias
FROM luta l
JOIN viking v ON l.vencedor = v.idViking
GROUP BY v.idViking, v.nome
ORDER BY total_vitorias DESC;

-- Desafios Difíceis
-- 1. Liste os nomes dos vikings que venceram lutas em cada etapa, ordenados pelo número de vitórias.

SELECT v.nome, l.fkEtapa, COUNT(l.idLuta) AS total_vitorias
FROM luta l
JOIN viking v ON l.vencedor = v.idViking
GROUP BY v.idViking, v.nome, l.fkEtapa
ORDER BY total_vitorias DESC;
-- 2. Liste os nomes dos vikings e a quantidade total de lutas que participaram e venceram.


SELECT v.nome, COUNT(DISTINCT l.idLuta) AS total_lutas, COUNT(DISTINCT CASE WHEN l.vencedor = v.idViking THEN l.idLuta END) AS total_vitorias
FROM luta l
JOIN viking v ON l.fkViking1 = v.idViking OR l.fkViking2 = v.idViking
GROUP BY v.idViking, v.nome;
-- 3. Qual o nome do grupo com mais vitórias totais?

SELECT g.nome, COUNT(l.idLuta) AS total_vitorias
FROM luta l
JOIN viking v ON l.vencedor = v.idViking
JOIN grupo g ON v.fkGrupo = g.idGrupo
GROUP BY g.idGrupo, g.nome
ORDER BY total_vitorias DESC
LIMIT 1;
-- 4. Liste os nomes dos vikings que participaram de todas as etapas.

SELECT v.nome
FROM viking v
WHERE NOT EXISTS (
    SELECT 1
    FROM etapa e
    WHERE NOT EXISTS (
        SELECT 1
        FROM luta l
        WHERE (l.fkViking1 = v.idViking OR l.fkViking2 = v.idViking) AND l.fkEtapa = e.idEtapa
    )
);
-- 5. Liste os nomes dos vikings e a quantidade total de lutas que participaram, venceram e a média de vitórias por etapa.

SELECT v.nome, 
       COUNT(DISTINCT l.idLuta) AS total_lutas, 
       COUNT(DISTINCT CASE WHEN l.vencedor = v.idViking THEN l.idLuta END) AS total_vitorias,
       AVG(CASE WHEN l.vencedor = v.idViking THEN 1 ELSE 0 END) AS media_vitorias_por_etapa
FROM luta l
JOIN viking v ON l.fkViking1 = v.idViking OR l.fkViking2 = v.idViking
GROUP BY v.idViking, v.nome;

