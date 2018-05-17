struct snode {
	char str[100];
	int length;
	struct snode *next;
};
struct snode *snode_create(char *s, int length);