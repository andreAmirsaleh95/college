#include <stdio.h>
#include "dlist.h"
#include "dnode.h"
 
struct dlist *song_list;

int main(void)
{
	struct dnode *node;

	song_list = dlist_create();

	dlist_add_back(song_list, "Thinking Out Loud");
	dlist_add_back(song_list, "See You Again");
	dlist_add_back(song_list, "Trap Queen");
	dlist_add_back(song_list, "Sugar");
	dlist_add_back(song_list, "Shut Up and Dance");
	dlist_add_back(song_list, "Blank Space");
	dlist_add_back(song_list, "Watch Me");
	dlist_add_front(song_list, "Uptown Funk");
	dlist_add_back(song_list, "Earned It");

	printf("Here are the top %d songs:\n", dlist_length(song_list));

	for (node = song_list->front; node != NULL; node = node->next){
		printf("%s\n", node->str);
	}
	dlist_destroy(song_list);
}