---
title: ShellShock
cve: CVE-2014-6271
author_1: "Héctor Toral Pallás (798095)"
author_2: "Darío Marcos Casalé (795306)"
---

# Analisis de código estático

- ✅ 
- ❌ 

## Programa 1

```

----==== Checker Statistics ====----
----------------------------------------------------------------
Checker name                      | Severity | Number of reports
----------------------------------------------------------------
clang-diagnostic-division-by-zero | MEDIUM   |                 1
clang-diagnostic-unused-parameter | MEDIUM   |                 1
cert-err34-c                      | LOW      |                 1
cppcheck-zerodiv                  | HIGH     |                 1
core.DivideZero                   | HIGH     |                 2
core.uninitialized.UndefReturn    | HIGH     |                 1
---------------------------------------------------------------
```

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
| Division by zero | Líneas 7, 9 | [CWE-369](https://cwe.mitre.org/data/definitions/369.html) | ✅ | ✅ | ✅ |
| Undefined or garbage value returned to caller | Líneas 11 | [CWE-232](https://cwe.mitre.org/data/definitions/232.html) | ✅ | ✅ | ✅ |
| unused parameter | Líneas 15 | [CWE-563](https://www.cvedetails.com/cwe-details/563/Unused-Variable.html)| ❌ | ✅ | ❌ |
| 'atoi' used to convert a string to an integer value | Líneas 17 |  | ❌ | ✅ | ⌛ |
	

## Programa 2

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
| garbage value due to array index out of bounds | Línea 5 |     | ✅ | ✅ | ⌛ |
| Either the condition 'x==10' is redundant or the array 'data[2]' is accessed at index 10, which is out of bounds. | Línea 6  |     | ❌ | ✅ | ⌛ |
| unused parameter | Línea 11 | [CWE-563](https://www.cvedetails.com/cwe-details/563/Unused-Variable.html)| ❌ | ✅ | ⌛ |
|'atoi' used to convert a string to an integer value, but function will not report conversion errors; consider using 'strtol' instead| Línea 13 |     | ❌ | ✅ | ⌛ |

## Programa 3

Este código tiene una fuga de memoria, pero sólo cuando c es 0.

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
| Potential leak of memory | Línea 20 |     | ✅ | ✅ | ❌ |
| unused parameter | Línea 23 | [CWE-563](https://www.cvedetails.com/cwe-details/563/Unused-Variable.html)| ❌ | ✅ | ❌ |
| 'atoi' used to convert a string to an integer value, but function will not report conversion errors; consider using 'strtol' instead | Línea 25 |     | ❌ | ✅ | ⌛ |
| Array index out of bounds | Línea 25 |     | ❌ | ❌ | ✅  |

## Programa 4

En el programa 4 hay una vulnerabilidad de división por 0, ya que la función foo devuelve siempre 0, por tanto `3 / foo()` es un error de división por 0.

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
| Division by zero | Línea 8 |[CWE-369](https://cwe.mitre.org/data/definitions/369.html)| ❌ | ❌ | ✅ |

## Programa 5

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
| the value returned by this function should be used | Línea 43, 46,118|     | ❌ | ✅ | ⌛ |
| 'scanf' used to convert a string to an unsigned integer value | Línea 46|     | ❌ | ✅ | ⌛ |
| narrowing conversion from 'unsigned int' to signed type 'char' is implementation-defined | Línea 74 |     | ❌ | ✅ | ⌛ |
| unused variable | Línea 112|  [CWE-563](https://www.cvedetails.com/cwe-details/563/Unused-Variable.html)| ❌ | ✅ | ⌛ |
| scanf() without field width limits can crash with huge input data. | Línea 118|     | ❌ | ✅ | ⌛ |
| 	'atoi' used to convert a string to an integer value | Línea 120|     | ❌ | ✅ | ⌛ |

## Programa 6

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
|unused variable 'snake_vtable'| Línea 19|     | ❌ | ✅ | ⌛ |
|the value returned by this function should be used| Línea 26|     | ❌ | ✅ | ⌛ |
|Array 'cobre.name[6]' accessed at index 16, which is out of bounds.| Línea 28|     | ❌ | ✅ | ⌛ |

## Programa 7

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
|format string is not a string literal (potentially insecure)|Línea 11|     | ❌ | ✅ | ⌛ |
|the value returned by this function should be used|Línea 13|     | ❌ | ✅ | ⌛ |
|narrowing conversion from 'unsigned long' to signed type 'int' is implementation-defined|Línea 16|     | ❌ | ✅ | ⌛ |
|format string is not a string literal (potentially insecure)|Línea 18|     | ❌ | ✅ | ⌛ |

## Programa 8

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
|unused variable| Línea 8| [CWE-563](https://www.cvedetails.com/cwe-details/563/Unused-Variable.html)| ❌ | ✅ | ⌛ |
|the value returned by this function should be used	| Líneas 19 y 24|     | ❌ | ✅ | ⌛ |

## Programa 9

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
| Garbage value    | Línea 20 | [CWE-665](https://cwe.mitre.org/data/definitions/665.html) | ✅ | ✅ | ⌛ |
| do not use namespace using-directives; use using-declarations instead |Línea 5| | ❌ | ✅ | ⌛ |
|variable 'resp' is used uninitialized whenever function 'main' is called| Línea 18 y 20|     | ❌ | ✅ | ⌛ |

## Programa 10

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
|do not use namespace using-directives|Línea 5|     | ❌ | ✅ | ⌛ |
|destructor of 'CommandExecutor' is public and non-virtual|Línea 8|     | ❌ | ✅ | ⌛ |
|calling 'system' uses a command processor|Línea 12|     | ❌ | ✅ | ⌛ |
|destructor of 'Greeter' is public and non-virtual|Línea 16|     | ❌ | ✅ | ⌛ |
|unused parameter| Línea 27 y 57|     | ❌ | ✅ | ⌛ |
|scanf() without field width limits can crash with huge input data.|Línea 35|     | ❌ | ✅ | ⌛ |
|the value returned by this function should be used|Linea 35 y 48|     | ❌ | ✅ | ⌛ |

## Conclusiones

## Referencias 
