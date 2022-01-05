# ezap 

####  An imperative, statically-typed, C-like language designed to bridge the gap between Java and procedural system programming in COMS 3157 by providing primitive socket-networking functionality with minimal overhead to explicitly manager resources utilized by strings and sockets

## Installation setup on Ubuntu 20.0.4


```
sudo apt install ocaml m4 opam cmake
opam init 

wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 13

opam install llvm ocamlbuild
eval $(opam env)
```
The above installation assumes a clean copy of Ubuntu 20.0.4 and is current as of 1/4/22. Additionally if you choose to configure opam beyond the deault settigs during ```opam init``` the last line will not be necessary. 
