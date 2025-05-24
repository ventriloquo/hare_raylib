use raylib::*;

//------------------------------------------------------------------------------------------
// Types and Structures Definition
//------------------------------------------------------------------------------------------
type game_screen = enum {
	LOGO = 0,
	TITLE,
	GAMEPLAY,
	ENDING,
};

//------------------------------------------------------------------------------------
// Program main entry point
//------------------------------------------------------------------------------------
export fn main() int = {
    // Initialization
    //--------------------------------------------------------------------------------------
	const screen_width:int = 800;
	const screen_height:int = 450;

	init_window(screen_width, screen_height, "raylib [core] example - basic screen manager");

	let current_screen = game_screen::LOGO;

	// TODO: Initialize all required variables and load all required data here!

	let frames_counter: int = 0;

	set_target_fps(60); // Set desired framerate (frames-per-second)

    //--------------------------------------------------------------------------------------

    // Main game loop
    for (!window_should_close())    // Detect window close button or ESC key
    {
        // Update
        //----------------------------------------------------------------------------------
        switch (current_screen) {
            case game_screen::LOGO =>
                // TODO: Update LOGO screen variables here!

                frames_counter += 1;    // Count frames

                // Wait for 2 seconds (120 frames) before jumping to TITLE screen
                if (frames_counter > 120) {
                    current_screen = game_screen::TITLE;
                };
            case game_screen::TITLE =>
                // TODO: Update TITLE screen variables here!

                // Press enter to change to GAMEPLAY screen
                if (is_key_pressed(KeyboardKey::KEY_ENTER) || is_gesture_detected(Gestures::GESTURE_TAP))
                {
                    current_screen = game_screen::GAMEPLAY;
                };
            case game_screen::GAMEPLAY =>
                // TODO: Update GAMEPLAY screen variables here!

                // Press enter to change to ENDING screen
                if (is_key_pressed(KeyboardKey::KEY_ENTER) || is_gesture_detected(Gestures::GESTURE_TAP))
                {
                    current_screen = game_screen::ENDING;
                };
            case game_screen::ENDING =>
                // TODO: Update ENDING screen variables here!

                // Press enter to return to TITLE screen
                if (is_key_pressed(KeyboardKey::KEY_ENTER) || is_gesture_detected(Gestures::GESTURE_TAP))
                {
                    current_screen = game_screen::TITLE;
                };
            case => break;
        };
        //----------------------------------------------------------------------------------

        // Draw
        //----------------------------------------------------------------------------------
        begin_drawing();

            clear_background(RAYWHITE);

            switch(current_screen) {
                case game_screen::LOGO =>
                    // TODO: Draw LOGO screen here!
                    draw_text("LOGO SCREEN", 20, 20, 40, LIGHTGRAY);
                    draw_text("WAIT for 2 SECONDS...", 290, 220, 20, GRAY);
		    
                case game_screen::TITLE =>
                    // TODO: Draw TITLE screen here!
                    draw_rectangle(0, 0, screen_width, screen_height, GREEN);
                    draw_text("TITLE SCREEN", 20, 20, 40, DARKGREEN);
                    draw_text("PRESS ENTER or TAP to JUMP to GAMEPLAY SCREEN", 120, 220, 20, DARKGREEN);

                case game_screen::GAMEPLAY =>
                    // TODO: Draw GAMEPLAY screen here!
                    draw_rectangle(0, 0, screen_width, screen_height, PURPLE);
                    draw_text("GAMEPLAY SCREEN", 20, 20, 40, MAROON);
                    draw_text("PRESS ENTER or TAP to JUMP to ENDING SCREEN", 130, 220, 20, MAROON);

                case game_screen::ENDING =>
                    // TODO: Draw ENDING screen here!
                    draw_rectangle(0, 0, screen_width, screen_height, BLUE);
                    draw_text("ENDING SCREEN", 20, 20, 40, DARKBLUE);
                    draw_text("PRESS ENTER or TAP to RETURN to TITLE SCREEN", 120, 220, 20, DARKBLUE);

                case => break;
            };

        end_drawing();
        //----------------------------------------------------------------------------------
    };

    // De-Initialization
    //--------------------------------------------------------------------------------------

    // TODO: Unload all loaded data (textures, fonts, audio) here!

    close_window();        // Close window and OpenGL context
    //--------------------------------------------------------------------------------------

    return 0;
};
