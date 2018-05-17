/*
 * Copyright (c) 2014 Bucknell University
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation;
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * Author: L. Felipe Perrone (perrone@bucknell.edu)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "dlist.h"

void traverse_forward( struct dlist *l ) {
    struct dnode *curr_node = dlist_iter_begin( l );
    while ( curr_node != NULL ) {
        printf( "data = %s\n", curr_node->data );
        curr_node = curr_node->next;
    }
}

int main( int argc, char *argv[] ) {
    struct dlist *list = dlist_create();
    dlist_add_front( list, 64, 0 );
    dnode_setdata( list->front, "Hello" );
    dlist_add_back( list, 64, 64 );
    dnode_setdata( list->back, "Goodbye!" );
    traverse_forward( list );
}