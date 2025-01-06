#include <stdio.h>
#include <string.h>

void vuln(char *argv)
{
	char buffer[20];
	strcpy(buffer, argv);
	printf("\nHello %s! \n", buffer);
}

int main(int argc, char **argv)
{
	vuln(argv[1]);
	return 0;
}
