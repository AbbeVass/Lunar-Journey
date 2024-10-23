// Aktivera shadern
shader_set(myShader);

// Hämta uniform-variablerna från shadern
var shader_position = shader_get_uniform(myShader, "player_position");
var shader_radius = shader_get_uniform(myShader, "circle_radius");

// Skicka spelarens position och radien för cirkeln till shadern
shader_set_uniform_f(shader_position, x, y); // Karaktärens x och y position
shader_set_uniform_f(shader_radius, 100); // Cirkels radie, justera efter behov

// Rita världen eller objekten som ska påverkas av shadern
draw_self();

// Stäng av shadern
shader_reset();
