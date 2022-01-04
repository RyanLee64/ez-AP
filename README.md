# ez-AP

## Installation setup on Ubuntu 20.0.4

sudo apt install ocaml m4 opam cmake

wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 13

opam install llvm
opam install ocamlbuild
sudo apt install llvm-runtime
eval $(opam env)
