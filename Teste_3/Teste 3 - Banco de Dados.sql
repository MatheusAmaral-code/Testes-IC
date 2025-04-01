CREATE DATABASE ANS;
USE ANS;

CREATE TABLE operadoras (
    Registro_ANS INT,
    CNPJ VARCHAR(20),
    Razao_Social VARCHAR(255),
    Nome_Fantasia VARCHAR(255),
    Modalidade VARCHAR(100),
    Logradouro VARCHAR(255),
    Numero VARCHAR(20),
    Complemento VARCHAR(255),
    Bairro VARCHAR(100),
    Cidade VARCHAR(100),
    UF CHAR(2),
    CEP VARCHAR(20),
    DDD VARCHAR(5),
    Telefone VARCHAR(20),
    Fax VARCHAR(20),
    Endereco_eletronico VARCHAR(255),
    Representante VARCHAR(255),
    Cargo_Representante VARCHAR(255),
    Regiao_de_Comercializacao VARCHAR(255),
    Data_Registro_ANS DATE
);

CREATE TABLE despesas(
    Data_Despesa DATE,
    Registro_ANS_ID INT,
    Codigo_Conta_Contabil INT,
    Descricao VARCHAR(300),
    Valor_Saldo_Inicial DOUBLE,
    Valor_Saldo_Final DOUBLE
);

LOAD DATA LOCAL INFILE 'C:/Users/Nero/Documents/Testes_IC/Dados/Relatorio_cadop.csv'
INTO TABLE operadoras
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (
	Registro_ANS, 
	CNPJ, 
	Razao_Social, 
	Nome_Fantasia, 
	Modalidade, 
	Logradouro, 
	Numero, 
	Complemento, 
	Bairro, 
	Cidade, 
	UF, 
	CEP, 
	DDD, 
	Telefone, 
	Fax, 
	Endereco_eletronico, 
	Representante, 
	Cargo_Representante, 
	Regiao_de_Comercializacao, 
	Data_Registro_ANS
);

LOAD DATA INFILE 'C:/Users/Nero/Documents/Testes_IC/Dados/1T2023.csv' 
INTO TABLE despesas
CHARACTER SET utf8
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (
    Data_Despesa,
    Registro_ANS_ID,
    Codigo_Conta_Contabil,
    Descricao,
    @Valor_Saldo_Inicial,
    @Valor_Saldo_Final
)
SET
    Valor_Saldo_Inicial = REPLACE(@Valor_Saldo_Inicial, ',', '.'),
    Valor_Saldo_Final = REPLACE(@Valor_Saldo_Final, ',', '.');
    
LOAD DATA INFILE 'C:/Users/Nero/Documents/Testes_IC/Dados/2T2023.csv' 
INTO TABLE despesas
CHARACTER SET utf8
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (
    Data_Despesa,
    Registro_ANS_ID,
    Codigo_Conta_Contabil,
    Descricao,
    @Valor_Saldo_Inicial,
    @Valor_Saldo_Final
)
SET
    Valor_Saldo_Inicial = REPLACE(@Valor_Saldo_Inicial, ',', '.'),
    Valor_Saldo_Final = REPLACE(@Valor_Saldo_Final, ',', '.');
    
LOAD DATA INFILE 'C:/Users/Nero/Documents/Testes_IC/Dados/3T2023.csv' 
INTO TABLE despesas
CHARACTER SET utf8
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (
    Data_Despesa,
    Registro_ANS_ID,
    Codigo_Conta_Contabil,
    Descricao,
    @Valor_Saldo_Inicial,
    @Valor_Saldo_Final
)
SET
    Valor_Saldo_Inicial = REPLACE(@Valor_Saldo_Inicial, ',', '.'),
    Valor_Saldo_Final = REPLACE(@Valor_Saldo_Final, ',', '.');
    
LOAD DATA INFILE 'C:/Users/Nero/Documents/Testes_IC/Dados/4T2023.csv' 
INTO TABLE despesas
CHARACTER SET utf8
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (
    @Data_Despesa,
    Registro_ANS_ID,
    Codigo_Conta_Contabil,
    Descricao,
    @Valor_Saldo_Inicial,
    @Valor_Saldo_Final
)
SET
    Valor_Saldo_Inicial = REPLACE(@Valor_Saldo_Inicial, ',', '.'),
    Valor_Saldo_Final = REPLACE(@Valor_Saldo_Final, ',', '.'),
    Data_Despesa = STR_TO_DATE(@Data_Despesa, '%d/%m/%Y');
    
LOAD DATA INFILE 'C:/Users/Nero/Documents/Testes_IC/Dados/1T2024.csv' 
INTO TABLE despesas
CHARACTER SET utf8
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (
    Data_Despesa,
    Registro_ANS_ID,
    Codigo_Conta_Contabil,
    Descricao,
    @Valor_Saldo_Inicial,
    @Valor_Saldo_Final
)
SET
    Valor_Saldo_Inicial = REPLACE(@Valor_Saldo_Inicial, ',', '.'),
    Valor_Saldo_Final = REPLACE(@Valor_Saldo_Final, ',', '.');
    
LOAD DATA INFILE 'C:/Users/Nero/Documents/Testes_IC/Dados/2T2024.csv' 
INTO TABLE despesas
CHARACTER SET utf8
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (
    Data_Despesa,
    Registro_ANS_ID,
    Codigo_Conta_Contabil,
    Descricao,
    @Valor_Saldo_Inicial,
    @Valor_Saldo_Final
)
SET
    Valor_Saldo_Inicial = REPLACE(@Valor_Saldo_Inicial, ',', '.'),
    Valor_Saldo_Final = REPLACE(@Valor_Saldo_Final, ',', '.');
    
LOAD DATA INFILE 'C:/Users/Nero/Documents/Testes_IC/Dados/3T2024.csv' 
INTO TABLE despesas
CHARACTER SET utf8
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (
    Data_Despesa,
    Registro_ANS_ID,
    Codigo_Conta_Contabil,
    Descricao,
    @Valor_Saldo_Inicial,
    @Valor_Saldo_Final
)
SET
    Valor_Saldo_Inicial = REPLACE(@Valor_Saldo_Inicial, ',', '.'),
    Valor_Saldo_Final = REPLACE(@Valor_Saldo_Final, ',', '.');
    
LOAD DATA INFILE 'C:/Users/Nero/Documents/Testes_IC/Dados/4T2024.csv' 
INTO TABLE despesas
CHARACTER SET utf8
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (
    Data_Despesa,
    Registro_ANS_ID,
    Codigo_Conta_Contabil,
    Descricao,
    @Valor_Saldo_Inicial,
    @Valor_Saldo_Final
)
SET
    Valor_Saldo_Inicial = REPLACE(@Valor_Saldo_Inicial, ',', '.'),
    Valor_Saldo_Final = REPLACE(@Valor_Saldo_Final, ',', '.');

#Query Analítica Último Ano
SELECT
    op.Razao_Social AS 'Operadora',
    ROUND(Sum(des.Valor_Saldo_Final) - Sum(des.Valor_Saldo_Inicial),2) AS 'Despesa'
FROM despesas des
    JOIN operadoras op 
		ON des.Registro_ANS_ID = op.Registro_ANS
WHERE
    des.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
    AND des.Data_Despesa BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY op.Razao_Social
ORDER BY Despesa DESC
LIMIT 10;

#Query Analítica Último Trimestre
SELECT
    op.Razao_Social AS 'Operadora',
    ROUND(Sum(des.Valor_Saldo_Final) - Sum(des.Valor_Saldo_Inicial),2) AS 'Despesa'
FROM despesas des
    JOIN operadoras op 
		ON des.Registro_ANS_ID = op.Registro_ANS
WHERE
    des.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
    AND des.Data_Despesa BETWEEN '2024-10-01' AND '2024-12-31'
GROUP BY op.Razao_Social
ORDER BY Despesa DESC
LIMIT 10;