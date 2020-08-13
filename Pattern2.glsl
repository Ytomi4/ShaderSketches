#define PI 3.14159265

vec2 rotate2D(vec2 _st, float _angle){
    _st -= .5;
    float cs = cos(_angle), sn = sin(_angle);
    _st = mat2(cs, -sn, sn, cs) * _st;
    _st += .5;
    return _st;
}

float box(vec2 _st, vec2 _size, float _smoothEdge){
    _size = vec2(.5) - _size * .5;
    vec2 aa = vec2(_smoothEdge * .5);
    vec2 uv = smoothstep(_size, _size + aa, _st);
    uv *= smoothstep(_size, _size + aa, vec2(1.) - _st);
    return uv.x * uv.y;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord){
    float reso = 5.;
    float cw = iResolution.x / reso;
    vec2 st = mod(fragCoord, cw) / cw;

    st = rotate2D(st, PI * .25);
    float c = box(st, vec2(.7), .01);
    vec3 col = vec3(c);
    fragColor = vec4(col, 1.);
}