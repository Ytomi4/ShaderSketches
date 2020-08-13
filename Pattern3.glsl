float box(vec2 st, vec2 size){
    size = vec2(.5) - size * .5;
    vec2 offs = vec2(1e - 4);
    vec2 uv = smoothstep(size, size + offs, st);
    uv *= smoothstep(size, size + offs, vec2(1.) - st);
    return uv.x * uv.y;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord){
    float reso = 16.;
    float cw = iResolution.x / cw;
    fragCoord.x += step(cw, mod(fragCoord.y, cw * 2.)) * .5;
    vec2 st = mod(fragCoord, cw) / cw;

    float c = box(st, vec2(.7));
    vec3 color = vec3(c);
    fragColor = vec4(color, 1.);
}