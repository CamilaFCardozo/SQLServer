/*
	Loja de Sucos do Jailson

	* Vende sucos (principalmente de Laranja)

	* Dados dos clientes:
		Nome (texto)
		nascimento (data dd/mm/aaaa)
		sexo (n�mero)
		endere�o
			Rua (texto)
			cidade (texto)
			Estado (texto)
		Telefones (texto)

	* Dados das vendas
		N�mero da venda (n�mero)
		cliente que comprou (texto)
		pre�o total (n�mero)

	* Dados do produto
		Nome (texto)
		Pre�o (n�mero)
*/

/*
	Truncar - Diminui o tamanho do texto/dado

	nmProduto VARCHAR(3);

	"Coxinha" (7 letras) -> Cox
*/

-- Aula 4 - Criando Base de dados (Parte 1)

CREATE TABLE tb_DadosProduto (
	nmProduto VARCHAR(50) NOT NULL, -- Obrigat�rio
	vlProduto DECIMAL(6,2) NOT NULL
);