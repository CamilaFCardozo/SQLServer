/*
	Aula 14 - Armazenamento LOB

	# Demonstra��o do LOB

	# Igual ao Row-Overflow, � uma p�gina com ponteiro para outras folhas.

	# Caso a p�gina n�o tenha espa�o para o dado, ser� criada uma p�gina nova
*/

CREATE TABLE tbl_TabelaLOB (
	id INT,
	texto VARCHAR(MAX)
)

INSERT INTO tbl_TabelaLOB VALUES (1, REPLICATE(CONVERT(VARCHAR(MAX), 'A'), 16000))


dbcc ind (
	'SQLAvancado',
	'dbo.tbl_TabelaLOB',
	1
)

dbcc traceon(3604)
dbcc page (
	'SQLAvancado',
	1,
	156,
	3
)