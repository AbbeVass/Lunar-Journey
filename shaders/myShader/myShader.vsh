#ifdef _YY_HLSL11_
// HLSL shader code here
struct VS_INPUT {
    float2 position : POSITION;
    float2 texcoord : TEXCOORD0;
};

struct PS_INPUT {
    float4 position : SV_POSITION;
    float2 texcoord : TEXCOORD0;
};

PS_INPUT main(VS_INPUT input) {
    PS_INPUT output;
    output.position = float4(input.position, 0.0, 1.0);
    output.texcoord = input.texcoord;
    return output;
}



#else
// GLSL shader code here
attribute vec2 in_Position;
attribute vec2 in_TextureCoord;
varying vec2 v_vTexcoord;

void main() {
    gl_Position = vec4(in_Position.x, in_Position.y, 0.0, 1.0);
    v_vTexcoord = in_TextureCoord;
}



#endif