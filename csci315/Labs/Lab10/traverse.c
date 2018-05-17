#include "read_dir.h"
#include <time.h>

int main(int argc, char *argv[]) {
	if (2 != argc) {
		printf(" usage: %s [file_name]\n", argv[0]);
		exit(-11);
	}
	process(argv[1]);
	return 0;
}

// traverse a directory tree applying a function when a file is found
void process(char *root) {
	int numOfFiles = 0;
	que_t nameq;
	char dname[MAXLENGTH];
	char cname[MAXLENGTH];
	char prefix[MAXLENGTH];

	struct dirent *dp;
	DIR *dirp;

	initq(&nameq);
	enqueue(root,&nameq);

	// variables that I added:
	int sum_file_sizes = 0; // sum of all the files' sizes
	int smallest_file_size = INT_MAX; // size of the smallest file
	int largest_file_size = -1; // size of the largest file
	int num_dirs = 0; // number of firectories
	int num_reg_files; // number of regular files
	char mru_filename[256]; // name of most recently used file
	char lru_filename[256]; // name of least recently used file
	double secs; // ???
	time_t most_recent_time = 0;
	time_t least_recent_time = LONG_MAX;
	int fd; // file-descriptor
	struct stat file_info;
	struct tm time;
	char asctime_buf[64];

	while (true != queue_empty(nameq)) {
		peek_front(dname, nameq); 
		dequeue(&nameq);
		
		dirp = opendir(dname);
		if (dirp != NULL) { // it is a directory
			if (0 == lstat(dname, &file_info)) {
				if (S_ISLNK(file_info.st_mode)) { // it is a symbolic link (considered a file)
					// print info:
					printf(" processing symbolic link: %s\n", dname);
					numOfFiles++;
					sum_file_sizes += file_info.st_size;
					printf(" time of last modification: %s\n", asctime_buf);

					// FINISH PROCESSING SYMBOLIC LINK:
					num_reg_files++;
					sum_file_sizes += file_info.st_size;
					// adjust smallest file-size-value as needed:
					if (file_info.st_size < smallest_file_size) {
						smallest_file_size = file_info.st_size;
					}
					// adjust largest file-size-value as needed:
					if (file_info.st_size > largest_file_size) {
						largest_file_size = file_info.st_size;
					}
					// adjust most recently used file (filename) as needed:
					secs = difftime(file_info.st_mtime, most_recent_time);
					if (0 < secs) {
						most_recent_time = file_info.st_mtime;
						strcpy(mru_filename, dname);
					}
					// adjust least recently used file (filename) as needed:
					secs = difftime(file_info.st_mtime, least_recent_time);
					if (0 > secs) {
						least_recent_time = file_info.st_mtime;
						strcpy(lru_filename, dname);
					}

				} else { // this directory is not a symbolic link (regular directory)
					num_dirs++;
					printf("directory : %s\n", dname);
					strncpy(prefix, dname, MAXLENGTH);
					strncat(prefix, "/", MAXLENGTH);
					for (dp = readdir(dirp); NULL != dp; dp = readdir(dirp)) {
						if ((strcmp(dp->d_name, "..") != 0) && (strcmp(dp->d_name, ".") != 0)) {
							
							// prevent from infinite loop
							strncpy(cname, prefix, MAXLENGTH);
							
							// concatenate the prefix
							strncat(cname, dp->d_name, MAXLENGTH);  
							enqueue(cname, &nameq);
						}
					}
					closedir(dirp);
				}
			}
		} else { // it is a file
			// test if it is a regular file and not a device or link -- TO-DO
			// if this is a regular file, then process it -- TO-DO
			fd = open(dname, O_RDONLY);
			if (-1 == fd) {
				perror("Failed to open read only file");
				exit(-1);
			}
			if (0 == fstat(fd, &file_info)) { // it is a file (neither directory nor symbolic link)
				numOfFiles++;
				if (S_ISREG(file_info.st_mode)) { // it is a regular file (not fifo, etc.)
					// print info:
					printf(" processing file: %s\n", dname);
					localtime_r(&file_info.st_mtime, &time);
					asctime_r(&time, asctime_buf);
					printf(" time of last modification: %s\n", asctime_buf);

					// FINISH PROCESSING FILE:
					num_reg_files++;
					sum_file_sizes += file_info.st_size;
					// adjust smallest file-size-value as needed:
					if (file_info.st_size < smallest_file_size) {
						smallest_file_size = file_info.st_size;
					}
					// adjust largest file-size-value as needed:
					if (file_info.st_size > largest_file_size) {
						largest_file_size = file_info.st_size;
					}
					// adjust most recently used file (filename) as needed:
					secs = difftime(file_info.st_mtime, most_recent_time);
					if (0 < secs) {
						most_recent_time = file_info.st_mtime;
						strcpy(mru_filename, dname);
					}
					// adjust least recently used file (filename) as needed:
					secs = difftime(file_info.st_mtime, least_recent_time);
					if (0 > secs) {
						least_recent_time = file_info.st_mtime;
						strcpy(lru_filename, dname);
					}
				}
			}
		}
	} // while
		
		printf(" a total of %d files were counted\n", numOfFiles);
		printf(" smallest file size: %d\n", smallest_file_size);
		printf(" largest file size: %d\n", largest_file_size);
		printf(" average file size: %d\n", sum_file_sizes / numOfFiles);
		printf(" total number of directories: %d\n", num_dirs);
		printf(" most recently used file: %s\n", mru_filename);
		printf(" least recently used file: %s\n", lru_filename);
}

// initialize queue data structure
void initq(que_t *q) {
	q->head = q->tail = NULL;
}

// test whether queue data structure is empty
bool queue_empty(que_t q) {
	if (NULL == q.head) {
		 return true;
	} else {
		return false;
	}
}

// add an element to queue
void enqueue(char *name, que_t *q) {
	item_t *temp;
	
	temp = (item_t *)malloc(sizeof(item_t));
	strncpy(temp->name, name, MAXLENGTH);
	temp->next = NULL;
	
	if (true == queue_empty(*q)) {
		q->head = temp;
		q->tail = temp;
	} else {
		q->tail->next = temp;
		q->tail = q->tail->next;
	}
}

// remove an element from the front of the queue
void dequeue(que_t *q) {
	item_t *temp;
	if (true == queue_empty(*q)) {
		printf(" error in dequeue \n");
		exit(-1);
	} else {
		temp = q->head;
		q->head = q->head->next;
		free(temp);
	}
}

// find element at front of queue without removing
void peek_front(char *name, que_t q) {
	if (true == queue_empty(q)) {
		printf(" error in dequeue \n");
		exit(-1);
	} else {
		strncpy(name, q.head->name, MAXLENGTH);
	}
}