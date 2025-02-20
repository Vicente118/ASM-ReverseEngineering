#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int     ft__strlen(const char *str);
int     ft__strcmp(const char *s1, const char *s2);
char    *ft__strcpy(const char *source, const char *destination);

int main()
{
    printf("ft__strlen(\"\")              = %d\n", ft__strlen(""));
    printf("ft__strlen(\"Hello world !\") = %d\n\n", ft__strlen("Hello world !"));

//////////////////////////////////////////////////////////////////////////////////////////////////
   
    char    *source = "Hello world !";
    char    *destination = malloc(sizeof(char) * strlen(source) + 1);

    printf("ft__strcpy(destination, source) = %s\n\n", ft__strcpy(destination, source));
    free(destination);

//////////////////////////////////////////////////////////////////////////////////////////////////
   
    char    *s1 = "Certainement";
    char    *s2 = "Certitude";
    char    *s3 = "";

    printf("ft__strcmp(s1, s2) = %d\n", ft__strcmp(s1, s2));
    printf("ft__strcmp(s1, s3) = %d\n", ft__strcmp(s1, s3));
    printf("ft__strcmp(s1, s1) = %d\n\n", ft__strcmp(s1, s1));

    //////////////////////////////////////////////////////////////////////////////////////////////////


    return 0;
}