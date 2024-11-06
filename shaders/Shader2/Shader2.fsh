
// GLSL shader code here
varying vec2 v_vTexcoord;

uniform vec2 player_position;
uniform float circle_radius;

void main() {
    // Hämta den ursprungliga färgen från texturen
    vec4 original_color = texture2D(gm_BaseTexture, v_vTexcoord);
    
    // Beräkna avståndet från spelaren till varje pixel
    float distance_from_player = distance(gl_FragCoord.xy, player_position);
    
    // Om pixeln är utanför cirkeln, gör den grå
    if (distance_from_player > circle_radius) {
       float gray = dot(original_color.rgb, vec3(0.299, 0.587, 0.114)); // Gråskala
       gl_FragColor = vec4(vec3(gray), original_color.a);
    } else {
        // Behåll originalfärgen inom cirkeln
        gl_FragColor = original_color;
    }
}
