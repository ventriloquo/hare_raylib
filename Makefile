OUTDIR=./bin
FLAGS=-R -L/usr/local/include/ -lraylib -lm

all:
	@mkdir -p bin
	@printf "Building all examples\n"
	@for FILE in $$(ls ./examples); do \
		printf "Building: $$(echo $$FILE | awk -F'.ha' '{print $$1}')\n";\
		hare build ${FLAGS} -o ${OUTDIR}/$$(echo $$FILE | awk -F'.ha' '{print $$1}') examples/$$FILE;\
	done
	@printf "Done!\n"

clean:
	rm -rf ${OUTDIR}

doc:
	haredoc -Fhtml raylib > /tmp/index.html

test:
	hare test -lraylib -lm raylib/

