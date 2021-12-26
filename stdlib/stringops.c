#include <string.h>
#include <stdlib.h>
#include <stdio.h>

char *createstr(char *input);

char *createstr(char *input){
    int len = strlen(input);
    char *allocd_ptr = (char*)malloc(sizeof(char)*len);
    sprintf(allocd_ptr, "%s", input);
    return allocd_ptr;
}



