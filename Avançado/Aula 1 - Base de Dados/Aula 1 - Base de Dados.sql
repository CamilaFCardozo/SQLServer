/*
	Aula 1 - Armazenamento de Base de dados

	# O SQL pode armazenar, em teoria, 32,767 bases de dados.
	# Cada base possui 1-n arquivos de log (.ldf), que armazena os dados para possa haver uma recupera��o (rollback);
	# Cada base possui 1 arquivo prim�rio (.mdf) e 0-n arquivos secund�rios (.ndf)
	# Todos os arquivos est�o agrupados em filegroups (grupos de arquivos).
		* Um Filegroup � uma unidade l�gica para organizar os arquivos f�sicos da base de dados
*/
