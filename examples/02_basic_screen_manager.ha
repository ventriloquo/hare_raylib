// -*- default-directory: "~/Desktop/git/hare_raylib/"; compile-command: "make 02" -*-
use raylib::*;

type game_screen = enum {
	LOGO = 0,
	TITLE,
	GAMEPLAY,
	ENDING,
};

export fn main() int = {    
const screen_width:int = 800;
const screen_height:int = 450;

init_window(screen_width, screen_height, "raylib [core] example - basic screen manager");

let current_screen = game_screen::LOGO;
let frames_counter: int = 0;

set_target_fps(60); 

for (!window_should_close()) {

switch (current_screen) {
	case game_screen::LOGO => frames_counter += 1;
	if (frames_counter > 120) current_screen = game_screen::TITLE;
	case game_screen::TITLE =>
	     if (is_key_pressed(KeyboardKey::KEY_ENTER)
			       || is_gesture_detected(Gestures::GESTURE_TAP)) current_screen = game_screen::GAMEPLAY;
	case game_screen::GAMEPLAY =>
	     if (is_key_pressed(KeyboardKey::KEY_ENTER)
			       || is_gesture_detected(Gestures::GESTURE_TAP)) current_screen = game_screen::ENDING;
	case game_screen::ENDING =>
	     if (is_key_pressed(KeyboardKey::KEY_ENTER)
			       || is_gesture_detected(Gestures::GESTURE_TAP)) current_screen = game_screen::TITLE;
	case => break;
};

begin_drawing();	
clear_background(RAYWHITE);

switch(current_screen) {
	case game_screen::LOGO =>
	     draw_text("LOGO SCREEN", 20, 20, 40, LIGHTGRAY);
	     draw_text("WAIT for 2 SECONDS...", 290, 220, 20, GRAY);
	case game_screen::TITLE =>
	     draw_rectangle(0, 0, screen_width, screen_height, GREEN);
	     draw_text("TITLE SCREEN", 20, 20, 40, DARKGREEN);
	     draw_text("PRESS ENTER or TAP to JUMP to GAMEPLAY SCREEN", 120, 220, 20, DARKGREEN);
	case game_screen::GAMEPLAY =>
	     draw_rectangle(0, 0, screen_width, screen_height, PURPLE);
	     draw_text("GAMEPLAY SCREEN", 20, 20, 40, MAROON);
	     draw_text("PRESS ENTER or TAP to JUMP to ENDING SCREEN", 130, 220, 20, MAROON);
	case game_screen::ENDING =>     
	     draw_rectangle(0, 0, screen_width, screen_height, BLUE);
	     draw_text("ENDING SCREEN", 20, 20, 40, DARKBLUE);
	     draw_text("PRESS ENTER or TAP to RETURN to TITLE SCREEN", 120, 220, 20, DARKBLUE);
	case => break;
};

end_drawing();

};

close_window();

return 0;
};
