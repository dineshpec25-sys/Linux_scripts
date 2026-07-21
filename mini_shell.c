#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    pid_t pid = fork();
	
    if (pid == 0) {
	char cmd[10];
	scanf("%s", cmd);
        execvp(cmd, (char *[]){cmd, NULL});
        printf("execvp failed\n");
    } else if (pid > 0) {
        wait(NULL);
        printf("Child finished, parent continuing\n");
    }

    return 0;
}
