#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <fcntl.h>
#include <stdlib.h>

#ifndef WRAPPER_INCLUDE
#define WRAPPER_INCLUDE

struct sockaddr;
struct addrinfo;

pid_t Fork(void);

int Pipe(int pipefd[2]);

pid_t Wait(int *status);

pid_t Waitpid(pid_t pid, int *iptr, int options);

int Open(const char *pathname, int flags, mode_t mode);

void Close(int fd);

int Write(int fd, const void *buf, size_t count);

int Read(int fd, void *buf, size_t count);

void Connect(int sockfd, struct sockaddr *serv_addr, int addrlen);

void Bind(int sockfd, struct sockaddr *my_addr, int addrlen);

void Listen(int s, int backlog);

int Accept(int s, struct sockaddr *addr, socklen_t *addrlen);

int Recv(int sockfd, void *buf, size_t len, int flags);

int Send(int sockfd, const void *buf, size_t len, int flags);

int Socket(int domain, int type, int protocol);

int Getaddrinfo(const char *node, const char *service, const struct addrinfo *hints, struct addrinfo **res);

void *Memset(void *s, int c, size_t n);

#endif
