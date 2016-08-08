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

*/

CREATE TABLE tb_Produtos (
	cdProduto INT PRIMARY KEY IDENTITY(1,1),
	nmProduto VARCHAR(50) NOT NULL, -- Obrigat�rio
	vlProduto DECIMAL(6,2) NOT NULL
);

CREATE TABLE tb_Clientes (
	cdCliente INT PRIMARY KEY IDENTITY(1,1),
	nmCliente VARCHAR(50) NOT NULL,
	dtNascimento DATE,
	inSexo VARCHAR(1) NOT NULL,
	nmEndereco VARCHAR(50),
	nmCidade VARCHAR(50),
	nmEstado VARCHAR(30),
	nmTelefone1 VARCHAR(15),
	nmTelefone2 VARCHAR(15)
)

CREATE TABLE tb_Vendas (
	cdVenda INT PRIMARY KEY IDENTITY(1,1),
	cdCliente INT NOT NULL FOREIGN KEY REFERENCES tb_Clientes (cdCliente),
	dtVenda DATETIME NOT NULL
);

CREATE TABLE tb_ProdutoVenda (
	cdProdutoVenda INT PRIMARY KEY IDENTITY(1,1),
	cdVenda INT FOREIGN KEY REFERENCES tb_Vendas (cdVenda) NOT NULL,
	cdProduto INT FOREIGN KEY REFERENCES tb_Produtos (cdProduto) NOT NULL,
	qtProduto INT NOT NULL
)

-- FOREIGN KEY
-- CONSTRAINT

ALTER TABLE tb_Vendas
ADD CONSTRAINT FK_Produto_Vendas
FOREIGN KEY (cdProduto)
REFERENCES tb_Produtos (cdProduto)


-- Remover a tabela de vendas
DROP TABLE tb_Vendas

