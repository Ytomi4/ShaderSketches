float circle(vec2 _st, float _radius){
    vec2 l = _st - vec2(.5, .5);
    return 1. - smoothstep(_radius - (_radius * .01), _radius + ( _radius * .01), dot(l,l) * 4.);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord){
    float reso = 3.;
    float cw = iResolution.x / reso;
    vec2 st = mod(fragCoord, cw) / cw;

    vec3 col = vec3(circle(st,.5));
    fragColor = vec4(col, 1.);
}