// Kontrollera om surface finns, annars skapa den
//if (!surface_exists(global.screen_surface)) {
//    global.screen_surface = surface_create(display_get_width(), display_get_height());
//}
//
//var mat = camera_get_view_mat(view_camera[0]);
//var verts = matrix_transform_vertex(mat, obj_player.x, obj_player.y, 0);
//
//// Sätt surface som målyta
//surface_set_target(global.screen_surface);
//
//// Rensa surface för att undvika rester från tidigare ramar
//draw_clear_alpha(c_black, 0);
//
//// Rita bakgrunden först
//draw_sprite(spr_SkyBackground, 0, 0, 0); // Byt 'spr_background' till din bakgrundssprite och 0,0 till rätt position
//draw_sprite(spr_GroundBackground, 0, 0, 0);
//draw_sprite(spr_cave, 0, 0, 0);
//draw_sprite(spr_houseTree, 0, 0, 0);
//draw_sprite(spr_bench, 0, 0, 0);
//draw_sprite(spr_Door_StepsForHouse, 0, 0, 0);
//draw_sprite(player, 0, 0, 0);
//draw_sprite(spr_Tree2, 0, 0, 0);
//draw_sprite(spr_Tree1, 0, 0, 0);
//
//// Rita alla objekt i världen till samma surface
//draw_self(); // GameMaker ritar objekten automatiskt om de saknar egna Draw Events
//
//// Avsluta ritningen på surface
//surface_reset_target();
//
//// Aktivera shadern
//shader_set(Shader2);
//
//// Hämta uniform-variablerna från shadern
//var shader_position = shader_get_uniform(Shader2, "player_position");
//var shader_radius = shader_get_uniform(Shader2, "circle_radius");
//
//// Skicka spelarens position och cirkelns radie till shadern
//shader_set_uniform_f(shader_position, verts[0], verts[1]); // Karaktärens x och y position
//shader_set_uniform_f(shader_radius, 100); // Cirkels radie
//
//// Rita surface till skärmen med shadern
//draw_surface(global.screen_surface, 0, 0);
//
//// Stäng av shadern
//shader_reset();
