-- Atividade para Casa - ORDER BY, GROUP BY e Funções de Agregação

-- Parte 1 - ORDER BY

-- Questão 1
-- Lista os produtos em ordem alfabética pelo nome.
SELECT *
FROM produto
ORDER BY nome;

-- Questão 2
-- Lista os produtos começando pelo mais barato.
SELECT *
FROM produto
ORDER BY preco ASC;

-- Questão 3
-- Lista os produtos começando pelo mais caro.
SELECT *
FROM produto
ORDER BY preco DESC;

-- Questão 4
-- Lista os produtos começando pelos que têm mais unidades em estoque.
SELECT *
FROM produto
ORDER BY estoque DESC;

-- Questão 5
-- Traz só os celulares, do mais caro pro mais barato.
SELECT *
FROM produto
WHERE categoria = 'Celular'
ORDER BY preco DESC;


-- Parte 2 - Funções de agregação

-- Questão 6
-- Conta quantos produtos tem cadastrados.
SELECT COUNT(*) AS total_produtos
FROM produto;

-- Questão 7
-- Calcula a média de preço dos produtos.
SELECT ROUND(AVG(preco), 2) AS preco_medio
FROM produto;

-- Questão 8
-- Soma todas as unidades que tem no estoque.
SELECT SUM(estoque) AS estoque_total
FROM produto;

-- Questão 9
-- Mostra o preço do produto mais caro.
SELECT MAX(preco) AS maior_preco
FROM produto;

-- Questão 10
-- Mostra o preço do produto mais barato.
SELECT MIN(preco) AS menor_preco
FROM produto;


-- Parte 3 - GROUP BY

-- Questão 11
-- Mostra quantos produtos tem em cada categoria.
SELECT categoria, COUNT(*) AS quantidade
FROM produto
GROUP BY categoria;

-- Questão 12
-- Mostra quantos produtos cada marca tem.
SELECT marca, COUNT(*) AS quantidade
FROM produto
GROUP BY marca;

-- Questão 13
-- Mostra a média de preço de cada categoria.
SELECT categoria, ROUND(AVG(preco), 2) AS preco_medio
FROM produto
GROUP BY categoria;

-- Questão 14
-- Mostra o produto mais caro de cada categoria (só o preço).
SELECT categoria, MAX(preco) AS maior_preco
FROM produto
GROUP BY categoria;

-- Questão 15
-- Mostra o produto mais barato de cada categoria (só o preço).
SELECT categoria, MIN(preco) AS menor_preco
FROM produto
GROUP BY categoria;

-- Questão 16
-- Mostra quantas unidades tem em estoque de cada categoria.
SELECT categoria, SUM(estoque) AS estoque_total
FROM produto
GROUP BY categoria;


-- Parte 4 - Desafios

-- Questão 17
-- Para cada categoria, mostra quantos produtos tem e a média de preço.
SELECT categoria,
       COUNT(*) AS quantidade,
       ROUND(AVG(preco), 2) AS preco_medio
FROM produto
GROUP BY categoria;

-- Questão 18
-- Para cada marca, mostra quantos produtos tem e quanto tem no estoque.
SELECT marca,
       COUNT(*) AS quantidade,
       SUM(estoque) AS estoque_total
FROM produto
GROUP BY marca;

-- Questão 19
-- Para cada categoria, mostra o menor preço, o maior e a média.
SELECT categoria,
       MIN(preco) AS menor_preco,
       MAX(preco) AS maior_preco,
       ROUND(AVG(preco), 2) AS preco_medio
FROM produto
GROUP BY categoria;

-- Questão 20
-- Resumo de cada categoria, com as categorias de média mais alta aparecendo primeiro.
SELECT categoria,
       COUNT(*) AS quantidade,
       SUM(estoque) AS estoque_total,
       ROUND(AVG(preco), 2) AS preco_medio,
       MAX(preco) AS maior_preco,
       MIN(preco) AS menor_preco
FROM produto
GROUP BY categoria
ORDER BY preco_medio DESC;
