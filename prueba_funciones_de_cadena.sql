CREATE DATABASE prueba_funciones_de_cadena;
---------------------------------------------------------------
/*PRUEBA "ASCCI"*/
USE prueba_funciones_de_cadena;
CREATE TABLE usuarios (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);
INSERT INTO usuarios (nombre) VALUES ('Ana'), ('Bruno'), ('Carlos'), ('Diana'), ('Eduardo');
SELECT nombre, ASCII(nombre) AS valor_ascii FROM usuarios;
DROP TABLE usuarios
/*Explicación de la función ASCII()
ASCII('A') devolverá 65, que es el valor ASCII de la letra 'A'.
La función solo evalúa el primer carácter de la cadena, por lo que el resto de los caracteres no afecta el resultado.
Usos comunes
Comparaciones: Para comparar caracteres o trabajar con valores numéricos en funciones o algoritmos.
Filtrados: Puede ser útil para filtrar registros según el valor ASCII de un carácter, por ejemplo, para seleccionar solo nombres que empiecen con letras mayúsculas.
Codificación y manipulación: Se puede utilizar en procesos que involucren codificaciones o transformaciones de texto.*/
---------------------------------------------------------------
/*PRUEBA BIN*/
CREATE TABLE numeros (
	id INT AUTO_INCREMENT PRIMARY KEY,
    valor_decimal INT NOT NULL
);
INSERT INTO numeros (valor_decimal) VALUES (5), (10), (15), (20), (25);
SELECT valor_decimal, BIN(valor_decimal) AS valor_binario FROM numeros;
DROP TABLE numeros
/*Explicación de la función BIN()
BIN(5) devolverá 101, que es la representación binaria del número decimal 5.
La función toma un número entero y devuelve su equivalente en binario como una cadena de texto.
Usos comunes de BIN()
Cálculos de bits: Se utiliza en operaciones que requieren el uso de bits o manipulación de bits, como máscaras de bits o verificaciones específicas.
Optimización de consultas: Puede ser útil para analizar y optimizar datos almacenados en formato binario, como ciertos algoritmos de compresión.
Transformación de datos: Se utiliza en aplicaciones donde es necesario realizar operaciones con valores binarios o donde se trabaja con sistemas que usan codificaciones binarias.*/
---------------------------------------------------------------
/*PRUEBA BIT_LENGTH*/
CREATE TABLE mensajes (
	id INT AUTO_INCREMENT PRIMARY KEY,
    mensaje VARCHAR(100) NOT NULL
);
INSERT INTO mensajes (mensaje) VALUES ('Hola'), ('Bienvenidos'), ('MySQL Workbench'), ('Base de datos'), ('¡Hasta luego!');
SELECT mensaje, BIT_LENGTH(mensaje) AS longitud_bits FROM mensajes;
DROP TABLE mensajes
/*Explicación de la función BIT_LENGTH()
BIT_LENGTH() calcula la longitud en bits de una cadena. Dado que cada carácter en una cadena de texto (en un conjunto de caracteres estándar como UTF-8) ocupa 8 bits (1 byte), la longitud en bits es simplemente el número de caracteres multiplicado por 8.
Por ejemplo, la palabra 'Hola' tiene 4 caracteres, lo que equivale a 32 bits (4 * 8).
Usos comunes de BIT_LENGTH()
Optimización de espacio: Ayuda a analizar cuántos bits ocupan los datos almacenados, lo que es útil en situaciones donde el tamaño es crítico.
Transmisión de datos: Puede ser útil en aplicaciones de transmisión de datos, donde es importante conocer la cantidad exacta de bits que se deben enviar.
Validación y almacenamiento: Se puede usar para asegurarse de que las cadenas no excedan un tamaño específico en bits, por ejemplo, en sistemas con restricciones estrictas de almacenamiento.*/
---------------------------------------------------------------
/*PRUEBA CHAR*/
CREATE TABLE codigos_ascii (
	id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_ascii INT NOT NULL
);
INSERT INTO codigos_ascii (codigo_ascii) VALUES (65), (66), (67), (68), (69);
SELECT codigo_ascii, CHAR(codigo_ascii) AS caracter FROM codigos_ascii;
SELECT codigo_ascii, CONVERT(CHAR(codigo_ascii)USING utf8) AS caracter FROM codigos_ascii;
DROP TABLE codigos_ascii
/*Explicación de la función CHAR()
CHAR(65) devolverá 'A', que es el carácter correspondiente al valor ASCII 65.
La función puede tomar varios argumentos, por lo que puedes convertir una secuencia de números ASCII en una cadena de texto.
Por ejemplo: CHAR(72, 101, 108, 108, 111) devolverá 'Hello', que son los valores ASCII de las letras H, e, l, l, o.
Usos comunes de CHAR()
Manipulación de caracteres: Convierte valores numéricos en texto basado en la codificación ASCII, lo cual es útil en muchas situaciones donde los datos deben ser interpretados como caracteres.
Generación de cadenas: A veces se utiliza en funciones que generan automáticamente cadenas de texto basadas en valores numéricos, especialmente en sistemas que trabajan con codificaciones.
Sistemas de codificación: Es muy útil en sistemas que manejan codificaciones personalizadas o que necesitan convertir datos almacenados como números en texto.*/
---------------------------------------------------------------
/*PRUEBA CHAR_LENGTH o CHARACTER_LENGTH*/
CREATE TABLE frases (
	id INT AUTO_INCREMENT PRIMARY KEY,
    texto VARCHAR(255) NOT NULL
)
INSERT INTO frases(texto) VALUES ('Hola mundo'), ('MySQL es genial'), ('Prueba de CHAR_LENGTH'), ('12345'), ('¡Hola!');
SELECT texto, CHAR_LENGTH(texto) AS longitud_caracteres FROM frases; 
DROP TABLE frases
/*Explicación de la función CHAR_LENGTH()
CHAR_LENGTH() o CHARACTER_LENGTH() devuelve el número de caracteres en una cadena de texto, independientemente de la cantidad de bytes que ocupen esos caracteres.
En el caso de caracteres multibyte (por ejemplo, en codificaciones como utf8), la longitud en caracteres puede ser diferente de la longitud en bytes.
Por ejemplo, el carácter '¡' ocupa más de un byte, pero cuenta como un solo carácter en CHAR_LENGTH().
Usos comunes de CHAR_LENGTH()
Validación de longitud de texto: Se usa para validar que las cadenas de texto no excedan un número máximo de caracteres (por ejemplo, en formularios o inputs).
Manipulación de cadenas: Puede ayudar en operaciones donde es importante saber cuántos caracteres tiene una cadena antes de realizar manipulaciones como cortar texto, dividir cadenas, etc.
Análisis de datos: En análisis de texto o datos, es útil para identificar cadenas de texto de una longitud específica o para optimizar consultas donde la longitud del texto es relevante.*/
---------------------------------------------------------------
/*PRUEBA COMPRESS*/
CREATE TABLE documentos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    texto_original TEXT NOT NULL,
    texto_comprimido BLOB
)
INSERT INTO documentos (texto_original) VALUES ('Este es un ejemplo de texto que será comprimido para ahorrar espacio'), ('El comando COMPRESS en MySQL utiliza el algoritmo zlib para comprimir datos'), ('Comprimir grandes cantidades de texto puede ser útil para reducir el uso de almacenamiento'), ('Otro ejemplo con una cadena de texto bastante repetitiva: hola hola hola hola');
UPDATE documentos SET texto_comprimido = COMPRESS(texto_original);
SELECT id, texto_original, texto_comprimido FROM documentos;
SELECT id, texto_original, UNCOMPRESS(texto_comprimido) AS texto_descomprimido FROM documentos;
DROP TABLE documentos













