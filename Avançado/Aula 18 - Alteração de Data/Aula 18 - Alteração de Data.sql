/*
	Aula 18 - Altera��o de data

	# Quando h� uma altera��o, o SQL realiza o seguinte processo
		* L� a p�gina a ser modificada e a coloca na mem�ria (buffer pool)
		* Cria um log transa��o s�ncrono e depois atualiza a p�gina no buffer
		* O banco de dados atualiza a p�gina no disco assincronamente

	# Este processo � similar para as outras opera��es de manipula��o de data (DML - INSERT, UPDATE, DELETE, SELECT e MERGE)

*/