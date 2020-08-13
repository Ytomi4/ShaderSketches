float circle(vec2 st, float radius){
    st -= vec2(.5);
    float edge = radius * .2;
    return 1. - smoothstep(radius - edge, radius + edge, dot(st, st) * 4.);
}

vec2 movingTiles(vec2 coord){
    float reso = 16.;
    float cw = iResolution.x / reso;
    vec2 s = vec2(step(cw, mod(coord.y, cw*2.)), step(cw, mod(coord.x, cw*2.)));
    float t = iTime * .7;
    if(fract(t) < .5){
        coord.x += s.x * (cw * t * 2.) + (1. - s.x) * (-1. * cw * t * 2.);
    }else{
        coord.y += s.y * (cw * t * 2.) + (1. -s.y) * (-1. * cw * t * 2.);
    }
    return mod(coord, cw) / cw;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord){
    vec2 st = movingTiles(fragCoord);

    float c = circle(st, .2);
    vec3 color = vec3(c);
    fragColor = vec4(color, 1.);
}