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

	const fg = Color {
		r=0xEE,
		g=0xEE,
		b=0xEE,
		a=0xFF,
	};

	init_window(screen_width, screen_height, "Raylib [core] example - basic window");
	set_target_fps(60);

	const text: str = "Raylib Rocks";
	const font_size: int = 30;

	for (!window_should_close()) {
		begin_drawing();
		clear_background(bg);
		draw_text(text, screen_width/ 2 - (measure_text(text, font_size)/2), screen_height/2, font_size, fg);
		end_drawing();
	};

	close_window();

	return 0;

};
