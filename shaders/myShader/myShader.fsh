#ifdef _YY_HLSL11_
// HLSL shader code here
Texture2D gm_BaseTexture : register(t0);
SamplerState gm_Sampler : register(s0);

struct PS_INPUT {
    float4 position : SV_POSITION;
    float2 texcoord : TEXCOORD0;
};

float2 player_position;
float circle_radius;

float4 main(PS_INPUT input) : SV_TARGET {
    // Hämta den ursprungliga färgen från texturen
    float4 original_color = gm_BaseTexture.Sample(gm_Sampler, input.texcoord);
    
    // Beräkna avståndet från spelaren till varje pixel
    float distance_from_player = distance(input.position.xy, player_position);
    
    // Om pixeln är utanför cirkeln, gör den grå
    if (distance_from_player > circle_radius) {
        float gray = dot(original_color.rgb, float3(0.299, 0.587, 0.114)); // Gråskala
        return float4(gray, gray, gray, original_color.a);
    } else {
        // Behåll originalfärgen inom cirkeln
        return original_color;
    }
}




#else
// GLSL shader code here
varying vec2 v_vTexcoord;
uniform sampler2D gm_BaseTexture;
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





#endif