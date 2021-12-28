#include <string.h>
#include <stdlib.h>
#include <stdio.h>

char *createstr(char *input);

char *concatstrs(const char *str1, const char* str2);

char *charatstr(const char* str1, int i);

char *createstr(char *input){
    int len = strlen(input);
    char *allocd_ptr = (char*)malloc(sizeof(char)*len+1);
    sprintf(allocd_ptr, "%s", input);
    return allocd_ptr;
}

char *concatstrs(const char *str1, const char *str2){
    int len = strlen(str1) + strlen(str2);
    char *allocd_ptr = (char *)malloc(sizeof(char)*len+sizeof(char));
    sprintf(allocd_ptr,"%s%s",str1, str2);
    return allocd_ptr;
}

//Return a null-terminated string of length 2 with index 0 equal to the char
char *charatstr(const char *str1, int i )
{
    int len = strlen(str1);
    //in the event the user passs an out of bounds integer
    if(i > len) return "";
    else
    {
        char c = *(str1+i);
        char *ret = (char *)malloc(2);
        memset(ret,0, 2);
        printf("%c\n",c);
        ret[0] = c;
        return ret;
    }
}



