/*
	Aula 21 - Resqu�cios das altera��es de tabelas

	# Quando voc� diminui o tamanho ou dropa uma coluna, o SQL n�o retorna o tamanho "excedente"
	# Se voc� alterar o tamanho de uma coluna para outra maior (int para bigint), o SQL cria uma coluna
	com o espa�o maior e copia os dados da coluna menor para a maior, ainda ocupando o espa�o da coluna menor
	# ALTER REBUILD ajuda a resgatar o espa�o perdido
*/

USE SQLAvancado

-- Cria��o da tabela de exemplo
-- DROP TABLE tbl_DadosPerdidos

CREATE TABLE tbl_DadosPerdidos (
	inteiro INT,
	tamanhoFixo CHAR(10),
	colunaGrande CHAR(500),
	numerinho TINYINT
)

-- Verificano o tamanho
-- Script do livro Korotkevitch, Dmitri. Pro SQL Server Internals (Locais do Kindle 1477-1481). Apress. Edi��o do Kindle. 
select
	c.column_id, 
	c.Name, 
	ipc.leaf_offset as [Offset in Row], 
	ipc.max_inrow_length as [Max Length], 
	ipc.system_type_id as [Column Type] 
from
	sys.system_internals_partition_columns ipc join sys.partitions p on ipc.partition_id = p.partition_id � � � � 
	join sys.columns c on c.column_id = ipc.partition_column_id and c.object_id = p.object_id 
where 
	p.object_id = object_id( N'dbo.tbl_DadosPerdidos') order by c.column_id;

-- Aumento de tamanho
ALTER TABLE tbl_DadosPerdidos
ALTER COLUMN numerinho BIGINT

-- 7.564
INSERT INTO tbl_DadosPerdidos VALUES (1, 2, 4)

-- Drop de coluna
ALTER TABLE tbl_DadosPerdidos
DROP COLUMN colunaGrande

dbcc ind (
	'SQLAvancado',
	'dbo.tbl_DadosPerdidos',
	1
)

dbcc traceon(3604)
dbcc page (
	'SQLAvancado',
	1,
	32008,
	3
)

-- O Rebuild ir� criar uma nova p�gina com outra numera��o
ALTER TABLE tbl_DadosPerdidos REBUILD