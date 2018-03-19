/*
	Aula 17 - Monitoramento de tamanho de p�ginas - PFS

	# O SQL monitora o tamanho de cada p�gina atrav�s do Page Free Space
	# O monitoramento � feito por classes:
		* Vazio
		* 1-50%
		* 51-80%
		* 81-95%
		* 96-100%
	# Caso o SQL verifique que o tamanho dos dados extrapolar� os 8k, ser� criada uma nova p�gina
	# Cuidado ao criar tabelas com dados de tamanho fixo, pois pode acarretar em espa�os sem uso

	- m_slotCnt = Quantidade de registros na p�gina
	- m_freeCnt = Quantidade de bytes livres

	* Lembremos que existem outros dados al�m das informa��es das colunas
*/
-- DROP TABLE tbl_PFS

USE SQLAvancado

CREATE TABLE tbl_PFS (
	coluna INT -- INT = 4 bytes
)

-- 8.083
INSERT INTO tbl_PFS VALUES (1)

dbcc ind (
	'SQLAvancado',
	'dbo.tbl_PFS',
	1
)

dbcc traceon(3604)
dbcc page (
	'SQLAvancado',
	1,
	32029,
	3
)

DECLARE @i int;
SET @i = 0
while @i < 500
begin	
	INSERT INTO tbl_PFS values (1);
	SET @i = @i + 1;
end

-- Tamanho vari�vel

-- DROP TABLE tbl_PFS_Var 

create table tbl_PFS_Var (
	letra VARCHAR(4000)
)

INSERT INTO tbl_PFS_Var VALUES (replicate('x', 20))

dbcc ind (
	'SQLAvancado',
	'dbo.tbl_PFS_Var',
	1
)

dbcc traceon(3604)
dbcc page (
	'SQLAvancado',
	1,
	32040,
	3
)

-- Tabela desperd�cio
-- DROP TABLE tbl_PFS_PerdeEspacoPraCaceteQueVoceVaiTerIdeiaAgora

CREATE TABLE tbl_PFS_PerdeEspacoPraCaceteQueVoceVaiTerIdeiaAgora (
	desperdicandoPraCacete CHAR(3500)
)

INSERT INTO tbl_PFS_PerdeEspacoPraCaceteQueVoceVaiTerIdeiaAgora VALUES ('A'), ('B'), ('C')

dbcc ind (
	'SQLAvancado',
	'dbo.tbl_PFS_PerdeEspacoPraCaceteQueVoceVaiTerIdeiaAgora',
	1
)

dbcc traceon(3604)
dbcc page (
	'SQLAvancado',
	1,
	32029,
	3
)

-- Sigla CHAR(2)