#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <pthread.h>
#include <unistd.h>
#include <sys/types.h>
#include <signal.h>
#include <sys/wait.h>
#include <dirent.h>
#include <errno.h>
#include <time.h>
#include <pwd.h>
#include "wrappers.h"
#include <sys/stat.h>

#include "dnode.h"
#include "dlist.h"

#define ANSI_COLOR_RED     "\x1b[31m"
#define ANSI_COLOR_GREEN   "\x1b[32m"
#define ANSI_COLOR_YELLOW  "\x1b[33m"
#define ANSI_COLOR_BLUE    "\x1b[34m"
#define ANSI_COLOR_MAGENTA "\x1b[35m"
#define ANSI_COLOR_CYAN    "\x1b[36m"
#define ANSI_COLOR_RESET   "\x1b[0m"

#define GSHELL_BUF_SIZE 1024
#define GSHELL_BUF_SIZE_TOK 64
#define TOK_KEYS " \n"
#define TOK_SEMI ";"
#define TOK_VERT "|"

#define r_end 0
#define w_end 1
#define pipe_buf 25

struct dlist *history; //Stack for history
int flag=0;
int position; 

int gshell_cd(char **args);
int gshell_help(char **args);
int gshell_exit(char **args);
int gshell_stopwatch(char **args);
int gshell_history(char** args);

char* gshell_get_home_directory() {
    struct passwd* pw;
    if (NULL != (pw = getpwuid(getuid()))) {
        return pw->pw_dir;
    } else {
        return NULL;
    }
}

char *builtin_str[] = {
  "cd",
  "help",
  "exit",
  "stopwatch",
  "history"
};

char *directory_display[] = {"ls"}; 

int (*builtin_func[]) (char **) = {
  &gshell_cd,
  &gshell_help,
  &gshell_exit,
  &gshell_stopwatch,
  &gshell_history
};

int gshell_num_builtins() {
  return sizeof(builtin_str) / sizeof(char *);
}

int gshell_cd(char **args)
{
  if (args[1] == NULL) {
	if (chdir(gshell_get_home_directory()) != 0) {
      perror("gshell");
	}
  } else {
    if (chdir(args[1]) != 0) {
      perror("gshell");
    }
  }
  return 1;
}

int gshell_history(char** args) //Prints history
{
  char *str;
  int counter = 0;
  printf("Printing History\n");
  for (str = dlist_iter_end(history); str != NULL; str = dlist_iter_prev(history)){
    	printf("%d  %s\n", counter, str);
	counter++;
  }

  return 1;
}

int gshell_help(char **args)
{
  int i;
  printf("Built-in functions:\n");

  for (i = 0; i < gshell_num_builtins(); i++) {
    printf("  %s\n", builtin_str[i]);
  }

  printf("For non-built in functions, use man.\n");
  return 1;
}

int gshell_exit(char **args)
{
  return 0;
}

int gshell_stopwatch(char **args) {
    pid_t count = Fork();
	int minutes=0;
	int seconds=0;
	int milliseconds=0;
    time_t start = time(NULL);
    if (count == 0) {
        while(1) {
			usleep(10000);
			milliseconds++;
			if (milliseconds == 100) {
			  milliseconds = 0;
			  seconds++;
			  if (seconds == 60) {
			    seconds = 0;
				minutes++;
			  }
			}
			printf("\r %d: %d: %d", minutes, seconds, milliseconds);
			fflush(stdout);
        }
        return 0;
    } else if (count > 0) {
        getchar();
        time_t end = time(NULL);
        kill(count, SIGKILL);
        printf("TOTAL ELAPSED TIME: %f\n", difftime(end, start));
        return 1;
    } else {
        return -1;
    }
}

int gshell_launch(char **args)
{
  pid_t pid; 
  int status;
  char w_msg[pipe_buf];
  char r_msg[pipe_buf];
  int fd[2];

  Pipe(fd); 

  pid = Fork();
  if (pid == 0) {
    //child
    if (execvp(args[0], args) == -1) {
	close(fd[r_end]);   
	w_msg[0] = errno;
	Write(fd[w_end], &w_msg[0], 1);
        close(fd[w_end]);
	exit(errno);
    }   
    exit(0);
  } 
  else {
	//parent
    do {
      wait(&status);
    } while (!WIFEXITED(status) && !WIFSIGNALED(status));
	if (status != 0) {
	  close(fd[w_end]);
	  Read(fd[r_end], &r_msg[0], 1); 
	  close(fd[r_end]);  
	  if (r_msg[0] == 2) {
	    printf("[gshell: invalid or nonexistent function]\n"); 
	  } else {
	  printf("[gshell: program terminated abnormally][%d]\n", status);
	  }
	}
    else {
	  printf("[gshell: program terminated successfully]\n");
	}   
  }
  return 1;
}

int gshell_piper(char **args) {
  //as of now, function requires four arguments (two functions plus input/flags) plus "|" character
  int fd[2];
  int status;
  int pid, pid2;
  //int i=0;
  //int j=0;
  //int q=0;


  char *in_args[]= {args[0], args[1], NULL};
  char *out_args[]={args[3], args[4], NULL};
/*  COULDN'T GET VERSION THAT CAN HANDLE VARIABLE NUMBER OF ARGUMENTS TO WORK
  for (i=0; strcmp(args[i], TOK_VERT) != 0; i++) {
	in_args[i] = args[i]; 
  }
  in_args[i] = NULL;
  
  for (j=i+1; j < position; j++) {
	out_args[q] = args[j];
	q++;  
  }
  printf("%s\n", out_args[0]); 
  out_args[q] = NULL; 
*/
  pipe(fd);
  pid = fork();
  

  if (pid != 0) {
	//child 2
	pid2 = fork();
	if (pid2 == 0) {
	  dup2(fd[0],0);
	  close(fd[1]);
	  gshell_launch(out_args);
	  exit(0);
	}
	else {
	//parent
	  wait(&status);
	  return 1;
	}
  } else {
	//child 1
	dup2(fd[1], 1);
	close(fd[0]);
	gshell_launch(in_args);
	exit(0); 
  }
  return -1; 
/*
  if (fork()) {
    if (fork()) {
	  //parent
	  wait(&status);
	  printf("Parent done\n");
	  return 1;  
	}
	else {
	  	  printf("shit\n");
	  //child2
	  dup2(fd[1], 0);
	  close(fd[0]);
	  execvp(in_args[0], in_args); 
	  exit(0);
    }
  } 
  else {
	//child1
		wait(&status);
		dup2(fd[0], 1);
		close(fd[1]);
		execvp(out_args[0], out_args);
		exit(0); 
  }
  return -1; 
*/
}

int gshell_execute(char **args)
{
  int i;

  if (args[0] == NULL) {
    return 1;
  }

  if (flag == 1) {
	return gshell_piper(args);
  }

  for (i = 0; i < gshell_num_builtins(); i++) {
    if (strcmp(args[0], builtin_str[i]) == 0) {
      return (*builtin_func[i])(args);
    }
  }

  return gshell_launch(args);
}

char **gshell_split_line(char *line) {
  int bufsize = GSHELL_BUF_SIZE_TOK; 
  position = 0;
  char **tokens = malloc(sizeof(char*) * bufsize);
  char *token;
  
  if (!tokens) {
	fprintf(stderr, "Allocation error\n");
	exit(0);
  }

  token = strtok(line, TOK_KEYS);
  while (token != NULL) {
	tokens[position] = token;
	position++;
  
	if (position >= bufsize) {
	  bufsize += GSHELL_BUF_SIZE_TOK;
	  tokens = realloc(tokens, bufsize * sizeof(char*));
	  if (!tokens) {
		fprintf(stderr, "Allocation error\n");
		exit(0);
	  }
	}
	token = strtok(NULL, TOK_KEYS);
  }
  tokens[position] = NULL;
  return tokens;
}

char *gshell_read_line(void) {
  char *buffer = NULL;
  size_t size = 0;
  getline(&buffer, &size, stdin);
  return buffer;
}

char* gshell_get_username() {
    char* username;
    if (NULL != (username = getlogin())) {
        return username;
    } else {
        return "NONE";
    }
}

char* gshell_get_current_directory() {
    char* path = getcwd(NULL, 0);
    if (NULL == path) {
        return NULL;
    }
    char* temp = NULL;
    char* curr_dir = strtok(path, "/");
    while (NULL != (temp = strtok(NULL, "/"))) {
        strcpy(curr_dir, temp);
    }
    if (0 == strcmp(gshell_get_username(), curr_dir)) {
        return "~";
    }
    return curr_dir;
}

void gshell_loop(void) {
  char *line;
  char **args;
  char *semi_token;
  char *temp;  
  int status;
  char *c; 

  do {
    flag = 0; 
	printf(ANSI_COLOR_RED "gshell [%s: %s]> " ANSI_COLOR_RESET, 
        gshell_get_username(), gshell_get_current_directory());
	line = gshell_read_line();
	if (line[0] == 10) {
	  c = gshell_read_line();
      if (c[0] == line[0]) {
		strcpy(line, "ls");  
	  }
	}

	temp = line; 

	if (strchr(temp, 124)!=NULL) {
	  flag = 1;
	}

    semi_token = strtok(line, TOK_SEMI);
    temp = strtok(NULL, TOK_SEMI); 
    args = gshell_split_line(semi_token);

    dlist_add_front(history, semi_token);  //ADD TO HISTORY
 
    status = gshell_execute(args);

    if (temp != NULL) {
	  printf("\n"); 
      args = gshell_split_line(temp); 
      status = gshell_execute(args);
      dlist_add_front(history, temp); 
    }

	free(args);		
	free(line);
  } while (status);

}

int main(int argc, char **argv) {
  history = dlist_create(); 

  gshell_loop();

  return EXIT_SUCCESS;

}
