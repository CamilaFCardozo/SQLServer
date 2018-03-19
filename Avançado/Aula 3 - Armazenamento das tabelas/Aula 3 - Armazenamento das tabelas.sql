/*
	Aula 3 - Armazenamento das Tabelas

	# Ao criar as tabelas, elas ser�o armazenadas em seus respectivos filegroups
	# Se n�o for especificado o filegroup padr�o, as tabelas ser�o armazenadas no PRIMARY

	Filegroups da base SQLAvancado:
		* [PauloGuina]
		* [Jailson]
*/

CREATE TABLE dbo.tblPrimary ( -- Tabela que ir� para o filegroup padr�o (neste caso, o Primary)
	coluna int
)

CREATE TABLE dbo.tblPauloGuina (
	coluna int
) ON [PauloGuina]

CREATE TABLE dbo.tblJailson (
	coluna int
) ON [Jailson]