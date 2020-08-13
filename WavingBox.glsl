float WavingBox(vec2 coord, vec2 offs){
    float reso = 16.;
    float cw = iResolution.x / reso;

    vec2 p = mod(coord, cw) - cw * 0.5 + offs * cw;
    vec2 p2 = floor(coord / cw) - offs;
    float tr = iTime * 2.;

    vec2 gr = vec2(0.193, 0.272);
    float ts = tr + dot(p2, gr);

    float cs = cos(tr), sn = sin(tr);
    p = mat2(cs, -sn, sn, cs) * p;

    float d = max(abs(p.x), abs(p.y));
    float s = cw * (0.3 + 0.3 * sin(ts));

    return max(0., 1. - abs(s-d));
}

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    float c = 0.;
    for(int i = 0; i < 9; i++){
        float dx = mod(float(i), 3.) - 1.;
        float dy = floor(float(i / 3)) - 1.;
        c += WavingBox(fragCoord, vec2(dx, dy));
    }
    fragColor = vec4(vec3(min(1., c)), 1.);
}