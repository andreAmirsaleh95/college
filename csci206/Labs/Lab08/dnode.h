#ifndef _dnode_h_
#define _dnode_h_

struct dnode {
	char *str;
	int length;
	struct dnode *next;
	struct dnode *prev;
};
struct dnode *dnode_create(char *s);

void dnode_destroy(struct dnode *dnode);

int dnode_cmp(struct dnode *n, char *str);

#endif