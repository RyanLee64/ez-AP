#include <string.h>

char *create_new_str(char *input);

char *create_new_str(char *input){
    int len = strlen(input);
    char *allocd_ptr = (char*)malloc(sizeof(char)*len);
    sprintf(allocd_ptr, "%s", input);
    return allocd_ptr;
}

