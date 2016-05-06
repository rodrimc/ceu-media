CÉU-Media
===
This project aims to create a high-level API for developing multimedia applications using the [CÉU](http://www.ceu-lang.org/) language. The main goal is to explore the reactive/synchronous execution model of the language to create deterministic multimedia applications. 

One of the advantages of our framework is the deterministic control of the passage of time, which makes enables one
to match the application logic time with the presentation time. 

---
Project dependencies:
  * [CÉU] (https://github.com/fsantanna/ceu/)
  * [LibPlay] (https://github.com/TeleMidia/LibPlay)
 
---
The file arch/ceu_main.c and the folder arch/up should be both symbolic links to the following location:
 * ceu_main.c: <ceu-dist>/arch/ceu_main.c
 * up: <ceu-dist>/arch

To compile and execute:
```
$ make all SRC=<path-to-source>
```
The make command outputs binaries to the folder src/build/.
