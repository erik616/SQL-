-- 1 -- OK

/*
Com base na tabela de “produtos” acima favor inserir um registro na referida 
tabela passando os seguintes valores : cod_prod =170, loj_prod=2, desc_prod=LEITE CONDESADO MOCOCA, 
dt_inclu_prod=30/12/2010 e preço_prod = R$45,40.
*/
INSERT INTO produtos (cod_prod,loj_prod, desc_prod, dt_inclu_prod, preco_prod) VALUES (103, 1, "Nos moscada", 30/12/2010, 40.49);

/*
O Índice da tabela de “produtos é o cód_prod e a loj_prod, com base no referido índice faça a alteração do preço
 do produto para R$95,40, lembrando que o cod_prod =170 e a loj_prod=2:
*/
UPDATE produtos SET preco_prod = 95.90 WHERE cod_prod = 170 AND loj_prod =2 ;

/*
Com base na tabela de “produtos” monte um select trazendo todos os registros da loja 1 e 2:
*/
SELECT * FROM produtos WHERE loj_prod IN (1,2);

/*
Com base na tabela de “produtos” monte um select para trazer a maior e a menor data de inclusão do produto “dt_inclu_prod”:
*/
SELECT MIN(dt_inclu_prod) AS MINDate, MAX(dt_inclu_prod) AS MAXDate FROM produtos;

/*
Com base na tabela de “produtos” monte um select para trazer a quantidade total de registros existentes na tabela de “produtos”:
*/
SELECT COUNT(*) AS 'numero de registros' FROM produtos;

/*
Com base na tabela de “produtos” monte um select para trazer todos os produtos que comecem com a letra “L” na tabela de “produtos”:
*/
SELECT * FROM produtos WHERE desc_prod LIKE "L%";

/*
Com base na tabela de “produtos” monte um select para trazer a soma de todos os preços dos produtos totalizado por loja:
*/
SELECT SUM(preco_prod) AS total, loj_prod AS loja  FROM produtos GROUP BY loj_prod;
/* OU */
SELECT lojas.desc_loj, SUM(produtos.preco_prod) AS total FROM produtos
LEFT JOIN lojas ON produtos.loj_prod = lojas.loj_prod
GROUP BY desc_loj;

/*
Com base na tabela de “produtos” monte um select para trazer a soma de todos os preços dos produtos totalizados por loja que seja maior que R$100.000
*/

SELECT SUM(preco_prod) AS total, loj_prod
FROM produtos
GROUP BY loj_prod
HAVING SUM(preco_prod) > 100000;

/*
Montar um unico select para trazer os seguintes campos: o código da loja do produto, a descrição da loja, código do produto,
a descrição do produto, o preço do produto, a quantidade em estoque do produto. Considere que o código da loja para esta consulta seja igual a 1.
*/
SELECT lojas.loj_prod, lojas.desc_loj, produtos.cod_prod, produtos.desc_prod, produtos.preco_prod, estoque.qtd_prod FROM produtos 
JOIN lojas ON produtos.loj_prod = lojas.loj_prod
JOIN estoque ON produtos.cod_prod = estoque.cod_prod
WHERE produtos.loj_prod = 1;

/*
Observe a estrutura da tabela de estoque e da tabela de produtos, monte um select para trazer todos os produtos que existem na 
tabela de produtos que não existem na tabela de estoque.
*/
SELECT * FROM produtos
WHERE NOT EXISTS (SELECT * FROM estoque WHERE produtos.cod_prod = estoque.cod_prod);

/*
Observe a estrutura da tabela de estoque e da tabela de produtos, monte um select para trazer todos os produtos que existem na tabela de estoque
que não existem na tabela de produtos.
*/
SELECT estoque.cod_prod, estoque.loj_prod,produtos.desc_prod, produtos.preco_prod FROM estoque 
JOIN produtos ON estoque.cod_prod = produtos.cod_prod
WHERE NOT EXISTS (SELECT * FROM produtos WHERE produtos.cod_prod = estoque.cod_prod);








