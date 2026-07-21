#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>

int main() {
    char line[200];

    while(1)
    {
	    printf("\033[0;31mmyshell>\033[0m");
	    fgets(line, sizeof(line), stdin);
	    line[strcspn(line, "\n")] = '\0';
	    
	    if(strcmp(line, "exit") == 0) break;

	    char cmd[32], arg[64], path[64];
	    //int n = sscanf(line, "%31s %63s", cmd, arg);

	    int n = 1;
	    
	    char *token = strtok(line, " ");
		if (token == NULL) continue;      // nothing typed
		strcpy(cmd, token);
		n = 1;

		token = strtok(NULL, " ");
		if (token != NULL) {              // is there really a 2nd word?
		    strcpy(arg, token);
   		    n = 2;

   		    token = strtok(NULL, " ");
  		    if (token != NULL) {          // is there really a 3rd word?
        		strcpy(path, token);
        		n = 3;
    			}
		}

	    if(strcmp(cmd, "cd") == 0)
	    {
		    chdir(arg);
		    continue;
	    }
	    if(strlen(cmd) == 0) continue;

	    pid_t pid = fork();
	    if(pid == 0)
	    {
		    if(n==1)
		    {
			    execvp(cmd, (char*[]){cmd, NULL});
		    }
		    else if(n==2){
		    	    execvp(cmd, (char *[]){cmd,arg, NULL});
			}
		    else if(n==3){
			    execvp(cmd, (char *[]){cmd, arg, path, NULL});
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
