float circle(vec2 coord, vec2 offs){
    float reso = 16.0;
    float cw = iResolution.x /reso;

    vec2 p = mod(coord, cw) - cw * 0.5 + offs * cw;

    vec2 p2 = floor(coord / cw)- offs;
    vec2 gr = vec2(0.193, 0.272);
    float tr = iTime * 2.0;
    float ts = tr + dot(p2, gr);

    float sn = sin(tr), cs = cos(tr);
    p = mat2(cs, -sn, sn, cs) * p;

    float s = cw * (0.3 + 0.3 * sin(ts));
    float d = max(abs(p.x), abs(p.y));

    return max(0.0, 1.0 - abs(s-d));
}

void mainImage(out vec4 fragColor, in vec2 fragCoord){
    float c = 0.0;

    for(int i = 0; i < 9; i++){
        float dx = mod(float(i), 3.0) - 1.0;
        float dy = float (i / 3) - 1.0;
        c += circle(fragCoord, vec2(dx, dy));
    }

    vec3 col = vec3(min(1.0, c));
    fragColor = vec4(col, 1.0);
}