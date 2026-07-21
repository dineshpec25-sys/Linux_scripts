#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>

int main() {
    char line[200];

    while(1)
    {
	    printf("myshell> ");
	    fgets(line, sizeof(line), stdin);
	    line[strcspn(line, "\n")] = '\0';
	    
	    if(strcmp(line, "exit") == 0) break;

	    char cmd[32], arg[64];
	    int n = sscanf(line, "%31s %63s", cmd, arg);

	    if(strlen(cmd) == 0) continue;

	    pid_t pid = fork();
	    if(pid == 0)
	    {
		    if(n==2)
		    {
			    execvp(cmd, (char*[]){cmd, arg, NULL});
		    }
		    else{
		    	    execvp(cmd, (char *[]){cmd, arg, NULL});
			}
		     printf("Failed\n");
		     return 1;
	    }
	    else if(pid > 0)
	    {
	    	wait(NULL);
	    }
	}
    return 0;
}
