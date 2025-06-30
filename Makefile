OUT=./bin
FLAGS=-R -L/usr/local/include/ -lraylib -lm

all:
	@mkdir -p bin
	@printf "\e[33mBuilding \e[31mall\e[33m examples\n"
	@for FILE in $$(ls ./examples); do \
		printf "\e[36mBuilding: \e[35m$$(echo $$FILE | awk -F'.ha' '{print $$1}')\n";\
		hare build ${FLAGS} -o ${OUT}/$$(echo $$FILE | awk -F'.ha' '{print $$1}') examples/$$FILE;\
	done
	@printf "\e[32mDone!\e[0m\n"

bin:
	mkdir -p bin

01: bin
	hare build ${FLAGS} -o ${OUT}/01_basic_window examples/01_basic_window.ha
	./${OUT}/01_basic_window

02: bin
	hare build ${FLAGS} -o ${OUT}/02_basic_screen_manager examples/02_basic_screen_manager.ha
	./${OUT}/02_basic_screen_manager

03: bin
	hare build ${FLAGS} -o ${OUT}/03_2d_camera examples/03_2d_camera.ha
	./${OUT}/03_2d_camera

test:
	hare test -lraylib -lm raylib/

