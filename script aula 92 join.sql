create database senai_tech;

use senai_tech;

create table departamentos (
id int,
nome varchar(60),
primary key (id)
);



create table funcionarios (
id int,
nome varchar(60),
sobrenome varchar(60),
salario decimal(10,2),
id_departamento int,
primary key (id),
FOREIGN KEY (id_departamento) REFERENCES
departamentos(id)
);

#Liste nome, sobrenome e nome do departamento dos funcionários.
SELECT f.nome, f.sobrenome, d.nome AS nome_departamento
FROM funcionarios AS f
INNER JOIN departamentos AS d ON f.id_departamento = d.id;

#Liste nome, sobrenome e nome do departamento dos funcionários do departamentos de TI
SELECT f.nome, f.sobrenome, d.nome AS nome_departamento
FROM funcionarios AS f
INNER JOIN departamentos AS d ON f.id_departamento = d.id
WHERE d.nome = 'TI';

#Liste nome, sobrenome e nome do departamento dos funcionários do departamentos de TI ordenado pelo nome
SELECT f.nome, f.sobrenome, d.nome AS nome_departamento
FROM funcionarios f
 INNER JOIN departamentos d ON f.id_departamento = d.id
WHERE d.nome = 'TI'
ORDER BY f.nome;


#Liste nome, sobrenome, salario e nome do departamento dos funcionários do departamentos de TI que recebem acima de 5000 ordenado pelo nome
SELECT f.nome, f.sobrenome, f.salario, d.nome AS nome_departamento
FROM funcionarios AS f
INNER JOIN departamentos AS d ON f.id_departamento = d.id
WHERE d.nome = 'TI' AND f.salario > 5000
ORDER BY f.nome;


#Calcular a média salarial dos funcionários em cada departamento
SELECT d.nome AS departamento, AVG(f.salario) AS media_salarial
FROM departamentos d
 INNER JOIN funcionarios f ON d.id = f.id_departamento
GROUP BY d.id;


#Mostrar o nome completo (concatenando nome e sobrenome) dos funcionários que pertencem ao departamento "TI":
select concat (f.nome,' ', f.sobrenome) as nome_completo
from funcionarios f 
inner join departamentos d on f.id_departamento = d.id 
where d.nome = 'TI';


#Calcular a soma total dos salários de todos os funcionários no departamento de "Recursos Humanos'
SELECT SUM(f.salario) AS total_salarios
FROM funcionarios AS f
INNER JOIN departamentos AS d ON f.id_departamento = d.id
WHERE d.nome = 'Recursos Humanos';


#Contar quantos funcionários cada departamento possui
SELECT d.nome AS departamento, COUNT(f.id) AS quantidade_de_funcionarios
FROM departamentos d
INNER JOIN funcionarios f ON d.id = f.id_departamento
GROUP BY d.id, d.nome;


#Listar os funcionários que ganham mais de 7000 em ordem alfabética
SELECT nome, sobrenome, salario
FROM funcionarios
WHERE salario > 7000
ORDER BY nome, sobrenome;


#Mostrar o nome do departamento e a média de salário dos funcionários de cada departamento
SELECT d.nome AS nome_departamento, AVG(f.salario) AS media_salario
FROM departamentos d
INNER JOIN funcionarios f ON d.id = f.id_departamento
GROUP BY d.id, d.nome;


#Mostrar os funcionários que têm sobrenome “Matisse" e seus respectivos departamentos
SELECT f.nome AS nome_funcionario, d.nome AS nome_departamento
FROM funcionarios f
INNER JOIN departamentos d ON f.id_departamento = d.id
WHERE f.sobrenome = 'Matisse';


#






















