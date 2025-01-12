#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

#define STDIN  0
#define STDOUT 1
#define STDERR 2

int main(int argc, char **argv, char ** envp)
{
	if (argc != 2) 
	{
		fprintf(stderr, "Error arguments\n");
		exit(1);
	}

	char *executable  = argv[0];
	char *nasm        = "nasm -f elf64";
	char *letter 	  = argv[1];
	char *end    	  = "64.asm";
	char *o_file      = "64.o";
	int  command_size = strlen(letter) + strlen(end);
	char *command 	  = malloc(command_size + 1);

	for (int i = 0; i < command_size; i++)
	{	
		if (i > strlen(letter) - 1)
			command[i] = end[i - strlen(letter)];
		else
			command[i] = letter[i];
	}
	command[command_size] = '\0';
	const char * full_command[] = { "nasm", "-f", "elf64", command, NULL };
	char * link = malloc(strlen(letter) + strlen(o_file) + 1);
	for (int i = 0; i < strlen(letter) + strlen(o_file); i++)
	{	
		if (i > strlen(letter) - 1)
			link[i] = o_file[i - strlen(letter)];
		else
			link[i] = letter[i];
	}	
	link[strlen(letter) + strlen(o_file)] = '\0';
	const char * linker[] = { "ld", link, NULL };
	
	pid_t pid = fork();

	if (pid < 0)
	{
		fprintf(stderr , "Error while forking\n");
		exit(1);
	}

	if (pid == 0)
	{
		execve("/usr/bin/nasm", (char **)full_command, envp);
			
		fprintf(stderr , "Error execve");
		exit(1);
	}
	
	int status;
	
	if (pid > 0)
	{
		waitpid(pid, &status, 0);
		
		int exit_status = WIFEXITED(status) && WEXITSTATUS(status);	
		if (exit_status != 0)
		{
			fprintf(stderr, "Error nasm assembly : exit with code %d\n", exit_status);
			exit(exit_status);
		}
		free(command);
		execve( "/usr/bin/ld", (char **)linker, envp);	
	}

	return 0;
}
