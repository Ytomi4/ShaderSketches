#define PI 3.14159265

vec2 rotate2D(vec2 st, float angle){
    st -= .5;
    float cs = cos(angle), sn = sin(angle);
    st = mat2(cs, -sn, sn, cs) * st;
    st += .5;
    return st;
}

vec2 tilePattern(vec2 coord){
    float reso = 16.;
    float cw = iResolution.x / reso;

    float index = 0.;
    index += step(cw, mod(coord.x, 2. * cw));
    index += step(cw, mod(coord.y, 2. * cw)) * 2.;

    vec2 st = mod(coord, cw) / cw;

    if(index == 1.){
        st = rotate2D(st, PI*.5);
    }else if(index == 2.){
        st = rotate2D(st, PI*-.5);
    }else if(index == 3.){
        st = rotate2D(st, PI);
    }
    return st;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord){
    vec2 st = tilePattern(fragCoord);
    float c = step(st.x, st.y);
    vec3 col = vec3(c);
    fragColor = vec4(col, 1.);
}