#include <string.h>
#include <stdlib.h>
#include <stdio.h>

char *createstr(char *input);

char *concatstrs(char *str1, char* str2);

char *createstr(char *input){
    int len = strlen(input);
    char *allocd_ptr = (char*)malloc(sizeof(char)*len+1);
    sprintf(allocd_ptr, "%s", input);
    return allocd_ptr;
}

char *concatstrs(char *str1, char *str2){
    int len = strlen(str1) + strlen(str2);
    char *allocd_ptr = (char *)malloc(sizeof(char)*len+sizeof(char));
    sprintf(allocd_ptr,"%s%s",str1, str2);
    return allocd_ptr;
}




