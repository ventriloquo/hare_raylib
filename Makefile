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

doc:
	@rm -rf doc
	@mkdir doc
	@haredoc -t -Fhtml raylib > doc/temp
	@echo '<head> <meta charset="utf-8" /> <meta name="viewport" content="width=device-width, initial-scale=1"> </head> <style>:root{--color:#dcd7ba;--background-color:#1F1F28;--background-color-alt:#2A2A37;--color-red:#FF5D62;--color-yellow:#FF9E3B;--color-orange:#FFA066;--color-blue:#7e9cd8;--color-green:#98BB6C;--color-purple:#957fbb;--color-pink:#D27E99;--color-light-blue:#7AA89F;--color-light-yellow:#C0A36E;--color-light-purple:#9CABCA;--border:solid 3px var(--color-purple)}::-webkit-scrollbar{display:none}*{font-family:monospace;scroll-behavior:smooth}body{display:block;margin:1em auto;padding:1em;max-width:80ch;background-color:var(--background-color);border-radius:5px}summary{color:var(--color-purple);padding:0 1em}a{text-decoration:none;color:var(--color-blue)}a:hover{opacity:80%}pre{padding:1em;color:var(--color);background-color:var(--background-color-alt);border:solid 1px var(--background-color-alt);margin-left:auto;margin-right:auto;border-radius:5px;overflow:scroll}ol,ul{color:var(--color)}p{color:var(--color);margin:1em 0}h1{color:var(--color)}h2{color:var(--color);display:none}h2>.heading-extra,h3,h4,h4 .heading-extra{display:none}.keyword{color:var(--color-purple)}.type{color:var(--color-light-blue)}.comment{color:var(--color-pink)}.heading-body{color:var(--color-purple);font-size:larger}.heading-extra{color:var(--color-yellow)}.heading-extra a{color:var(--color-pink);float:right}.readme{background-color:var(--background-color-alt);border:var(--border);border-radius:5px;margin-top:1em;padding:2em 1em .5em 1em;position:relative;overflow-x:scroll}.readme::before{content:"README";position:absolute;color:var(--background-color);background-color:var(--color-purple);left:0;top:0;padding:2px 1em;border-end-end-radius:10px}.sample{display:block;background-color:var(--background-color-alt)}.member{border:solid 1px var(--background-color-alt);border-radius:5px;padding:15px}.member>h4{color:var(--color);display:block!important}.member:has(h4){display:none}h4+pre{display:block}.member:has(h4:target){display:block}.red{color:var(--color-red)}.blue{color:var(--color-blue)}.yellow{color:var(--color-yellow)}.green{color:var(--color-green)}.purple{color:var(--color-purple)}.orange{color:var(--color-orange)}.lblue{color:var(--color-light-blue)}.lpurple{color:var(--color-light-purple)}.lyellow{color:var(--color-light-yellow)}span:has(+span){color:inherit}.title{color:var(--color-green);font-size:x-large}.quote,.note,.tip,.important,.warning,.caution{padding:1em;background-color:var(--background-color-alt);color:var(--color-light-blue);border-left:solid 5px var(--color-light-blue);border-radius:5px;position:relative}.note,.tip,.important,.warning,.caution{padding-top:3em}.note{color:var(--color-blue);border-color:var(--color-blue)}.tip{color:var(--color-green);border-color:var(--color-green)}.important{color:var(--color-purple);border-color:var(--color-purple)}.warning{color:var(--color-yellow);border-color:var(--color-yellow)}.caution{color:var(--color-red);border-color:var(--color-red)}.note::before,.tip::before,.important::before,.warning::before,.caution::before{position:absolute;top:0;left:0;padding:2px 1em;color:var(--background-color);border-end-end-radius:10px}.note::before{content:"nota";background-color:var(--color-blue)}.tip::before{content:"dica";background-color:var(--color-green)}.important::before{content:"importante";background-color:var(--color-purple)}.warning::before{content:"alerta";background-color:var(--color-yellow)}.caution::before{content:"cuidado";background-color:var(--color-red)}@media only screen and (max-width:800px){pre{border:none}.member{border:none;padding:1em}p{overflow-x:scroll}} </style>' > doc/index.html
	@cat doc/temp >> doc/index.html
	@rm doc/temp


