#ifdef GL_ES
precision mediump float;
#endif

float random (in vec2 p) {
    return fract(sin(dot(p.xy, vec2(12.9898, 78.233))) * 43758.5453123);
}

vec2 truchetPattern(in vec2 p, in float index){
    index = fract(((index - .5) * 2.));
    if (index > .75) {
        p = vec2(1.) - p;
    } else if (index > .5) {
        p = vec2(1.-p.x, p.y);
    } else if (index > .25) {
        p = 1. - vec2(1.-p.x, p.y);
    }
    return p;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord){
    float reso = 30.;
    vec2 p = fragCoord.xy/reso;

    vec2 ipos = floor(p);
    vec2 fpos = fract(p);

    float tr = floor(iTime * 2.) + 1.;
    vec2 tile = truchetPattern(fpos, random(ipos * tr));

    float c = smoothstep(tile.x-.1, tile.x, tile.y) - smoothstep(tile.x, tile.x+.1, tile.y);
    
    fragColor = vec4(vec3(c), 1.);
}