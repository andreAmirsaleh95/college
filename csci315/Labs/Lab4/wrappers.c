#include "wrappers.h"

int Pipe(int pipefd[2]) {
	int p = pipe(pipefd);
	if (-1 == p) {
		perror( "Call to pipe() failed (retirned -1)." );
		exit(-1);
	} else {
		return p;
	}
}

pid_t Fork() {
	pid_t f = fork();
	if (-1 == (int) f) {
		perror("Call to fork() failed (returned -1).");
		exit(-1);
	} else {
		return f;
	}
}

pid_t Wait(int *status) {
	pid_t w = wait(status);
	if (-1 == (int) w) {
		perror("Call to wait(2) failed (returned -1).");
		exit(-1);
	} else {
		return w;
	}
}

pid_t Waitpid(pid_t pid, int *status, int options) {
	pid_t w = waitpid(pid, status, options);
	if (-1 == (int) w) {
		perror("Call to waitpid(2) failed (returned -1).");
		exit(-1);
	} else {
		return w;
	}
}

struct hostent *Gethostbyname(const char *name) {
	struct hostent *ptrh = gethostbyname(name);
	if (((char *)ptrh) == NULL) {
		perror("Call to gethostbyname() failed.");
		exit(-1);
	} else {
		return ptrh;
	}
}

ssize_t Send(int sockfd, const void *buf, size_t len, int flags) {
	ssize_t s = send(sockfd, buf, len, flags);
	if (-1 == (int) s) {
		perror("Call to send(2) failed (returned -1).");
		exit(-1);
	} else {
		return s;
	}
}

ssize_t Recv(int sockfd, void *buf, size_t len, int flags) {
	ssize_t r = recv(sockfd, buf, len, flags);
	if (-1 == (int) r) {
		perror("Call to recv(2) failed (returned -1).");
		exit(-1);
	} else {
		return r;
	}
}

int Open(const char *pathname, int flags) {
	int o = open(pathname, flags);
	if (-1 == o) {
		perror("Call to open(2) failed (returned -1).");
		exit(-1);
	} else {
		return o;
	}
}

int Close(int fd) {
	int c = close(fd);
	if (-1 == c) {
		perror("Cal to close(2) failed (returned -1).");
		exit(-1);
	} else {
		return c;
	}
}

ssize_t Write(int fd, const void *buf, size_t count) {
	ssize_t w = write(fd, buf, count);
	if (-1 == w) {
		perror("Call to write(2) failed (returned -1).");
		exit(-1);
	} else {
		return w;
	}
}

ssize_t Read(int fd, void *buf, size_t count) {
	ssize_t r = read(fd, buf, count);
	if (-1 == r) {
		perror("Call to read(2) failed (returned -1).");
		exit(-1);
	} else {
		return r;
	}
}

int Socket(int domain, int type, int protocol) {
	int s = socket(domain, type, protocol);
	if (s < 0) {
		perror("Call to socket(2) failed.");
		exit(-1);
	} else {
		return s;
	}
}

int Connect(int sockfd, const struct sockaddr *addr, socklen_t addrlen) {
	int c = connect(sockfd, addr, addrlen);
	if (c < 0) {
		perror("Call to connect(2) failed");
		exit(-1);
	} else {
		return c;
	}
}

int Bind(int sockfd, const struct sockaddr *addr, socklen_t addrlen) {
	int b = bind(sockfd, addr, addrlen);
	if (b < 0) {
		perror("Call to bind(2) failed");
		exit(-1);
	} else {
		return b;
	}
}

int Listen(int sockfd, int backlog) {
	int l = listen(sockfd, backlog);
	if (0 > l) {
		perror("Call to listen(2) failed");
		exit(-1);
	} else {
		return l;
	}
}

int Accept(int sockfd, struct sockaddr *addr, socklen_t *addrlen){
	int a = accept(sockfd, addr, addrlen);
	if (a < 0) {
		perror("Call to accept(2) failed");
		exit(-1);
	} else {
		return a;
	}
}

int Getnameinfo(const struct sockaddr *sa, socklen_t salen, char *host, size_t hostlen, char *serv, size_t servlen, int flags) {
	int g = getnameinfo(sa, salen, host, hostlen, serv, servlen, flags);
	if (g != 0) {
		perror("Call to getnameinfo(3) failed");
		exit(-1);
	} else {
		return g;
	}
}