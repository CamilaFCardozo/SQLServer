/*
	Aula 7 - Tipos de Armazenamento

	# De forma geral, existe tr�s tipos de armazenamento e de �ndices: armazenamento em linha (rowstore), coluna (columnstore) e na mem�ria (in-memory storage)
		* Tamb�m existem �ndices columstore
	# Rowstore - O "padr�o" de armazenamento de tabelas relacionais
	# Columstore - � usado para tabelas de Data Warehouses (Tabelas de fatos e tabelas de dimens�es)
		* https://logicalread.com/sql-server-columnstore-index-w02/#.WpxmHmrwbcc
		* https://www.mssqltips.com/sqlservertip/5225/sql-server-clustered-columnstore-index-examples-for-etl/
	# In-Memory OLTP 
		* https://www.youtube.com/watch?v=l5l5eophmK4 - V�deo sobre a tecnologia
		* https://docs.microsoft.com/pt-br/sql/relational-databases/in-memory-oltp/in-memory-oltp-in-memory-optimization 

	# http://www.sqlservercentral.com/articles/ColumnStore+Index/125264/ - 
		Compara��o entre as duas tecnologias (�ndices de colunas x �ndices de linhas)
	# http://15721.courses.cs.cmu.edu/spring2017/papers/09-olapindexes/p1177-larson.pdf - Sobre o columnstore

*/