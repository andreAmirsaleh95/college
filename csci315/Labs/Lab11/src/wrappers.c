#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/wait.h>
#include <netdb.h>
#include <fcntl.h>
#include <stdlib.h>
#include "wrappers.h"

pid_t Fork(void) {
  pid_t pid;
  if ((pid=fork()) == -1) {
    perror("Fork Error");
    exit(-1);
  }
  else {
    return pid;
  }
}

int Pipe(int pipefd[2]) {
  int pip = pipe(pipefd);
  if (pip == -1) {
    perror("Pipe Error");
    exit(-1);
  }
  else {
    return pip;
  }
}

pid_t Wait(int *status) {
    pid_t pid;
    if ((pid  = wait(status)) < 0) {
	  perror("Wait error");}
    return pid;
}

pid_t Waitpid(pid_t pid, int *iptr, int options) {
    pid_t retpid;
    if ((retpid  = waitpid(pid, iptr, options)) < 0) {
	  perror("Waitpid error");
	  exit(-1);
	}
    return(retpid);
}

int Open(const char *pathname, int flags, mode_t mode) {
    int rc;
    if ((rc = open(pathname, flags, mode))  < 0) {
	  perror("Open error");
	  exit(-1);
	}
    return rc;
}

void Close(int fd) {
    int rc;
    if ((rc = close(fd)) < 0) {
	  perror("Close error");
	  exit(-1);	
	}
}

int Write(int fd, const void *buf, size_t count) {
  ssize_t ret;
  if ((ret=write(fd,buf,count)) == -1) {
    perror("Write Error");
    exit(-1);
  }
  else {
    return ret;
  }
}

int Read(int fd, void *buf, size_t count) {
  ssize_t ret;
  if ((ret=read(fd, buf, count)) == -1) {
    perror("Read Error");
    exit(-1);
  }
  else {
    return ret;
  }
}

void Connect(int sockfd, struct sockaddr *serv_addr, int addrlen) {
    int rc;
    if ((rc = connect(sockfd, serv_addr, addrlen)) < 0){
	  perror("Connect error");
	  exit(-1);
	}
}

void Bind(int sockfd, struct sockaddr *my_addr, int addrlen) {
    int rc;
    if ((rc = bind(sockfd, my_addr, addrlen)) < 0) {
	  perror("Bind error");
	  exit(-1);
	}
}

void Listen(int s, int backlog) {
    int rc;
    if ((rc = listen(s,  backlog)) < 0) {
	  perror("Listen error");
	  exit(-1);
	}
}


int Accept(int s, struct sockaddr *addr, socklen_t *addrlen) {
    int rc;
    if ((rc = accept(s, addr, addrlen)) < 0) {
	  perror("Accept error");
	  exit(-1);
	}
    return rc;
}

int Recv(int sockfd, void *buf, size_t len, int flags) {
    ssize_t ret;
	if ((ret=recv(sockfd, buf, len, flags)) < 0) {
      perror("Receive error");
      exit(-1);
    }
	else {
	  return ret;
	}
}

int Send(int sockfd, const void *buf, size_t len, int flags) {
	ssize_t ret;
	if ((ret=send(sockfd, buf, len, flags)) < 0) {
	  perror("Send error");
	  exit(-1);
	}
	else {
	  return ret;
	}
}

int Socket(int domain, int type, int protocol) {
	int sd;
	if ((sd = socket(domain, type, protocol)) < 0) {
	  perror("Socket error");
	  exit(-1);
	}
	else {
	  return sd;
	}
}

int Getaddrinfo(const char *node, const char *service, const struct addrinfo *hints, struct addrinfo **res) {
	int ret;
	if ((ret = getaddrinfo(node, service, hints, res) != 0)) {
	  printf("Getaddrinfo error: %s\n", gai_strerror(ret));
	  exit(-1);
	}
	else {
	  return ret;
	}
}

void *Memset(void *s, int c, size_t n) {
	int* ret;
	if ((ret = memset(s, c, n)) < 0) {
	  perror("Memset error");
	  exit(-1);
	}
	else {
	  return ret;
	}
}

