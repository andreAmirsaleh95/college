/*
 * CSCI 206 Computer Organization & Programming
 * Author: L. Felipe Perrone
 * Date: 2011-08-29
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

#ifndef _dlist_H_
#define _dlist_H_

#include <stdint.h>
#include "dnode.h"

/**
 * Doubly-linked list.
 */
struct dlist {
	struct dnode *front; // front node
	struct dnode *back;  // back node
	uint32_t counter;    // number of nodes
};

/**
 * Allocates new dlist dynamically.
 * 
 * @return pointer to the list
 */
struct dlist* dlist_create();

/** 
 * Inserts new node in dlist after the last node.
 *
 * @param l pointer to the list (non-NULL)
 * @param str pointer to a C string to store in new list node
 * returns a pointer to the newly added node
 */
struct dnode* dlist_add_back(struct dlist *l, char *str);

/** 
 * Inserts new node in dlist before the first node.
 *
 * @param l pointer to the list (non-NULL)
 * @param str pointer to a C string to store in new list node
 * returns a pointer to the newly added node
 */
struct dnode* dlist_add_front(struct dlist *l, char *str);

/** 
 * Inserts new node in dlist after the given node n
 *
 * @param l pointer to the list (non-NULL)
 * @param n pointer to a node that must be in the list
 * @param str pointer to a C string to store in new list node
 */
struct dnode* dlist_insert_after(struct dlist* l, struct dnode* n, char * str);

/** 
* Inserts new node in dlist before the given node n
*
* @param l pointer to the list (non-NULL)
* @param n pointer to a node that must be in the list
* @param str pointer to a C string to store in new list node
*/
struct dnode* dlist_insert_before(struct dlist* l, struct dnode* n, char * str);

/**
 * Remove a node from the list
 *
 * @param l pointer to the list (non-NULL)
 * @param n pointer to node to remove from the list (must be in the list!)
 */
struct dnode* dlist_remove(struct dlist* l, struct dnode* n);

/**
 * Returns the first dnode with the given string.
 *  
 * @param l pointer to the list (non-NULL)
 * @parap str pointer to a string
 * @return struct dnode* or NULL if no match
 */
struct dnode* dlist_find(struct dlist *l, char *str);

/**
 * deallocate a list and all dnodes
 */
void dlist_destroy(struct dlist *l);

/**
 * Returns the number of elements in the list (nodes).
 *
 * @param l pointer to the list (non-NULL)
 */
uint32_t dlist_length(struct dlist *l);

/**
 * Returns the first node where the string matches str (use dnode_cmp)
 */
struct dnode* dlist_find(struct dlist* l, char * str); 

/**
 * Inserts a new node with <str> before the node n
 */
struct dnode* dlist_insert_before(struct dlist* l, struct dnode* n, char * str);

/**
 * Inserts a new node with <str> after the node n
 */
struct dnode* dlist_insert_after(struct dlist* l, struct dnode *n, char *str);

/**
 * Removes a node from the list (but does not destroy the node).
 */
struct dnode* dlist_remove(struct dlist* l, struct dnode* n);

#endif /* _dlist_H_ */
