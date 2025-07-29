use raylib::*;

export fn main() int = {
	const screen_width: int = 800;
	const screen_height: int = 450;

	const bg = Color {
		r=0x18,
		g=0x18,
		b=0x18,
		a=0xFF,
	};

	const yellow = Color {
		r=0xFF,
		g=0xDD,
		b=0x33,
		a=0xFF,
	};
	
	init_window(screen_width, screen_height, "Raylib [core] example - basic window");
	set_target_fps(60);
	
	for (!window_should_close()) {
		begin_drawing();
		clear_background(bg);
		draw_text("Here's what you had on your clipboard:", 0, 0, 30, yellow);
		draw_text(get_clipboard_text(), 0, 60, 20, yellow);
		end_drawing();
	};

	close_window();

	return 0;

};
