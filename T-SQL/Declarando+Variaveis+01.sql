
DECLARE @MATRICULA VARCHAR(5), @NOME VARCHAR(100), @PERCENTUAL FLOAT, @DATA DATE, @FERIAS BIT
DECLARE @BAIRRO VARCHAR(100)

SET @MATRICULA = '00240'
SET @NOME = 'Cl�udia Rodrigues'
SET @PERCENTUAL = 0.10
SET @DATA = '20120312'
SET @FERIAS = 1
SET @BAIRRO = 'Jardins'

INSERT INTO [TABELA DE VENDEDORES] (MATRICULA, NOME, [PERCENTUAL COMISS�O]
, [DATA ADMISS�O], [DE FERIAS], BAIRRO)
VALUES
(@MATRICULA, @NOME, @PERCENTUAL, @DATA, @FERIAS, @BAIRRO)

SELECT * FROM [TABELA DE VENDEDORES] 

-----
DECLARE  @NOME VARCHAR(10), @IDADE INT, @DATA DATE, @CUSTO FLOAT
SET @NOME = 'Jo�o'
SET @IDADE = 10
SET @DATA = '20071001'
SET @CUSTO = 10.23
PRINT @NOME
PRINT @IDADE
PRINT @DATA
PRINT @CUSTO

DECLARE @NUMNOTAS INT
SELECT @NUMNOTAS = COUNT(*) FROM [NOTAS FISCAIS] 
    WHERE DATA = '20170101'
PRINT @NUMNOTAS