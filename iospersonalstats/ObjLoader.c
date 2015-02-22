/*
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 */
#include "ObjLoader.h"

Model* loadFile(const char* fileName)
{
  Model* result = malloc(sizeof(Model));
    int nv = 0, nf = 0;
    int count = 0;
    
    FILE *f = fopen(fileName, "r");
    if (f == NULL) {
        return 0;
    } else {
        char buffer[256];
        while(!feof(f))
        {
            memset(buffer,0, 256-1);
            fgets(buffer, 256, f);
            if (strncmp("v ", buffer, 2) == 0) {
                nv++;
            }
            if( strncmp("f ", buffer, 2) == 0)
            {
                nf++;
            }
        }
    }
    fclose(f);

    result->nv = nv;
    result->nf = nf;
    result->vertices = malloc(sizeof(Vertex) * result->nv);
    result->quads = malloc(sizeof(Quad) * result->nf);

    f = fopen(fileName, "r");
    if (f == NULL) {
      return 0;
    } else {
        int i = 0;
        int j = 0;
        char buffer[256];
        char buffer1[256];
        char buffer2[256];
        char buffer3[256];
        char buffer4[256];

        float rx;
        float ry;
        float rz;
        while(!feof(f))
        {
            memset(buffer, 0, 256-1);
            memset(buffer1, 0, 256-1);
            memset(buffer2, 0, 256-1);
            memset(buffer3, 0, 256-1);
            memset(buffer4, 0, 256-1);

            fgets(buffer, 256, f);
            if(strncmp("v ",buffer, 2) == 0)
            {
                    if (3 == sscanf(buffer, "v %f %f %f", &rx, &ry, &rz)) {
                        result->vertices[i].position[0] = rx;
                        result->vertices[i].position[1] = ry;
                        result->vertices[i].position[2] = rz;
                        i++;
                    } else {
                        return 0;
                    }
            } else if(strncmp("f ", buffer, 2) == 0) {
                   if (4 == sscanf(buffer, "f %s %s %s %s", buffer1, buffer2, buffer3, buffer4)) {
                       int a, b, c;
                       if (2 == sscanf(buffer1, "%d//%d", &a, &b)) {
                           result->quads[j].indices[0] = a - 1;
                       } else if (3 == sscanf(buffer1, "%d/%d/%d", &a, &b, &c)) {
                           result->quads[j].indices[0] = a - 1;
                       } else if (1 == sscanf(buffer1, "%d", &a)){
                           result->quads[j].indices[0] = a - 1;
                       } else {
                           return 0;
                       }
                       if (2 == sscanf(buffer2, "%d//%d", &a, &b)) {
                           result->quads[j].indices[1] = a - 1;
                       } else if (3 == sscanf(buffer2, "%d/%d/%d", &a, &b, &c)) {
                           result->quads[j].indices[1] = a - 1;
                       } else if (1 == sscanf(buffer2, "%d", &a)){
                           result->quads[j].indices[1] = a - 1;
                       } else {
                           return 0;
                       }
                       if (2 == sscanf(buffer3, "%d//%d", &a, &b)) {
                           result->quads[j].indices[2] = a - 1;
                       } else if (3 == sscanf(buffer3, "%d/%d/%d", &a, &b, &c)) {
                           result->quads[j].indices[2] = a - 1;
                       } else if (1 == sscanf(buffer3, "%d", &a)){
                           result->quads[j].indices[2] = a - 1;
                       } else {
                           return 0;
                       }
                       if (2 == sscanf(buffer4, "%d//%d", &a, &b)) {
                           result->quads[j].indices[3] = a - 1;
                       } else if (3 == sscanf(buffer4, "%d/%d/%d", &a, &b, &c)) {
                           result->quads[j].indices[3] = a - 1;
                       } else if (1 == sscanf(buffer4, "%d", &a)){
                           result->quads[j].indices[3] = a - 1;
                       } else {
                           return 0;
                       }
                       j++;
                  } else if (3 == sscanf(buffer, "f %s %s %s %s", buffer1, buffer2, buffer3, buffer4)) {
                      int a, b, c;
                      if (2 == sscanf(buffer1, "%d//%d", &a, &b)) {
                          result->quads[j].indices[0] = a - 1;
                      } else if (3 == sscanf(buffer1, "%d/%d/%d", &a, &b, &c)) {
                          result->quads[j].indices[0] = a - 1;
                      } else if (1 == sscanf(buffer1, "%d", &a)){
                          result->quads[j].indices[0] = a - 1;
                      } else {
                          return 0;
                      }
                      if (2 == sscanf(buffer2, "%d//%d", &a, &b)) {
                          result->quads[j].indices[1] = a - 1;
                      } else if (3 == sscanf(buffer2, "%d/%d/%d", &a, &b, &c)) {
                          result->quads[j].indices[1] = a - 1;
                      } else if (1 == sscanf(buffer2, "%d", &a)){
                          result->quads[j].indices[1] = a - 1;
                      } else {
                          return 0;
                      }

                      if (2 == sscanf(buffer3, "%d//%d", &a, &b)) {
                          result->quads[j].indices[2] = a - 1;
                          result->quads[j].indices[3] = a - 1;
                      } else if (3 == sscanf(buffer3, "%d/%d/%d", &a, &b, &c)) {
                          result->quads[j].indices[2] = a - 1;
                          result->quads[j].indices[3] = a - 1;
                      } else if (1 == sscanf(buffer3, "%d", &a)){
                          result->quads[j].indices[2] = a - 1;
                          result->quads[j].indices[3] = a - 1;
                      } else {
                          return 0;
                      }
                      j++;
                    } else {
                    }
                }
         }
    }
    fclose(f);
    return result;
}
