
SELECT CEILING(12.333223) -- maior inteiro perto desse numero 

SELECT FLOOR(12.333223) -- menor inteiro perto desse numero 

SELECT RAND() -- gera num aleatorio

SELECT ROUND(12.33323323, 2) -- define a quantidade de casas decimais permitidas

SELECT * FROM [ITENS NOTAS FISCAIS]

SELECT [QUANTIDADE], [PREÇO], ROUND(([QUANTIDADE] * [PREÇO]),1) FROM [ITENS NOTAS FISCAIS]


--Na tabela de notas fiscais, temos o valor do imposto. Já na tabela de itens,
--temos a quantidade e o faturamento. Calcule o valor do imposto pago no ano de 2016,
--arredondando para o menor inteiro.
SELECT YEAR(DATA), FLOOR(SUM(IMPOSTO * (QUANTIDADE * PREÇO))) 
FROM [NOTAS FISCAIS] NF
INNER JOIN [ITENS NOTAS FISCAIS] INF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA) = 2016
GROUP BY YEAR(DATA)