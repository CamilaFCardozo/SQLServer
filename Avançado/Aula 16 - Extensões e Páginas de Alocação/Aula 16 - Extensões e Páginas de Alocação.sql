/*
	Aula 16 - Extens�es e P�ginas de Aloca��o (https://technet.microsoft.com/en-us/library/ms190969(v=sql.105).aspx)

	# O SQL armazena em unidades de 8 p�ginas, totalizando 64kb chamadas extens�es (extents)
	# As p�ginas podem estar de extens�es mistas (mixed extends) ou de tipos iguais (uniform extends)
	# Por padr�o a primeira extens�o � mista. Depois ela � uniforme
	# As p�ginas s�o monitoradas atrav�s de mapas de aloca��o
	# O SQL possui arquivos de monitoramento chamados Mapas de Aloca��o (Allocation Maps)
		* IAM (Index Allocation Map) - Cuida das p�ginas de �ndices e de dados
		* GAM (Global Allocation Map) - Verifica se a p�ginas est� alocada em qualquer objeto
		* SGAM (Shared Global Allocation Map) - Verifica se a p�gina est� alocada em uma extens�o mista
			- GAM e SGAM podem cuidar de at� 64.000 extens�es (4GB)
*/

create table tbl_Teste(
	col1 char(5000)
)

INSERT INTO tbl_Teste values (replicate('x', 5000))

dbcc ind (
	'SQLAvancado',
	'dbo.tbl_Teste',
	1
)

dbcc traceon(3604)
dbcc page (
	'SQLAvancado',
	1,
	32039,
	3
)

-- https://raresql.com/2013/01/24/sql-server-2012-sys-dm_db_database_page_allocations-dynamic-management-function/
select * from sys.dm_db_database_page_allocations(DB_ID(), OBJECT_ID('tbl_Teste'), NULL, NULL, 'DETAILED')
