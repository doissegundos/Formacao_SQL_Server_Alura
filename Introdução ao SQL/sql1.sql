-- Criando BD SUCOS_VENDAS
CREATE DATABASE SUCOS_VENDAS

-- Criando bd SUCOS_VENDAS de forma mais complexa
CREATE DATABASE SUCOS_VENDAS
ON (NAME = SUCOS_VENDAS_DAT, FILENAME= 'C:\TEMP\DATA\SALES_VENDAS)02.MDF' ,SIZE=10,MAXSIZE=50, FILEGROWTH=5)
LOG ON (NAME = SUCOS_VENDAS_LOG, FILENAME= 'C:\TEMP\DATA\SALES_VENDAS)02.LDF', SIZE=10,MAXSIZE=50, FILEGROWTH=5)

-- Apagando bd SUCOS_VENDS_01
DROP DATABASE SUCOS_VENDS_01

-- Criando tabela de clientes
CREATE TABLE [TABELA DE CLIENTES](
	[CPF][VARCHAR](11),
	[NOME][VARCHAR](100),
	[ENDERECO 1][VARCHAR](150),
	[ENDERECO 2][VARCHAR](150),
	[BAIRRO][VARCHAR](50),
	[CIDADE][VARCHAR](50),
	[ESTADO][VARCHAR](2),
	[CEP][VARCHAR](8),
	[DATA DE NASCIMENTO][DATE],
	[IDADE][SMALLINT],
	[SEXO][VARCHAR](1),
	[LIMITE DE CREDITO][MONEY],
	[VOLUME DE COMPRA][FLOAT],
	[PRIMEIRA COMPRA][BIT],
)
-- Criando tabela de vendedores
CREATE TABLE [TABELA DE VENDEDORES](
	[MATRICULA][VARCHAR](5),
	[NOME][VARCHAR](100),
	[PERCENTUAL COMISS�O][FLOAT]
)

-- Apagando tabela
DROP TABLE [TABELA DE CLIENTES 2]

--Incluido dados na tabela do BD
INSERT INTO [dbo].[TABELA DE PRODUTOS]
	([CODIGO DO PRODUTO],[NOME DO PRODUTO],[EMBALAGEM],[TAMANHO],[SABOR],[PRECO DE LISTA])
VALUES 
	('1040107','Light - 350ml melancia','lata','350ml','melancia',4.56)


INSERT INTO [dbo].[TABELA DE VENDEDORES]
	([MATRICULA],[NOME],[PERCENTUAL COMISS�O])
VALUES 
	('00233','Jos� Geraldo da Fonseca',0.10)

INSERT INTO [dbo].[TABELA DE VENDEDORES]
	([MATRICULA],[NOME],[PERCENTUAL COMISS�O])
VALUES 
	('00235','M�rcio Almeida Silva',0.08)

INSERT INTO [dbo].[TABELA DE VENDEDORES]
	([MATRICULA],[NOME],[PERCENTUAL COMISS�O])
VALUES 
	('00236','Cl�udia Morais',0.08)

--Alterar registro na tabela
UPDATE [TABELA DE PRODUTOS] SET 
	[EMBALAGEM] = 'lata', [PRECO DE LISTA] = '2.46'
WHERE [CODIGO DO PRODUTO] = '544931'

UPDATE [TABELA DE PRODUTOS] SET 
	[EMBALAGEM] = 'Garrafa'
WHERE [CODIGO DO PRODUTO] = '1078680'

UPDATE[dbo].[TABELA DE VENDEDORES]  SET 
	[NOME] = 'Jos� Geraldo da Fonseca Junior'
WHERE [MATRICULA] = '00233'

--Excluindo registro na tabela
DELETE FROM [dbo].[TABELA DE PRODUTOS]
WHERE [CODIGO DO PRODUTO] = '1040107'

--Tornando um campo da tabela como chave primaria
ALTER TABLE [dbo].[TABELA DE PRODUTOS]
ADD CONSTRAINT PK_PRODUTOS 
PRIMARY KEY CLUSTERED ([CODIGO DO PRODUTO])

ALTER TABLE [dbo].[TABELA DE VENDEDORES]
ADD CONSTRAINT PK_VENDEDORES
PRIMARY KEY CLUSTERED ([MATRICULA])

ALTER TABLE [dbo].[TABELA DE CLIENTES]
ADD CONSTRAINT PK_CLIENTES
PRIMARY KEY CLUSTERED ([CPF])

--Alterando a propriedade de uma coluna da tabela
ALTER TABLE [dbo].[TABELA DE PRODUTOS]
ALTER COLUMN [CODIGO DO PRODUTO]
VARCHAR(10) NOT NULL

--Alterando a propriedade de uma coluna da tabela
ALTER TABLE [dbo].[TABELA DE VENDEDORES]
ALTER COLUMN [MATRICULA]
VARCHAR(5) NOT NULL

ALTER TABLE [dbo].[TABELA DE CLIENTES]
ALTER COLUMN [CPF]
VARCHAR(11) NOT NULL

--Inserindo na tabela de clientes
INSERT INTO [dbo].[TABELA DE CLIENTES]
           ([CPF]
           ,[NOME]
           ,[ENDERECO 1]
           ,[ENDERECO 2]
           ,[BAIRRO]
           ,[CIDADE]
           ,[ESTADO]
           ,[CEP]
           ,[DATA DE NASCIMENTO]
           ,[IDADE]
           ,[SEXO]
           ,[LIMITE DE CREDITO]
           ,[VOLUME DE COMPRA]
           ,[PRIMEIRA COMPRA])
     VALUES
           ('20000000258',
           'Jubileu vc n sabe e nem eu',
           'morada dos ventos',
           'quadra 26',
           'centro',
           'acarau',
           'ce',
           '62580000',
           '1990-10-25',
           31,
           'M',
           12000,
           1000,
           1)

-- Buscando dados da tabela
SELECT TOP (1000) [CPF]
      ,[NOME]
      ,[ENDERECO 1]
      ,[ENDERECO 2]
      ,[BAIRRO]
      ,[CIDADE]
      ,[ESTADO]
      ,[CEP]
      ,[DATA DE NASCIMENTO]
      ,[IDADE]
      ,[SEXO]
      ,[LIMITE DE CREDITO]
      ,[VOLUME DE COMPRA]
      ,[PRIMEIRA COMPRA]
  FROM [SUCOS_VENDAS].[dbo].[TABELA DE CLIENTES]

-- Selecionando todos os campos para fazer uma pesquisa na tabela
SELECT * FROM [SUCOS_VENDAS].[dbo].[TABELA DE CLIENTES]

-- Criando um ALIAS, um nome fantasia para a coluna da tabela
SELECT [CPF] AS IDENTIFICADOR
      ,[NOME] AS CLIENTE
FROM [SUCOS_VENDAS].[dbo].[TABELA DE CLIENTES]

--Criando um filtro de pesquisas na tabela
SELECT * FROM [dbo].[TABELA DE PRODUTOS] WHERE [CODIGO DO PRODUTO] = '1000889'
SELECT * FROM [dbo].[TABELA DE PRODUTOS] WHERE [EMBALAGEM] = 'Garrafa'
SELECT * FROM [dbo].[TABELA DE VENDEDORES] WHERE [NOME] = 'Cl�udia Morais'
SELECT * FROM [dbo].[TABELA DE PRODUTOS] WHERE [PRE�O DE LISTA] > 4.555
SELECT * FROM [dbo].[TABELA DE PRODUTOS] WHERE [PRE�O DE LISTA] > 10
SELECT * FROM [dbo].[TABELA DE PRODUTOS] WHERE [PRE�O DE LISTA] <> 10 -- DIFERENTE DE 10

--Filtrando datas
SELECT * FROM [dbo].[TABELA DE CLIENTES] WHERE [DATA DE NASCIMENTO] = '1995-09-11'
SELECT * FROM [dbo].[TABELA DE CLIENTES] WHERE [DATA DE NASCIMENTO] > '1995-09-11'
SELECT * FROM [dbo].[TABELA DE CLIENTES] WHERE [DATA DE NASCIMENTO] < '1995-09-11'
SELECT * FROM [dbo].[TABELA DE CLIENTES] WHERE YEAR([DATA DE NASCIMENTO]) = 1995
SELECT * FROM [dbo].[TABELA DE CLIENTES] WHERE MONTH([DATA DE NASCIMENTO]) = 09
SELECT * FROM [dbo].[TABELA DE CLIENTES] WHERE DAY([DATA DE NASCIMENTO]) = 5