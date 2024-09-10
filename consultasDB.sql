/*
Instrumento de evaluación de Bases de Datos Relacionales con MySQL

Instrucciones:
A continuación, se te proporcionará un esquema de tabla llamado empleados y un conjunto de datos insertados en dicha tabla.
Realizar las HH consultas solicitadas utilizando las funciones específicas de MySQL estudiadas.
Para cada consulta, escriba el código SQL correspondiente y explique brevemente qué hace la consulta y qué resultado se espera obtener.
Todas las respuestas deben ser escritas claramente, y los resultados deben estar bien justificados.
*/

# Crear la tabla
CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    salario DECIMAL(10,2),
    fecha_contratacion DATE,
    departamento VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO empleados (nombre, apellido, salario, fecha_contratacion, departamento, email) VALUES
('Juan', 'Pérez', 3500.50, '2023-01-10', 'Ventas', 'juan.perez@empresa.com'),
(' Ana', 'Gómez', 4200.75, '2021-04-25', 'Marketing', 'ana.gomez@empresa.com'),
('Carlos  ', 'Rodríguez', 3100.00, '2020-11-15', 'TI', 'carlos.rodriguez@empresa.com'),
('María', 'López', 2800.30, '2019-07-19', 'Recursos Humanos', 'maria.lopez@gmailempresa.com'),
('Luis', 'Fernández', 5000.00, '2018-02-05', 'Dirección', 'luis.fernandez@empresa.com'),
('Elena', 'Martínez', 4500.50, '2022-08-08', 'Ventas', 'elena.martinez@empresagmail.edu'),
('David', 'Sánchez', 3800.00, '2020-09-12', 'Marketing', 'david.sanchez@empresa.com'),
('Lucía', 'Ramírez', 3400.75, '2017-03-17', 'TI', 'lucia.ramirez@empresa.com'),
('José', 'Hernández', 4700.20, '2021-10-20', 'Recursos Humanos', 'jose.hernandez@empresa.edu'),
('Sandra', 'Torres', 5200.00, '2016-05-30', 'Dirección', 'sandra.torres@empresa.com'),
('Miguel', 'Ruiz', 3300.00, '2023-02-28', 'Ventas', 'miguel.ruiz@gmailempresa.com'),
('Laura', 'Ramos', 4100.75, '2018-06-11', 'Marketing', 'laura.ramos@empresa.edu'),
('Javier', 'Domínguez', 2900.50, '2019-09-23', 'TI', 'javier.dominguez@empresa.com'),
('Patricia', 'Vega', 4500.00, '2017-12-04', 'Recursos Humanos', 'patricia.vega@empresa.edu'),
('Pedro', 'Gutiérrez', 3800.75, '2021-01-29', 'Dirección', 'pedro.gutierrez@empresa.com'),
(' Alba', 'Castro', 3900.50, '2022-03-07', 'Ventas', 'alba.castro@empresagmail.com'),
('Sergio', 'Díaz', 4200.00, '2020-07-14', 'Marketing', 'sergio.diaz@empresa.edu'),
('Cristina  ', 'Pérez', 3100.20, '2019-12-18', 'TI', 'cristina.perez@gmailempresa.com'),
('Francisco', 'Molina', 4700.50, '2016-04-25', 'Recursos Humanos', 'francisco.molina@empresagmail.com'),
('  Beatriz', 'Ortiz', 5000.00, '2022-09-01', 'Dirección', 'beatriz.ortiz@empresa.edu');

# --------- Realice las consultas ------------

# Obtener el salario módulo 100.
SELECT salario, salario%100 FROM empleados;

# Listar el nombre y  un numero aleatorio para cada empleado
SELECT nombre, rand() FROM empleados;
SELECT nombre, floor(1+rand()*20) FROM empleados;

# Redondear el salario a 1 decimal.
SELECT nombre, salario, ROUND(salario,1) FROM empleados;
SELECT nombre, salario, FORMAT(salario,1) FROM empleados;

# Truncar el salario a 1 decimal.
SELECT nombre, salario, TRUNCATE(salario,1) FROM empleados;

# Obtener la longitud del nombre
SELECT nombre, length(nombre) FROM empleados;

# Concatenar nombre y apellido con un espacio entre ambos.
SELECT nombre, apellido, CONCAT(nombre,' ',apellido) FROM empleados;

# Insertar una cadena HHHH dentro del nombre.
SELECT nombre, CONCAT(nombre,'HHHH');

# Encontrar la posición de la letra 'a' en el nombre.
SELECT nombre, LOCATE('a',nombre) FROM empleados;

# Extraer los primeros 3 caracteres del nombre.
SELECT nombre, LEFT(nombre,3) FROM empleados;

# Obtener la longitud del email.
SELECT email, length(email) FROM empleados;

# Localizar la posición de '@' en el email.
SELECT email, LOCATE('@',email) FROM empleados;

# Convertir el nombre a minúsculas.
SELECT nombre, LOWER(nombre) FROM empleados;

#  Rellenar el nombre con * a la izquierda hasta 10 caracteres.
SELECT CONCAT('**********',nombre) FROM empleados; 
SELECT LPAD(nombre,10,'*') FROM empleados; 

# Eliminar espacios en blanco a la izquierda del nombre.
SELECT nombre, LTRIM(nombre) FROM empleados; 

# Repetir el nombre 3 veces.
SELECT nombre, REPEAT(nombre,3) FROM empleados;

# Reemplazar 'a' por 'x' en el nombre.
SELECT nombre, REPLACE(nombre,'a', 'x') FROM empleados;

# Invertir el nombre.
SELECT nombre, REVERSE(nombre) FROM empleados;

# Extraer los últimos 2 caracteres del nombre.
SELECT nombre, RIGHT(nombre,2) FROM empleados;

# Añadir 5 espacios en blanco entre nombre y apellido.
SELECT nombre, CONCAT(nombre,REPEAT(' ',5),apellido) FROM empleados;

# Añadir 30 días a la fecha de contratación.
SELECT nombre,fecha_contratacion, ADDDATE(fecha_contratacion, INTERVAL 30 DAY) FROM empleados;

# Calcular la diferencia en días entre la fecha de contratación y la fecha actual.
SELECT fecha_contratacion, DATEDIFF(fecha_contratacion, CURDATE()) FROM empleados;

# Añadir 1 mes a la fecha de contratación.
SELECT nombre, fecha_contratacion, ADDDATE(fecha_contratacion, INTERVAL 1 MONTH) FROM empleados;

# Restar 1 semana a la fecha de contratación
SELECT nombre, fecha_contratacion, DATE_SUB(fecha_contratacion, INTERVAL 1 WEEK) FROM empleados;

# Formatear la fecha de contratación en el formato 'día-mes-año'.
SELECT nombre, fecha_contratacion, DATE_FORMAT(fecha_contratacion, '%d/%m/%Y') FROM empleados;

# Obtener el nombre del día de la semana de la fecha de contratación.
SELECT nombre, fecha_contratacion, DAYNAME(fecha_contratacion) FROM empleados;

# Extraer el mes de la fecha de contratación.
SELECT nombre, fecha_contratacion, MONTH(fecha_contratacion) FROM empleados;

# Obtener el último día del mes de la fecha de contratación.
SELECT nombre, fecha_contratacion, LAST_DAY(fecha_contratacion) FROM empleados;

# Obtener el nombre del mes de la fecha de contratación.
SELECT nombre, fecha_contratacion, MONTHNAME(fecha_contratacion) FROM empleados;

# Obtener la fecha y hora actuales.
SELECT NOW() FROM empleados;

# Calcular la diferencia entre la hora actual y las 02:00:00.
SELECT TIMEDIFF(CURTIME(), '02:00:00') FROM empleados;

# ¿Cuantos empleados hay?
SELECT COUNT(nombre) FROM empleados;

# Liste los empleados que se contrataron en el año 2020
/*SELECT nombre,fecha_contratacion FROM empleados WHERE YEAR = 2020;*/

# ¿Cuál es el email del empleado con ID 2+8/2?
SELECT id, nombre, email FROM empleados WHERE id = 2+8/2;

# Liste los nombres y apellidos de los empleados ordenados por fecha de contratación de manera descendente
/*SELECT nombre,apellido,fecha_contratacion FROM empleados WHERE fecha_contratacion DESC ;*/

# ¿Cuáles son los 5 primeros empleados contratados recientemente?
/*SELECT nombre,apellido,fecha_contratacion FROM empleados WHERE fecha_contratacion ASC ;*/

# Liste empleados cuyo email contenga la palabra 'gmail'

# ¿Nombre del empleado más antiguo?

# ¿Cuántos empleados tienen un email que termine en '.edu'?

# ¿Liste los empleados cuyo nombre empieza por 'A'?

# ¿Cuál es la longitud promedio de los apellidos de los empleados?
SELECT apellido, AVG(CHAR_LENGTH(apellido)) FROM empleados;

# ¿Cómo se verían los salarios de los si los invirtiéramos?
SELECT salario, CAST(REVERSE(CAST(salario AS CHAR)) AS UNSIGNED) FROM empleados;

# ¿Cuántos caracteres tiene el email más largo?

# ¿Cómo se verían los departarmentos en mayúsculas?

# Liste solo los departamentos en minuscula

# ¿Cuántos departamentos hay?

# Liste los departamentos sin que se repitan

# ¿Cuántos departamentos sin repetir hay?

# ¿En qué posición se encuentra la letra 'a' en el primer nombre si se ordena el listado por fecha de contratacion de mayor a menor?

# Liste los empleados de manera que primero este el apellido y luego el nombre en una sola culumna, ordenado por salario

# ¿Cuántos empleados tienen la letra 'e' en su apellido?

# ¿Liste los nombres y el email si reemplazamos todos los puntos por guiones bajos?

# Liste el nombre, el correo, departamento y encripte el correo electrónico usando como clave el id del empleado

# Cuánto es el sueldo promedio por deparatamento?

# ¿Cuánto suman los sueldos por departamento?
