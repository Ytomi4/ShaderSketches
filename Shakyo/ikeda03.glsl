// https://thebookofshaders.com/edit.php#10/ikeda-00.frag

#ifdef GL_ES
precision mediump float;
#endif

float random (in float x) {
    return fract(sin(x) * 1e4);
}

float random (in vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453123);
}

float pattern(vec2 st, vec2 v, float t){
    vec2 p = floor(st + v);
    return step(t, random(100. + p*.000001) + random(p.x)*.5);
}

void mainImage (out vec4 fragColor, in vec2 fragCoord) {
    vec2 st = fragCoord.xy/iResolution.x;

    vec2 grid = vec2(100., 50.);
    st *= grid;

    vec2 ipos = floor(st);
    vec2 fpos = fract(st);

    vec2 vel = vec2(iTime*2.*max(grid.x, grid.y));
    vel *= vec2(-1., 0.) * random(1. + ipos.y);

    vec2 offset = vec2(.6, 0.);

    vec3 col = vec3(0.);
    col.r = pattern(st+offset, vel, .5);
    col.g = pattern(st, vel, .5);
    col.b = pattern(st-offset, vel, .5);

    fragColor = vec4(col, 1.);
}
