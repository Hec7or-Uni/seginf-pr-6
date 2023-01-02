---
title: Analisis de código estático
author_1: "Héctor Toral Pallás (798095)"
author_2: "Darío Marcos Casalé (795306)"
---

# Analisis de código estático

El análisis de código estático es una técnica de análisis de software que se realiza sobre el código fuente sin necesidad de ejecutarlo. El objetivo de este análisis es encontrar errores en el código fuente, como por ejemplo, errores de sintaxis, errores de lógica, errores de seguridad, etc.

## Programa 1

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
| Division by zero | Líneas 7, 9 | [CWE-369](https://cwe.mitre.org/data/definitions/369.html) | ✅ | ✅ | ✅ |
| Undefined or garbage value returned to caller | Líneas 11 | [CWE-232](https://cwe.mitre.org/data/definitions/232.html) | ✅ | ✅ | ✅ |
| unused parameter (argc) | Líneas 15 | [CWE-563](https://www.cvedetails.com/cwe-details/563/Unused-Variable.html)| ❌ | ✅ | ❌ |
| 'atoi' is unsafe | Líneas 17 | [CWE-190](https://cwe.mitre.org/data/definitions/190)| ❌ | ✅ | ❌ |
| Out of bounds read | Línea 17 | [CWE-129](https://cwe.mitre.org/data/definitions/129.html) | ❌ | ❌ | ✅ |

## Programa 2 (C++)

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
| garbage value due to array index out of bounds | Línea 5 | [CWE-129](https://cwe.mitre.org/data/definitions/129.html) | ✅ | ✅ | ⌛ |
| Either the condition 'x==10' is redundant or the array 'data[2]' is accessed at index 10, which is out of bounds. | Línea 6  |[CWE-129](https://cwe.mitre.org/data/definitions/129.html)| ❌ | ✅ | ⌛ |
| unused parameter (argc) | Línea 11 | [CWE-563](https://www.cvedetails.com/cwe-details/563/Unused-Variable.html)| ❌ | ✅ | ⌛ |
|'atoi' used to convert a string to an integer value, but function will not report conversion errors; consider using 'strtol' instead| Línea 13 |[CWE-190](https://cwe.mitre.org/data/definitions/190)| ❌ | ✅ | ⌛ |

## Programa 3

Este código tiene una fuga de memoria, pero sólo cuando c es 0.

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
| Potential leak of memory | Línea 20 |[CWE-401](https://cwe.mitre.org/data/definitions/401.html)| ✅ | ✅ | ❌ |
| unused parameter | Línea 23 | [CWE-563](https://www.cvedetails.com/cwe-details/563/Unused-Variable.html)| ❌ | ✅ | ❌ |
| 'atoi' used to convert a string to an integer value, but function will not report conversion errors; consider using 'strtol' instead | Línea 25 |[CWE-190](https://cwe.mitre.org/data/definitions/190)| ❌ | ✅ | ❌ |
| Array index out of bounds (si argc < 1) | Línea 25 |[CWE-129](https://cwe.mitre.org/data/definitions/129.html)| ❌ | ❌ | ✅  |

## Programa 4

En el programa 4 hay una vulnerabilidad de división por 0, ya que la función foo devuelve siempre 0, por tanto `3 / foo()` es un error de división por 0.

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
| Division by zero | Línea 8 |[CWE-369](https://cwe.mitre.org/data/definitions/369.html)| ❌ | ❌ | ✅ |

## Programa 5

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
| the value returned by this function should be used | Línea 43, 46,118|[CWE-252](https://cwe.mitre.org/data/definitions/252.html)| ❌ | ✅ | ❌ |
| 'scanf' used to convert a string to an unsigned integer value | Línea 46|[CWE-134](https://cwe.mitre.org/data/definitions/134.html)| ❌ | ✅ | ❌ |
| narrowing conversion from 'unsigned int' to signed type 'char' is implementation-defined | Línea 74 | [CWE-196](https://cwe.mitre.org/data/definitions/196.html) | ❌ | ✅ | ❌ |
| unused variable | Línea 112|  [CWE-563](https://www.cvedetails.com/cwe-details/563/Unused-Variable.html)| ❌ | ✅ | ❌ |
| scanf() without field width limits can crash with huge input data. | Línea 118|[CWE-120](https://cwe.mitre.org/data/definitions/120.html)| ❌ | ✅ | ❌ |
| 	'atoi' used to convert a string to an integer value | Línea 120| [CWE-190](https://cwe.mitre.org/data/definitions/190) | ❌ | ✅ | ❌ |
| index out of bounds | Línea 73, 121 | [CWE-129](https://cwe.mitre.org/data/definitions/129.html) | ❌ | ❌ | ✅ |
| Uninitialized left value | Línea 57, 58, 70, 73, 74, 87, 92 |[cwe-457](https://cwe.mitre.org/data/definitions/457.html)| ❌ | ❌ | ✅ |

Se ha observado lo siguiente:
- `scanf()` devuelve un valor entero, por lo que Codechecker ha detectado una posible vulnerabilidad en la que no se comprueba el valor devuelto por ella.

## Programa 6

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
| unused variable 'snake_vtable'| Línea 19|[cwe-457](https://cwe.mitre.org/data/definitions/457.html)| ❌ | ✅ | ❌ |
| the value returned by this function should be used| Línea 26|[CWE-252](https://cwe.mitre.org/data/definitions/252.html)| ❌ | ✅ | ❌ |
| Array 'cobre.name[6]' accessed at index 16, which is out of bounds.| Línea 28|[CWE-129](https://cwe.mitre.org/data/definitions/129.html)| ❌ | ✅ | ✅ |
| Uninitialized left value | Línea 28 |[cwe-457](https://cwe.mitre.org/data/definitions/457.html)| ❌ | ❌ | ✅ | 

Se ha observado que Frama-C ha generado un falso positivo, ya que ha detectado un acceso fuera de límites y lo ha considerado también como un valor sin inicializar.

## Programa 7

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
| format string is not a string literal (potentially insecure)|Línea 11, 18|[CWE-134](https://cwe.mitre.org/data/definitions/134.html)| ❌ | ✅ | ✅|
| the value returned by this function should be used|Línea 13|[CWE-252](https://cwe.mitre.org/data/definitions/252.html)| ❌ | ✅ | ❌ |
| narrowing conversion from 'unsigned long' to signed type 'int' is implementation-defined|Línea 16|[CWE-196](https://cwe.mitre.org/data/definitions/196.html)| ❌ | ✅ | ❌ |
| Signed overflow |Línea 13|[CWE-190](https://cwe.mitre.org/data/definitions/190)| ❌ | ❌ | ✅ |
| Out of bounds read | Línea 13 |[CWE-129](https://cwe.mitre.org/data/definitions/129.html)| ❌ | ❌ | ✅ |

En la línea 11 se ha detectado un falso positivo, ya que la cadena a imprimir no ha sido introducida por el usuario:
```c
char msg[] = "Bienvenido!\n";
...
printf(msg);
```
Por otro lado, en el caso de la línea 18 la vulnerabilidad detectada está presente ya que la cadena `buf` es el resultado de concatenar los argumentos introducidos por el terminal.

También, en el caso de la línea 13, como inicialmente `argc >= 0` aunque sea de tipo entero con signo, nunca se llegará a desbordar dicha variable ya que el bucle acaba cuando `argc = 0`. Como consecuencia de ello, la vulnerabilidad de acceso fuera de límites detectada por Frama-C también es un falso positivo

## Programa 8

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
|unused variable| Línea 8| [CWE-563](https://www.cvedetails.com/cwe-details/563/Unused-Variable.html)| ❌ | ✅ | ❌ |
|the value returned by this function should be used	| Líneas 19 y 24|[CWE-252](https://cwe.mitre.org/data/definitions/252.html)| ❌ | ✅ | ❌ |
| Incorrect type | Línea 12, 13 |[CWE-704](https://cwe.mitre.org/data/definitions/704.html)| ❌ | ❌ | ✅ |
| Uninitialized left value | Línea 12 |[cwe-457](https://cwe.mitre.org/data/definitions/457.html)| ❌ | ❌ | ✅ | <- FP


## Programa 9 (C++)

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
| Uninitialized variable: resp | Línea 20 | [CWE-665](https://cwe.mitre.org/data/definitions/665.html) | ✅ | ✅ | ⌛ |
|variable 'resp' is used uninitialized whenever function 'main' is called| Línea 18 y 20|[cwe-457](https://cwe.mitre.org/data/definitions/457.html)| ❌ | ✅ | ⌛ |

CodeChecker detecta también el uso de la directiva `using namespace std;` como un problema, pero no lo detecta como vulnerabilidad, si no como una mala práctica de estilo.

## Programa 10 (C++)

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
|destructor of 'CommandExecutor' is public and non-virtual|Línea 8|[CWE-1087](https://cwe.mitre.org/data/definitions/1087.html)| ❌ | ✅ | ⌛ |
|calling 'system' uses a command processor|Línea 12| [CWE-78](https://cwe.mitre.org/data/definitions/78.html) | ❌ | ✅ | ⌛ |
|destructor of 'Greeter' is public and non-virtual|Línea 16|[CWE-1087](https://cwe.mitre.org/data/definitions/1087.html)| ❌ | ✅ | ⌛ |
|unused parameter| Línea 27 y 57|[CWE-563](https://www.cvedetails.com/cwe-details/563/Unused-Variable.html)| ❌ | ✅ | ⌛ |
|scanf() without field width limits can crash with huge input data.|Línea 35|[CWE-120](https://cwe.mitre.org/data/definitions/120.html)| ❌ | ✅ | ⌛ |
|the value returned by this function should be used|Linea 35 y 48|[CWE-252](https://cwe.mitre.org/data/definitions/252.html)| ❌ | ✅ | ⌛ |

De nuevo, CodeChecker detecta también el uso de la directiva `using namespace std;` como un problema, pero no lo detecta como vulnerabilidad, si no como una mala práctica de estilo.
## Bola extra

Para la bola extra se ha utilizado una calculadora de números racionales desarrollada en la asignatura de tecnología de la programación. El código de la calculadora se puede encontrar en el siguiente [enlace](https://github.com/Hec7or-Uni/tprog-ej-1).

#### Base de datos para la compilacion 
`compile_commands.json`
```json
[
  {
    "directory": "/home/kali/Desktop/tprog-ej-1",
    "command": "clang++ -c foo.cpp -o foo.o",
    "file": "Rational.cpp"
  },
  {
    "directory": "/home/kali/Desktop/tprog-ej-1",
    "command": "clang++ -c main.cpp -o main.o",
    "file": "Calculadora.cpp"
  }
]
```

#### Ejecución de CodeChecker

Se ha utilizado codechecker para analizar el código de la calculadora de números racionales ya que permite la automatización de análisis CTU(Cross Translation Unit).<br>
Para ello se ha utilizado el siguiente comando:
```bash
CodeChecker analyze --ctu compile_commands.json -o reports
```

#### Visualización de los reportes generados
```bash
tree reports
```

#### Visualización de los resultados
Ahora procedemos a exportar los resultados a formato HTML
```bash
CodeChecker parse -e html -o html_out reports
```
Si preferimos los resultados en linea de comandos:
```bash
CodeChecker parse reports
```

![image](/assets/bug_report.png)

![image](/assets/stats_report.png)

## Conclusiones
Tras haber completado la practica, podemos concluir que los resultados obtenidos por los diferentes analizadores no son muy similares, es por eso que la combinación de varios suele ser una buena práctica para el desarrollo de software seguro. Sin embargo, cabe destacar que CodeChecker es el único que permite la automatización de análisis CTU(Cross Translation Unit).

## Referencias 
- [CrossTranslationUnit](https://clang.llvm.org/docs/analyzer/user-docs/CrossTranslationUnit.html)
- [CWE MITRE](https://cwe.mitre.org)