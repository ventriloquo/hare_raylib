use raylib::*;

export fn main() int = {

const screen_width: int = 800;
const screen_height: int = 450;
	
init_window(screen_width, screen_height, "Raylib [core] example - basic window");
set_target_fps(60);
	
for (!window_should_close()) {
	begin_drawing();
	clear_background(RAYWHITE);
	draw_text("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);
	end_drawing();
};
	
close_window();
	
return 0;
	
};
