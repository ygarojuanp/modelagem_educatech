// Criação do banco

CREATE DATABASE educatech;

//Acesso ao banco para operações

USE educatech;

//Criação da tabel alunos
CREATE TABLE IF NOT EXISTS alunos(
  ID INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  data_nascimento DATE,
  telefone VARCHAR (15),
  data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
  );

  ALTER TABLE alunos(nome da tabela) MODIFY COLUMN telefone CHAR(15)(a coluna que deseja alterar);

  //Criação da tabela professores
  CREATE TABLE IF NOT EXISTS professores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(150) NOT NULL,
    telefone CHAR(15),
    especialidade VARCHAR (100)
  );

CREATE TABLE cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150),
    descricao TEXT,
    carga_horaria INT NOT NULL CHECK (carga_horaria > 0),
    valor DECIMAL(10, 2) NOT NULL CHECK(valor >= 0),
    professor_id INT NOT NULL REFERENCES professores(id),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

//  FOREIGN KEY (professor_id) REFERENCES professores(id)

CREATE TABLE matriculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT NOT NULL,
    curso_id INT NOT NULL,
    data_matricula DATETIME DEFAULT CURRENT_TIMESTAMP,
    nota_final DECIMAL (4,2),
    situacao ENUM(
        'EM_ANDAMENTO', 'CONCLUIDA', 'CANCELADA'
    ) NOT NULL DEFAULT 'EM_ANDAMENTO',

    CONSTRAINT chk_nota_final CHECK(nota_final BETWEEN 0 AND 10 OR nota_final IS NULL),
    CONSTRAINT uk_aluno_curso UNIQUE (aluno_id, curso_id),

    CONSTRAINT fk_matriculas_alunos FOREIGN KEY (aluno_id) REFERENCES alunos(id),

    CONSTRAINT fk_matriculas_cursos FOREIGN KEY (curso_id) REFERENCES cursos(id)

);

// indicado que se for check ou references seja adicionado no constraint, pois se adicionado depois do tipo, o banco vai criar uma chave aleatorio.


