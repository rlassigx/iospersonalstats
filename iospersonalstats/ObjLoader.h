/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#include <stdio.h>
#include <stdlib.h>
#include <memory.h>
#include <math.h>

typedef struct {
    float position[3];
} Vertex;

typedef struct {
    int indices[4];
} Quad;

typedef struct {
    int nv;
    Vertex* vertices;
    int nf;
    Quad* quads;
} Model;

Model* loadFile(const char* fileName);
