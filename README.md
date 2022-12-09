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
| Division by zero | Líneas 7, 9 | [CWE-369](https://cwe.mitre.org/data/definitions/369.html) | ✅ | ⌛ | ⌛ |
| Undefined or garbage value returned to caller | Líneas 11 | [CWE-232](https://cwe.mitre.org/data/definitions/232.html) | ✅ | ⌛ | ⌛ |

## Programa 2

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
| garbage value due to array index out of bounds | Línea 5 |     | ✅ | ⌛ | ⌛ |

## Programa 3

Este código tiene una fuga de memoria, pero sólo cuando c es 0.

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
| Potential leak of memory | Línea 20 |     | ✅ | ⌛ | ⌛ |

## Programa 4

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
| Division by zero | Línea 8|     | ✅ | ⌛ | ⌛ |

## Programa 5

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
|                  |        |     | ❌ | ⌛ | ⌛ |

## Programa 6

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
|                  |        |     | ❌ | ⌛ | ⌛ |

## Programa 7

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
|                  |        |     | ❌ | ⌛ | ⌛ |

## Programa 8

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
|                  |        |     | ❌ | ⌛ | ⌛ |

## Programa 9

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
| Garbage value    | Línea 20 | [
CWE-665](https://cwe.mitre.org/data/definitions/665.html) | ✅ | ⌛ | ⌛ |

## Programa 10

| Vulnerabilidades | Código | CWE | Clang | CodeChecker | frama-c |
| ---------------- | ------ | --- | :---: | :---------: | :-----: |
|                  |        |     | ❌ | ⌛ | ⌛ |

## Conclusiones

## Referencias 
