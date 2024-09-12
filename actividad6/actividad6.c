#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

void* thread_function(void* arg) {
    printf("Hilo creado en proceso con PID: %d\n", getpid());
    return NULL;
}

int main() {
    pid_t pid;

    pid = fork();

    if (pid == 0) { 
        fork();

        pthread_t thread;
        pthread_create(&thread, NULL, thread_function, NULL);
        pthread_join(thread, NULL);
    }

    fork();

    sleep(1);

    return 0;
}
