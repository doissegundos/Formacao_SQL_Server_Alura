SELECT GETDATE()
SELECT DATENAME(WEEKDAY, DATEADD(DAY, 6, GETDATE()))

DECLARE @DIA_SEMANA VARCHAR(20)
DECLARE @NUMERO_DIAS INT
SET @NUMERO_DIAS = 9
SET @DIA_SEMANA = DATENAME(WEEKDAY, DATEADD(DAY, @NUMERO_DIAS, GETDATE()))
PRINT @DIA_SEMANA
IF @DIA_SEMANA = 'Domingo' OR @DIA_SEMANA = 'Sábado'
   PRINT 'Este dia é fim de semana'
ELSE
   PRINT 'Este dia é dia da semana'

--- Crie um script que, baseado em uma data, conte o número de notas fiscais.
---Se houver mais de 70 notas, exiba a mensagem "Muita nota".
--Se não, exiba a mensagem "Pouca nota". Exiba também o número de -notas.
DECLARE @NUMNOTAS INT
SELECT @NUMNOTAS = COUNT(*) FROM [NOTAS FISCAIS] 
    WHERE DATA = '20170101'
PRINT @NUMNOTAS
IF @NUMNOTAS >70 
   PRINT 'Muita nota'
ELSE
   PRINT 'Pouca nota'