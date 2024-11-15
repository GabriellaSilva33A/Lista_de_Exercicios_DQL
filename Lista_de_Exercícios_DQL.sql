CREATE SEQUENCE seq_aluno START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_professor START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_curso START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_disciplina START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_matricula START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_turma START WITH 1 INCREMENT BY 1;

-- Cria a tabela Aluno
CREATE TABLE aluno (
    id_aluno NUMBER DEFAULT seq_aluno.NEXTVAL PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    data_nascimento DATE,
    cpf VARCHAR2(14) UNIQUE,
    email VARCHAR2(100),
    telefone VARCHAR2(15),
    endereco VARCHAR2(255)
);

-- Cria a tabela Professor
CREATE TABLE professor (
    id_professor NUMBER DEFAULT seq_professor.NEXTVAL PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    especialidade VARCHAR2(100),
    email VARCHAR2(100),
    telefone VARCHAR2(15),
    endereco VARCHAR2(255)
);

--Cria a tabela Curso
CREATE TABLE curso (
    id_curso NUMBER DEFAULT seq_curso.NEXTVAL PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    descricao CLOB,
    carga_horaria NUMBER
);

-- Cria a tabela disciplina
CREATE TABLE disciplina (
    id_disciplina NUMBER DEFAULT seq_disciplina.NEXTVAL PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    descricao CLOB,
    id_curso NUMBER,
    carga_horaria NUMBER,
    CONSTRAINT fk_curso FOREIGN KEY (id_curso) REFERENCES curso(id_curso) ON DELETE CASCADE
);

-- Cria a tabela Matricula
CREATE TABLE matricula (
    id_matricula NUMBER DEFAULT seq_matricula.NEXTVAL PRIMARY KEY,
    id_aluno NUMBER,
    id_disciplina NUMBER,
    data_matricula DATE,
    status VARCHAR2(20), -- Ativo, Trancado, Concluído
    CONSTRAINT fk_aluno FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno) ON DELETE CASCADE,
    CONSTRAINT fk_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina) ON DELETE CASCADE
);

-- Cria a tabela turma
CREATE TABLE turma (
    id_turma NUMBER DEFAULT seq_turma.NEXTVAL PRIMARY KEY,
    id_professor NUMBER,
    id_disciplina NUMBER,
    semestre VARCHAR2(10),
    horario VARCHAR2(50),
    CONSTRAINT fk_professor FOREIGN KEY (id_professor) REFERENCES professor(id_professor) ON DELETE CASCADE,
    CONSTRAINT fk_turma_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina) ON DELETE CASCADE
);

INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (1,'Maria Fernanda Mendes', to_date('2006-02-23','YYYY-MM-DD'), '081.576.394-84', 'mda-rocha@correia.com', '(041) 0029-5523', 'Trevo Francisco Dias, 32
Santa Isabel
31949694 da Conceição / RN'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (2,'Brenda Moura', to_date('2002-03-23','YYYY-MM-DD'), '019.823.456-24', 'jesusvalentina@da.br', '41 3052 5821', 'Rua Ana Julia da Mata
Vila Califórnia
87919-060 Almeida do Oeste / PA'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (3,'Sr. Luiz Felipe Fogaça', to_date('2005-04-28','YYYY-MM-DD'), '795.046.813-01', 'brunopeixoto@bol.com.br', '31 3889-5510', 'Trecho de Silva, 47
Vila Formosa
64282-097 da Conceição / AC'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (4,'Sr. Augusto da Conceição', to_date('2004-09-08','YYYY-MM-DD'), '895.014.736-00', 'mariane35@das.br', '0500-182-4118', 'Favela Souza, 1
Pantanal
44485524 Freitas / PI'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (5,'Ana Beatriz Rocha', to_date('2003-04-05','YYYY-MM-DD'), '024.961.783-87', 'qgomes@yahoo.com.br', '31 6664-6906', 'Pátio de da Rosa, 68
Conjunto Jardim Filadélfia
61744-297 da Mota / ES'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (6,'Enzo Farias', to_date('2001-10-17','YYYY-MM-DD'), '817.062.539-40', 'da-luzagatha@santos.net', '11 8720-9312', 'Estrada Moura, 68
Dom Silverio
25781301 da Mata / MT'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (7,'Giovanna Fogaça', to_date('2005-12-26','YYYY-MM-DD'), '750.289.316-40', 'dsilva@hotmail.com', '61 8448 4829', 'Feira Helena Moraes
Vila Madre Gertrudes 4ª Seção
75319-701 Ferreira da Serra / SE'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (8,'Mariana Ferreira', to_date('2005-08-04','YYYY-MM-DD'), '598.436.120-51', 'baragao@pinto.com', '31 5134 7046', 'Vila de Campos, 6
Caiçara - Adelaide
19017102 das Neves de Minas / AP'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (9,'Arthur Caldeira', to_date('2000-09-23','YYYY-MM-DD'), '728.915.360-02', 'alana58@sales.br', '51 7944 1087', 'Esplanada de Nascimento, 67
Flamengo
60507467 Nunes Verde / DF'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (10,'Paulo Fogaça', to_date('2000-01-13','YYYY-MM-DD'), '312.680.749-69', 'joao-gabriel74@hotmail.com', '81 7627 6506', 'Largo Monteiro
Vila Nova Cachoeirinha 3ª Seção
94484263 Souza do Galho / RS'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (11,'Felipe da Cruz', to_date('2006-04-07','YYYY-MM-DD'), '970.135.264-52', 'caldeiraemanuella@moraes.br', '21 5951 2490', 'Jardim de Cavalcanti, 77
Das Industrias I
82176-394 da Conceição do Amparo / SE'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (12,'João Lucas Cardoso', to_date('1994-02-14','YYYY-MM-DD'), '374.910.285-60', 'qrezende@hotmail.com', '(061) 0865-1753', 'Lago Ribeiro, 14
Mala E Cuia
41623204 Melo dos Dourados / AM'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (13,'Dr. Diogo das Neves', to_date('1993-09-28','YYYY-MM-DD'), '780.539.462-83', 'ida-mata@gmail.com', '0300 036 6481', 'Morro Elisa Freitas, 68
Atila De Paiva
33784986 Martins / PE'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (14,'Sarah Gonçalves', to_date('2000-03-17','YYYY-MM-DD'), '582.401.367-53', 'marcela65@hotmail.com', '(071) 0047 0018', 'Distrito Porto, 68
Prado
13990-564 Alves de Correia / PA'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (15,'Vitor Fernandes', to_date('2000-10-30','YYYY-MM-DD'), '372.610.859-95', 'heloisa76@hotmail.com', '51 0715 2951', 'Via da Mata, 84
Vila Nova
76925-863 Moraes / AL'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (16,'Yago Pereira', to_date('1996-06-01','YYYY-MM-DD'), '928.607.345-38', 'pedro-lucas79@ribeiro.br', '(041) 8225-1296', 'Colônia de Santos, 5
Fazendinha
58391-916 da Conceição do Galho / PE'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (17,'Sra. Gabriela Martins', to_date('1997-04-20','YYYY-MM-DD'), '985.264.703-29', 'omoreira@uol.com.br', '(084) 8825 0641', 'Avenida Fernandes, 56
Alta Tensão 1ª Seção
64467136 Rocha de Martins / RN'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (18,'Maria Eduarda Moraes', to_date('2002-12-13','YYYY-MM-DD'), '374.056.928-00', 'clara36@gmail.com', '(041) 2070-3297', 'Lagoa Eduarda da Cruz, 921
Vila Petropolis
83563-286 Cardoso / PR'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (19,'Sr. Bernardo Cavalcanti', to_date('2001-08-09','YYYY-MM-DD'), '123.075.684-17', 'almeidadavi-luiz@cunha.br', '71 8752-7233', 'Via de da Mata, 351
Nossa Senhora Da Aparecida
17978-064 Nogueira / BA'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (20,'Rebeca Barbosa', to_date('1997-06-27','YYYY-MM-DD'), '415.760.398-20', 'sophiecardoso@bol.com.br', '61 6540-7915', 'Esplanada de Barros, 7
Independência
07265-801 Monteiro / RN'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (21,'João Miguel Ramos', to_date('1994-02-05','YYYY-MM-DD'), '823.094.175-05', 'unovaes@barbosa.org', '(031) 7729 1808', 'Vale Lucas Monteiro, 65
Penha
60993743 Fernandes / PR'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (22,'Juan Fernandes', to_date('1994-05-14','YYYY-MM-DD'), '813.625.709-40', 'pedro-henriquefreitas@bol.com.br', '51 0707 9214', 'Vila Enrico Farias, 47
Independência
08008437 Fogaça / PB'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (23,'Pedro Henrique Castro', to_date('2004-10-17','YYYY-MM-DD'), '328.615.974-37', 'da-cunhadavi@bol.com.br', '41 1353-2946', 'Via Lima, 261
Vila Independencia 2ª Seção
72280803 Novaes / AL'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (24,'Dra. Yasmin Souza', to_date('1995-11-02','YYYY-MM-DD'), '471.396.028-40', 'carlos-eduardomoura@uol.com.br', '84 2605 4019', 'Passarela de Gomes, 41
Vila São Paulo
38892-893 da Luz / RN'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (25,'Alana Barros', to_date('2002-08-22','YYYY-MM-DD'), '768.521.940-94', 'oliveiravitor-gabriel@hotmail.com', '(041) 5081-4296', 'Parque Teixeira, 15
Leticia
82392244 Moreira / SC'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (26,'Manuela Fogaça', to_date('2004-09-24','YYYY-MM-DD'), '164.238.750-90', 'castrobenicio@silveira.com', '71 6241 6687', 'Loteamento Maria Clara Aragão, 15
Caiçara - Adelaide
20540062 da Cunha da Mata / PI'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (27,'Pedro Henrique Melo', to_date('1997-12-01','YYYY-MM-DD'), '127.945.630-25', 'barrosmaria@lima.net', '81 3984 9067', 'Rua de Nogueira, 506
Floresta
18304335 da Paz do Campo / PA'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (28,'Lavínia Ferreira', to_date('1997-01-22','YYYY-MM-DD'), '856.430.971-84', 'jesusrafael@mendes.net', '(084) 2140 6294', 'Largo de Porto, 48
Nova Gameleira
78594-510 das Neves do Norte / DF'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (29,'Levi Barbosa', to_date('2003-05-19','YYYY-MM-DD'), '563.920.418-42', 'mda-cruz@duarte.net', '(021) 9930 0301', 'Rodovia Ferreira, 58
Vila Satélite
16157-935 Moraes de Goiás / SP'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (30,'Arthur da Costa', to_date('1999-04-20','YYYY-MM-DD'), '367.489.520-00', 'raquel62@silveira.com', '(061) 2014-3936', 'Aeroporto Barros, 6
Vila Da Ária
85232680 Dias do Amparo / PB'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (31,'Alícia Rezende', to_date('2003-12-24','YYYY-MM-DD'), '309.127.658-95', 'pedro-henriquemoraes@da.br', '(061) 1659 2820', 'Morro de da Luz, 76
Parque São Pedro
65245-863 da Rocha / PA'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (32,'Gustavo Henrique Castro', to_date('2005-08-07','YYYY-MM-DD'), '583.401.729-05', 'alexandre80@melo.org', '21 1627 6898', 'Viaduto Lorenzo Vieira, 7
Novo Santa Cecilia
83883-305 Pereira / RO'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (33,'Diogo Santos', to_date('1999-11-13','YYYY-MM-DD'), '463.172.089-13', 'lfreitas@fernandes.com', '(031) 1406-5722', 'Viaduto Cunha, 3
Araguaia
45689-655 Rocha do Campo / RS'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (34,'Henrique Pires', to_date('2002-08-01','YYYY-MM-DD'), '432.508.769-92', 'ygoncalves@ig.com.br', '41 7772-7961', 'Rua Carolina Gomes, 60
Bela Vitoria
72468410 Nascimento / RN'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (35,'Vitória Moreira', to_date('1996-11-14','YYYY-MM-DD'), '890.514.623-60', 'ypires@da.net', '11 8379 8435', 'Rua Helena Duarte, 65
Vila Havaí
82795-288 Moraes / PB'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (36,'Sra. Bárbara da Cunha', to_date('1994-08-01','YYYY-MM-DD'), '153.074.962-06', 'afarias@hotmail.com', '0900 545 3502', 'Rodovia de Lopes, 14
Araguaia
15495284 Farias / DF'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (37,'Laís Moreira', to_date('1997-02-01','YYYY-MM-DD'), '721.356.094-80', 'bruna00@das.br', '31 1714-4704', 'Viaduto Natália da Rocha, 56
Vila Copacabana
22453642 Fernandes Grande / RN'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (38,'Isadora Souza', to_date('2003-12-11','YYYY-MM-DD'), '136.028.749-31', 'caldeirarenan@hotmail.com', '84 5007 3914', 'Feira de Almeida, 533
Tiradentes
50784-849 da Luz Paulista / RR'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (39,'Olivia Pires', to_date('2000-11-21','YYYY-MM-DD'), '258.469.073-00', 'fmonteiro@yahoo.com.br', '(061) 5895 1229', 'Rua Benjamin Teixeira, 75
Alto Barroca
89370104 da Rosa dos Dourados / AM'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (40,'João Miguel Teixeira', to_date('2002-03-16','YYYY-MM-DD'), '648.573.192-09', 'mariane27@castro.com', '(051) 8316-1282', 'Viaduto Viana, 214
Conjunto Santa Maria
74413-888 Almeida de Porto / SP'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (41,'Benjamin Aragão', to_date('2000-05-14','YYYY-MM-DD'), '814.073.695-39', 'kaiquenunes@rodrigues.br', '(011) 7736-5083', 'Área de Campos, 596
Vila Da Paz
90487-702 Fernandes do Campo / RJ'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (42,'Dr. Caio Almeida', to_date('1996-05-04','YYYY-MM-DD'), '654.183.279-09', 'dbarros@uol.com.br', '(081) 8486 7561', 'Travessa de Almeida, 6
Paraíso
07898803 Araújo do Oeste / RR'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (43,'Ana Vitória da Paz', to_date('1996-10-20','YYYY-MM-DD'), '368.542.791-19', 'teixeiramaria-sophia@mendes.br', '21 7959 9493', 'Estação Cardoso, 472
Vila Das Oliveiras
78512-217 Sales do Campo / CE'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (44,'João Pedro da Mata', to_date('1999-09-05','YYYY-MM-DD'), '608.417.592-94', 'vda-paz@uol.com.br', '71 6132-1990', 'Lago de Barbosa, 148
Flamengo
94546-477 Rezende / RS'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (45,'Dr. Marcelo Jesus', to_date('1997-01-25','YYYY-MM-DD'), '869.145.307-93', 'luiz-miguel11@nascimento.com', '0800-419-3925', 'Travessa de Nunes, 3
Vila Nova Gameleira 3ª Seção
87903684 Souza da Prata / BA'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (46,'Rafael Lima', to_date('2003-10-09','YYYY-MM-DD'), '730.581.642-62', 'raquel09@bol.com.br', '11 9615 3273', 'Favela Gonçalves
São Luiz
53999506 Lopes das Flores / RO'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (47,'Evelyn Costa', to_date('1999-11-17','YYYY-MM-DD'), '925.648.710-11', 'pvieira@nascimento.com', '21 4612 2654', 'Recanto Moreira, 30
Vila Mangueiras
79445-118 Alves Paulista / AL'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (48,'Bruno Duarte', to_date('1996-05-19','YYYY-MM-DD'), '509.836.217-21', 'lopesalexandre@hotmail.com', '81 9100 1952', 'Campo Gabriela Azevedo, 54
Jardim Felicidade
61628-001 Pires do Sul / AL'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (49,'Nicole Martins', to_date('2002-08-19','YYYY-MM-DD'), '681.039.425-70', 'xlima@da.org', '(011) 4025 3521', 'Avenida de Rocha, 858
Vila Esplanada
09158238 Moreira do Campo / RO'); 
INSERT  INTO aluno (id_aluno, nome, data_nascimento, cpf, email, telefone, endereco) VALUES (50,'Bianca Ramos', to_date('1998-08-18','YYYY-MM-DD'), '190.238.476-87', 'das-nevespedro-lucas@hotmail.com', '(021) 6986 2507', 'Pátio Moraes, 85
Jatobá
14367429 Souza / MS');


INSERT INTO professor (nome, especialidade, email, telefone, endereco) 
VALUES ('Luiza Pinto', 'Engenheiro de Software', 'prof1@example.com', '11 99999-1111', 'Rua Exemplo, 123');

INSERT INTO professor (nome, especialidade, email, telefone, endereco) 
VALUES ('Vinícius Vieira', 'Cientista da Computação', 'prof2@example.com', '21 99999-2222', 'Avenida Exemplo, 456');

INSERT INTO curso (nome, descricao, carga_horaria) VALUES
('Análise e Desenvolvimento de Sistemas', 'Curso com ênfase em desenvolvimento de sistemas.', 2500);
INSERT INTO curso (nome, descricao, carga_horaria) VALUES
('Ciência da Computação', 'Curso de bacharel que explora os diversos campos da informática.', 3600);
INSERT INTO curso (nome, descricao, carga_horaria) VALUES
('Engenharia de Software', 'Curso de Engenharia de Software com ênfase em desenvolvimento de sistemas.', 3600);

INSERT INTO disciplina (id_disciplina, nome, descricao, id_curso, carga_horaria) 
    VALUES (1, 'Algoritmos e Estruturas de Dados', 'Disciplina básica sobre algoritmos e estruturas de dados.', 1, 60);
INSERT INTO disciplina (id_disciplina, nome, descricao, id_curso, carga_horaria) 
    VALUES(2, 'Banco de Dados', 'Disciplina sobre modelagem e implementação de bancos de dados.', 1, 60);
INSERT INTO disciplina (id_disciplina, nome, descricao, id_curso, carga_horaria) 
    VALUES(3, 'POO', 'Disciplina sobre programação orientada à objetos.', 1, 45);

INSERT INTO disciplina (id_disciplina, nome, descricao, id_curso, carga_horaria) 
    VALUES (4, 'Algoritmos e Estruturas de Dados', 'Disciplina básica sobre algoritmos e estruturas de dados.', 2, 60);
INSERT INTO disciplina (id_disciplina, nome, descricao, id_curso, carga_horaria) 
    VALUES(5, 'Banco de Dados', 'Disciplina sobre modelagem e implementação de bancos de dados.', 2, 60);
INSERT INTO disciplina (id_disciplina, nome, descricao, id_curso, carga_horaria) 
    VALUES(6, 'POO', 'Disciplina sobre programação orientada à objetos.', 2, 45);

INSERT INTO disciplina (id_disciplina, nome, descricao, id_curso, carga_horaria) 
    VALUES (7, 'Algoritmos e Estruturas de Dados', 'Disciplina básica sobre algoritmos e estruturas de dados.', 3, 60);
INSERT INTO disciplina (id_disciplina, nome, descricao, id_curso, carga_horaria) 
    VALUES(8, 'Banco de Dados', 'Disciplina sobre modelagem e implementação de bancos de dados.', 3, 60);
INSERT INTO disciplina (id_disciplina, nome, descricao, id_curso, carga_horaria) 
    VALUES(9, 'POO', 'Disciplina sobre programação orientada à objetos.', 3, 45);

INSERT INTO turma (id_professor, id_disciplina, semestre, horario) 
    VALUES(1, 1, '2024.1', 'Segunda e Quarta - 08:00 às 10:00');
INSERT INTO turma (id_professor, id_disciplina, semestre, horario) 
    VALUES(2, 2, '2024.1', 'Terça e Quinta - 10:00 às 12:00');

INSERT INTO turma (id_professor, id_disciplina, semestre, horario) 
    VALUES(1, 3, '2024.1', 'Segunda e Quarta - 10:00 às 12:00');
INSERT INTO turma (id_professor, id_disciplina, semestre, horario) 
    VALUES(2, 4, '2024.1', 'Terça e Quinta - 08:00 às 10:00');

INSERT INTO turma (id_professor, id_disciplina, semestre, horario) 
    VALUES(1, 5, '2024.1', 'Terça e Quinta - 10:00 às 12:00');
INSERT INTO turma (id_professor, id_disciplina, semestre, horario) 
    VALUES(2, 6, '2024.1', 'Segunda e Quarta - 08:00 às 10:00');

INSERT INTO turma (id_professor, id_disciplina, semestre, horario) 
    VALUES(1, 7, '2024.1', 'Terça e Quinta - 08:00 às 10:00');
INSERT INTO turma (id_professor, id_disciplina, semestre, horario) 
    VALUES(2, 8, '2024.1', 'Segunda e Quarta - 10:00 às 12:00');

INSERT INTO turma (id_professor, id_disciplina, semestre, horario) 
    VALUES(1, 9, '2024.1', 'Sexta - 08:00 às 10:00');

INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(3, 1, to_date('2024-03-28', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(3, 1, to_date('2024-04-22', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(4, 1, to_date('2024-07-02', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(5, 1, to_date('2024-04-05', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(8, 1, to_date('2024-02-22', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(10, 1, to_date('2024-03-22', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(10, 1, to_date('2024-02-03', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(12, 1, to_date('2024-07-21', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(12, 1, to_date('2024-03-16', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(14, 1, to_date('2024-01-08', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(14, 1, to_date('2024-08-13', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(15, 1, to_date('2024-08-19', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(17, 1, to_date('2024-07-07', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(18, 1, to_date('2024-03-06', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(18, 1, to_date('2024-09-15', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(20, 1, to_date('2024-07-01', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(22, 1, to_date('2024-05-03', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(23, 1, to_date('2024-04-29', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(23, 1, to_date('2024-03-04', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(24, 1, to_date('2024-01-04', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(27, 1, to_date('2024-02-15', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(29, 1, to_date('2024-08-18', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(29, 1, to_date('2024-08-11', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(30, 1, to_date('2024-01-25', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(33, 1, to_date('2024-04-21', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(34, 1, to_date('2024-03-22', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(35, 1, to_date('2024-07-22', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(35, 1, to_date('2024-05-05', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(39, 1, to_date('2024-02-14', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(40, 1, to_date('2024-01-03', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(40, 1, to_date('2024-08-09', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(42, 1, to_date('2024-03-29', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(44, 1, to_date('2024-05-14', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(45, 1, to_date('2024-05-21', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(45, 1, to_date('2024-09-17', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(47, 1, to_date('2024-07-30', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(48, 1, to_date('2024-08-19', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(50, 1, to_date('2024-01-05', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(3, 3, to_date('2024-03-28', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(3, 3, to_date('2024-04-22', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(5, 3, to_date('2024-04-05', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(8, 3, to_date('2024-02-22', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(12, 3, to_date('2024-07-21', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(14, 3, to_date('2024-08-13', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(18, 3, to_date('2024-09-15', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(29, 3, to_date('2024-08-11', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(30, 3, to_date('2024-01-25', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(33, 3, to_date('2024-04-21', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(35, 3, to_date('2024-07-22', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(35, 3, to_date('2024-05-05', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(40, 3, to_date('2024-01-03', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(42, 3, to_date('2024-03-29', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(2, 2, to_date('2024-01-17', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(2, 2, to_date('2024-07-22', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(4, 2, to_date('2024-05-20', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(5, 2, to_date('2024-06-10', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(8, 2, to_date('2024-09-18', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(9, 2, to_date('2024-04-19', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(9, 2, to_date('2024-06-29', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(15, 2, to_date('2024-04-07', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(17, 2, to_date('2024-06-22', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(20, 2, to_date('2024-07-27', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(22, 2, to_date('2024-02-27', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(24, 2, to_date('2024-06-11', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(27, 2, to_date('2024-05-01', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(28, 2, to_date('2024-01-28', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(28, 2, to_date('2024-05-13', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(30, 2, to_date('2024-07-07', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(32, 2, to_date('2024-02-20', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(32, 2, to_date('2024-09-18', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(33, 2, to_date('2024-04-14', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(34, 2, to_date('2024-08-09', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(38, 2, to_date('2024-03-08', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(38, 2, to_date('2024-08-02', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(39, 2, to_date('2024-05-24', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(42, 2, to_date('2024-06-18', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(44, 2, to_date('2024-06-23', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(47, 2, to_date('2024-04-09', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(48, 2, to_date('2024-09-18', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(50, 2, to_date('2024-08-22', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(19, 9, to_date('2024-07-26', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(19, 9, to_date('2024-04-04', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(43, 9, to_date('2024-05-21', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(1, 4, to_date('2024-06-29', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(1, 5, to_date('2024-06-03', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(6, 5, to_date('2024-04-03', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(6, 5, to_date('2024-01-08', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(7, 8, to_date('2024-06-09', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(7, 7, to_date('2024-05-23', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(11, 5, to_date('2024-04-06', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(11, 5, to_date('2024-03-01', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(13, 8, to_date('2024-09-18', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(13, 8, to_date('2024-01-04', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(16, 5, to_date('2024-03-21', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(16, 4, to_date('2024-03-26', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(19, 7, to_date('2024-07-26', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(19, 7, to_date('2024-04-04', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(21, 4, to_date('2024-03-23', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(21, 5, to_date('2024-05-11', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(25, 8, to_date('2024-03-15', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(25, 7, to_date('2024-08-11', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(26, 4, to_date('2024-04-14', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(26, 5, to_date('2024-03-22', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(31, 4, to_date('2024-03-25', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(31, 5, to_date('2024-02-23', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(36, 5, to_date('2024-02-11', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(36, 4, to_date('2024-06-17', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(37, 8, to_date('2024-09-16', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(37, 8, to_date('2024-04-03', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(41, 4, to_date('2024-06-24', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(41, 4, to_date('2024-02-01', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(43, 7, to_date('2024-05-21', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(43, 7, to_date('2024-02-20', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(46, 5, to_date('2024-01-25', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(46, 5, to_date('2024-08-09', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(49, 7, to_date('2024-07-31', 'YYYY-MM-DD'), 'Concluído');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(49, 8, to_date('2024-05-28', 'YYYY-MM-DD'), 'Trancado');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(21, 6, to_date('2024-03-23', 'YYYY-MM-DD'), 'Ativo');
INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES(41, 6, to_date('2024-06-24', 'YYYY-MM-DD'), 'Ativo');

COMMIT;

--1 Listar alunos ordenados por nome e data de nascimento
SELECT nome, data_nascimento
FROM aluno
ORDER BY nome ASC, data_nascimento ASC

--2 Listar professores e suas especialidades em ordem decrescente
SELECT nome, especialidade
FROM professor
ORDER BY nome DESC, especialidade ASC

--3 Listar disciplinas ordenadas por carga horária
SELECT nome, carga_horaria
FROM disciplina
ORDER BY carga_horaria DESC

--4 Contar o número de alunos em cada status de matrícula
SELECT STATUS, COUNT(*) AS total
FROM matricula
GROUP BY status

--5 Listar cursos com a soma total da carga horária de suas disciplinas
SELECT C.nome AS curso, SUM(d.carga_horaria) AS carga_total_das_disciplinas
FROM curso c
INNER JOIN disciplina d ON c.id_curso = d.id_curso
GROUP BY c.nome

--6 Contar quantos professores estão lecionando mais de 3 turmas
SELECT p.nome AS professor, COUNT(t.id_turma) AS turmas_total
FROM professor p
INNER JOIN turma t ON p.id_professor = t.id_professor
GROUP BY p.nome
HAVING COUNT(t.id_turma) > 3;

--7 Listar os alunos matriculados em mais de uma disciplina
SELECT a.nome AS aluno, COUNT(m.id_matricula) AS total_disciplina
FROM aluno a
INNER JOIN matricula m ON a.id_aluno = m.id_aluno
GROUP BY a.nome
HAVING COUNT(m.id_matricula) > 1
ORDER BY total_disciplina DESC;

    
--8 Listar cursos com mais de 2000 horas de carga horária
SELECT c.nome AS curso, SUM(d.carga_horaria) AS total_de_cargas
FROM curso c
INNER JOIN disciplina d ON c.id_curso = d.id_curso
GROUP BY c.nome
HAVING SUM(d.carga_horaria) > 2000;

--9  Contar o número total de turmas e listar por professor
SELECT p.nome AS professor, COUNT(t.id_turma) AS total_turmas
FROM professor p
INNER JOIN turma t ON p.id_professor = t.id_professor
GROUP BY p.nome
ORDER BY total_turmas DESC;

--10 Listar disciplinas e a média da carga horária por curso
SELECT c.nome AS curso, AVG(d.carga_horaria) AS media_carga
FROM curso c
INNER JOIN disciplina d ON c.id_curso = d.id_curso
GROUP BY c.nome;

--11 Exibir os alunos e seus respectivos status de matrícula, ordenados pelo status e pela data de matrícula
SELECT id_aluno, id_disciplina, status, data_matricula
FROM matricula
ORDER BY status ASC, data_matricula DESC;

--12 Exibir a idade dos alunos ordenados da maior para a menor idade
CREATE VIEW vw_alunos_idade AS
SELECT nome, ROUND(MONTHS_BETWEEN(SYSDATE, data_nascimento) / 12) AS idade
FROM aluno
ORDER BY idade DESC;

SELECT * FROM vw_alunos_idade;

--13  Exibir as disciplinas e o número de alunos matriculados em cada uma
CREATE VIEW vw_total_de_alunos AS
SELECT d.nome AS disciplina, COUNT(m.id_matricula) AS total
FROM disciplina d
JOIN matricula m ON d.id_disciplina = m.id_disciplina    
GROUP BY d.nome
ORDER BY total DESC;    

SELECT * FROM vw_total_de_alunos;

--14 Crie uma consulta que exiba o nome dos professores, o nome das disciplinas que eles lecionam e os horários das turmas, ordenando pelos horários.
SELECT p.nome AS professor, d.nome AS disciplina, t.horario AS horario_que_leciona
FROM professor p
INNER JOIN turma t ON p.id_professor = t.id_professor
INNER JOIN disciplina d ON t.id_disciplina = d.id_disciplina
ORDER BY t.horario DESC;

--15 Contar quantas disciplinas têm carga horária superior a 80 horas
SELECT nome, carga_horaria
FROM disciplina
WHERE carga_horaria > 80;

--16 Listar os cursos e a quantidade de disciplinas que cada curso possui
SELECT c.nome AS curso, COUNT(d.nome) total_disciplina 
FROM curso c
INNER JOIN disciplina d ON c.id_curso = d.id_curso
GROUP BY c.nome;

--17 Exibir os professores que têm mais de 2 disciplinas com carga horária superior a 100 horas
SELECT p.nome AS professor, d.nome AS disciplina
FROM professor p
INNER JOIN turma t ON p.id_professor = t.id_professor
INNER JOIN disciplina d ON t.id_disciplina = d.id_disciplina
GROUP BY p.nome, d.nome
HAVING COUNT(d.id_disciplina) > 2 AND SUM(d.carga_horaria) > 100

--18  Listar disciplinas que tenham pelo menos 5 alunos matriculados
SELECT d.nome AS disciplina, COUNT(m.id_aluno) AS total
FROM disciplina d
INNER JOIN matricula m ON d.id_disciplina = m.id_disciplina  
GROUP BY d.nome
HAVING COUNT (m.id_aluno) > 4; 

--19 Exibir o número de alunos por status, ordenando pelos status com mais alunos
SELECT STATUS, COUNT(*) AS total
FROM matricula
GROUP BY status
ORDER BY total DESC;

--20 Listar professores e a soma da carga horária das disciplinas que lecionam
SELECT p.nome AS professor, SUM(d.carga_horaria) AS carga_total
FROM turma t
INNER JOIN disciplina d ON t.id_disciplina = d.id_disciplina
INNER JOIN professor p ON t.id_professor = p.id_professor
GROUP BY p.nome
ORDER BY carga_total DESC;