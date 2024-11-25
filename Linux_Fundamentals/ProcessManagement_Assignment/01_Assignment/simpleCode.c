#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    pid_t pid;

    printf("Parent process ID: %d\n", getpid());

    // Fork a child process
    pid = fork();

    if (pid < 0) {
        // Fork failed
        perror("Fork failed");
        exit(1);
    } else if (pid == 0) {
        // Child process
        printf("Child process: PID = %d, Parent PID = %d\n", getpid(), getppid());
        // Simulate some work in the child process
        sleep(2);
        printf("Child process exiting.\n");
        exit(0);
    } else {
        // Parent process
        printf("Parent process continues running without waiting.\n");
        sleep(10); // Let the parent process continue running
    }

    return 0;
}
