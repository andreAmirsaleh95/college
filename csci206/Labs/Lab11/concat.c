/*
 * CSCI 206 Computer Organization & Programming
 * Author: L. Felipe Perrone
 * Date: 2011-09-26
 * Copyright (c) 2011 Bucknell University
 *
 * Permission is hereby granted, free of charge, to any individual or
 * institution obtaining a copy of this software and associated
 * documentation files (the "Software"), to use, copy, modify, and
 * distribute without restriction, provided that this copyright and
 * permission notice is maintained, intact, in all copies and supporting
 * documentation.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL BUCKNELL UNIVERSITY BE LIABLE FOR ANY CLAIM, DAMAGES
 * OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
 * OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#include <stdio.h>
#include <string.h>

/*
 * Collect program arguments into a buffer, then print the buffer
 */
// Received help from Stefano Cobelli
void concat_arguments(int argc, char **argv) {
	int buff_size = 100;
	char buf[buff_size];
	char *p = buf;
	int  i;
	for (i = 1; i < argc; i++) {
		if ( strlen( argv[1] ) > ( buff_size + 1 ) ) {
			break;
		}
		strncpy(p, argv[i], strlen( argv[1] ));
		p += strlen(argv[i]);
		buff_size -= strlen( argv[i] ) + 1;
		if (i + 1 != argc) {
			*p++ = ' ';	/* Add a space back in */
		} else {
			*p++ = '\0';
		}
	}
	printf("%s\n", buf);
}

int main(int argc, char **argv) {
	concat_arguments(argc, argv);
	return 0;
}