# ezap 

####  An imperative, statically-typed, C-like language designed to bridge the gap between Java and procedural system programming in COMS 3157 by providing primitive socket-networking functionality with minimal overhead to explicitly manage resources utilized by strings and sockets

## Installation setup on Ubuntu 20.04.3


```
sudo apt install ocaml m4 opam cmake
opam init 

wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 13

opam install llvm ocamlbuild
eval $(opam env)
```
The above installation assumes a clean copy of Ubuntu 20.04.3 and is current as of 1/4/22. Additionally if you choose to configure opam beyond the deault settigs during ```opam init``` the last line may not be necessary. 

## Using the ezap Compiler

1. In the top-level directory run ```make``` to compile the **ezap** executable, symlink it to the top-level of the ezap directory and run the regression test suite
2. To just compile the **ezap** compiler run ```make compiler```
3. The **ezap** compiler compiles a **.ez** file to an LLVM IR module and prints it to ```stdout```. If you would like to compile a **.ez** file all the way down to a binary run ```./compiler.sh source.ez```

## Project Resources

* [Final Report](http://www.columbia.edu/~dbl2127/plt/dbl2127_ezap_report.pdf)
* [Slides](http://www.columbia.edu/~dbl2127/plt/PLT_FINAL_Presentation.pdf)
