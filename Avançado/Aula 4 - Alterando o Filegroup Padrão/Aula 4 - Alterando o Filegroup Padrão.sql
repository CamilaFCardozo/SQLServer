/*
	Aula 4 - Alterando o filegroup padr�o de uma base de dados

	# Caso n�o seja alterado, as novas tabelas criadas ir�o para esse filegroup

	Filegroups da base SQLAvancado:
		* [PauloGuina]
		* [Jailson]
*/

-- Ao criar a base de dados

ALTER DATABASE SQLAvancado
MODIFY FILEGROUP Jailson DEFAULT;

-- No Wizard do SQL Server