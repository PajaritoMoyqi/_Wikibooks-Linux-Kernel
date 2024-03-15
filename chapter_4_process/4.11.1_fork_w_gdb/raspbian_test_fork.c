#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

#define PROC_TIMES 50
#define SLEEP_DURATION 2
#define FORK_MAK_TIMES 3

void raspbian_proc_process( void );

int main( void )
{
    pid_t pid;
    int fork_times = 0;

    pid = fork();

    if ( pid == 0 )
        printf( "start execution of child process...\n" );
    else if ( pid > 0 )
        printf( "start execution of parent process...\n" );
    
    raspbian_proc_process();
}

void raspbian_proc_process( void )
{
    int proc_times;
    for ( proc_times = 0; proc_times < PROC_TIMES; proc_times++ )
    {
        printf( "raspbian tracing...\n" );
        sleep( SLEEP_DURATION );
    }
}