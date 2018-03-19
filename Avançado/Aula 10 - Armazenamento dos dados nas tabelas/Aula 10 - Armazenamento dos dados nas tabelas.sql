/*
	Aula 10 - Armazenamento de dados na tabela (https://blogs.msdn.microsoft.com/fcatae/2016/04/26/dbcc-ind/)
	https://raresql.com/2013/01/24/sql-server-2012-sys-dm_db_database_page_allocations-dynamic-management-function/


	Fun��es de verifica��o
		sys.dm_db_database_page_allocations
		dbcc ind

	# Os dados s�o armazenados em p�ginas
	# Cada p�gina possui N linhas de dados
	# Os campos s�o:
	�	PageFID � O id do arquivo da p�gina;
	�	PagePID � o n�mero da p�gina no arquivo;
	�	IAMFID � O id do arquivo IAM (Index Allocation Map) que mapeia esta p�gina (se o arquivo foi um IAM, o resultado ser� nulo, assim como o IAMFID da primeira linha da m (https://technet.microsoft.com/pt-br/library/ms187501(v=sql.105).aspx)
	�	IAMPID � o n�mero da p�gina que o arquivo IAM mapeia esta p�gina;
	�	ObjectId � O ID que o �ndice desta p�gina faz parte;
	�	PartitionNumber � O n�mero da parti��o que esta p�gina est�;
	�	PartitionID � O ID interno da p�gina ao qual o datarow est� alocado;
	�	Iam_chain_type � o tipo da unidade de aloca��o (IN_ROW_DATA (para tabelas HEAP), LOB_DATA (Large Object) e ROW_OVERFLOW_DATA);
	�	PageType � Representa o tipo da p�gina. As mais comuns s�o:
		o	1  - p�gina de dados;
		o	2 � p�gina de �ndice;
		o	3 e 4 � p�ginas de texto;
		o	8 � p�ginas GAM;
		o	9 � p�ginas SGAM;
		o	10 � p�gina IAM;
		o	11 � p�gina PFS;
	�	IndexLevel � Em qual n�vel a p�gina est� do �ndice (isso se estiver em algum �ndice). O n�mero vai desde o 0 (p�gina folha � mais na borda da �rvore) at� a p�gina N, que � a raiz;
	�	NextPagaFID e NextPagePID � Pr�ximas p�ginas;
	�	PrevPageFID e PrevPagePID � P�ginas anteriores de acordo com o �ndice;



*/

create table tblJailson (
	col1 int NULL,
	col2 int
) on [Jailson]

insert into tblJailson values (1,2)


dbcc ind (
	'SQLAvancado',
	'dbo.tblJailson',
	-1
)

dbcc traceon(3604)
dbcc page (
	'SQLAvancado',
	4, --File ID
	16, -- Page ID
	3 -- Tipo de display
)

select * from sys.dm_db_database_page_allocations(DB_ID(), OBJECT_ID('tblJailson'), null, null, 'DETAILED')