int Pipe( int pipefd[2] );
int Fork();
int Read( int fd, void *buf, size_t count );
int Write( int fd, const void *buf, size_t count );