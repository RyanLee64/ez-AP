# "make" Compiles everything and runs the regression tests
LIB = ./stdlib
TEST = ./tests
SRC = ./src


.PHONY : test
test : compiler
	cd $(TEST) && ./testall.sh

# "make compiler" builds the executable as well as the "stdlib" library 

.PHONY : compiler
compiler : clean
	cd $(SRC) && dune build
	ln -s ./_build/default/src/ezap.exe ezap.exe
	cd $(LIB) && make


#
# The _tags file controls the operation of ocamlbuild, e.g., by including
# packages, enabling warnings
#
# See https://github.com/ocaml/ocamlbuild/blob/master/manual/manual.adoc


# "make clean" removes all generated files

.PHONY : clean
clean :
	ocamlbuild -clean
	rm -rf testall.log ocamlllvm *.diff
	rm -f ezap.exe

# Testing the "printbig" example

printbig : printbig.c
	cc -o printbig -DBUILD_TEST printbig.c


