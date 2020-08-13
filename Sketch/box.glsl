float Box(vec2 coord){
    vec2 p = coord - iResolution.xy * 0.5;
    float l = iResolution.x * 0.1;

    float t = iTime;
    float cs = cos(t), sn = sin(t);
    p = mat2(cs, -sn, sn, cs) * p;

    float d = max(abs(p.x), abs(p.y));
    
    return max(0.0, 1.0 - abs(d-l));
}

void mainImage(out vec4 fragColor, in vec2 fragCoord){
    float c = Box(fragCoord);
    fragColor = vec4(vec3(min(1.0, c)), 1.0);
}