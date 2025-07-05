use raylib::*;
use math::*;

// TODO: implement what's required to generate random "buildings" on the background
// https://github.com/raysan5/raylib/blob/master/examples/core/core_2d_camera.c

export fn main() void = {
    const screen_width:  int = 800;
    const screen_height: int = 450;

    init_window(screen_width, screen_height, "raylib [core] example - 2d camera");

    let player = Rectangle { x=400.0, y=280.0, width=40.0, height=40.0 };

    let camera = Camera2D {
	    target	= Vector2 { x = player.x + 20.0, y = player.y + 20.0 },
	    cam_offset	= Vector2 { x = screen_width:f32/2.0, y = screen_height:f32/2.0 },
	    rotation	= 0.0,
	    zoom	= 1.0,
    };

    set_target_fps(60);

    for (!window_should_close()) {
        if (is_key_down(KeyboardKey::KEY_RIGHT)) player.x += 2.0;
        if (is_key_down(KeyboardKey::KEY_LEFT)) player.x -= 2.0;

        // Camera target follows player
        camera.target = Vector2 { x = player.x + 20.0, y = player.y + 20.0 };

        // Camera rotation controls
        if (is_key_down(KeyboardKey::KEY_A)) camera.rotation -= 1.0;
        if (is_key_down(KeyboardKey::KEY_S)) camera.rotation += 1.0;

        // Limit camera rotation to 80 degrees (-40 to 40)
        if (camera.rotation > 40.0) camera.rotation  = 40.0;
        if (camera.rotation < -40.0) camera.rotation = -40.0;

        // Camera zoom controls
        // Uses log scaling to provide consistent zoom speed
        camera.zoom = expf64(logf64(camera.zoom) + (get_mouse_wheel_move():f32 * 0.1)): f32;

        if (camera.zoom > 3.0) camera.zoom = 3.0;
        if (camera.zoom < 0.1) camera.zoom = 0.1;

        // Camera reset (zoom and rotation)
        if (is_key_pressed(KeyboardKey::KEY_R)) {
            camera.zoom = 1.0;
            camera.rotation = 0.0;
        };

        begin_drawing();

            clear_background(RAYWHITE);

            begin_mode_2d(camera);

                draw_rectangle(-6000, 320, 13000, 8000, DARKGRAY);

                draw_rectangle_rec(player, RED);

                draw_line(camera.target.x: int, -screen_height*10, camera.target.x: int, screen_height*10, GREEN);
                draw_line(-screen_width*10, camera.target.y: int, screen_width*10, camera.target.y: int, GREEN);

            end_mode_2d();

            draw_text("SCREEN AREA", 640, 10, 20, RED);

            draw_rectangle(0, 0, screen_width, 5, RED);
            draw_rectangle(0, 5, 5, screen_height - 10, RED);
            draw_rectangle(screen_width - 5, 5, 5, screen_height - 10, RED);
            draw_rectangle(0, screen_height - 5, screen_width, 5, RED);

            draw_rectangle(10, 10, 250, 113, fade(SKYBLUE, 0.5));
            draw_rectangle_lines( 10, 10, 250, 113, BLUE);

            draw_text("Free 2d camera controls:", 20, 20, 10, BLACK);
            draw_text("- Right/Left to move Offset", 40, 40, 10, DARKGRAY);
            draw_text("- Mouse Wheel to Zoom in-out", 40, 60, 10, DARKGRAY);
            draw_text("- A / S to Rotate", 40, 80, 10, DARKGRAY);
            draw_text("- R to reset Zoom and Rotation", 40, 100, 10, DARKGRAY);

        end_drawing();
    };

    close_window();
};
