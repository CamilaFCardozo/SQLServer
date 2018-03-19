/*
	Aula 8 - Data Pages e Data Rows

	# Os espa�os do Banco de Dados s�o divididos em p�ginas de 8kb cada;
	# As p�ginas s�o numeradas ordendamente come�ando pelo 0 (entra p�gina = +1; sai p�gina -1)
	# A p�gina � composta por algumas partes: Page Header (96 bytes), data rows (onde os dados s�o armazenados),
	um espa�o em branco e o	Slot Array;

	# O Header identifica os metadados da p�gina (qual objeto pertence, quantidade de linhas, etcs);
	# Em seguida tem o espa�o onde os dados das linhas s�o armazenados;
	# O Slot Array indica a ordem l�gica dos dados na p�gina
*/