/*
 * Copyright (c) 2013 Bucknell University
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

#include <stdlib.h>
#include <stdio.h>
#include "circular-list.h"
#include <pthread.h>
#include <semaphore.h>

pthread_mutex_t mutex;
sem_t empty;
sem_t full;


int circular_list_create(struct circular_list *l, int size) {
	l->buffer = calloc(size, sizeof(item));
	l->start = -1;
	l->end = -1;
	l->elems = 0;
	l->size = size;
	pthread_mutex_init(&mutex, NULL);
	sem_init(&empty, 0, size);
	sem_init(&full, 0, 0);
	return 0;
}

int circular_list_insert(struct circular_list *l, item i) {
	sem_wait(&empty);
	pthread_mutex_lock(&mutex);
	if (l->size > l->elems) {
		if (0 > l->start) {
			l->start = 0;
		}
		l->elems++;
		l->end = (l->end + 1) % l->size;
		l->buffer[l->end] = i;
		pthread_mutex_unlock(&mutex);
		sem_post(&full);
		return 0;
	} else {
		printf("ERROR: CALL TO circular_list_insert() FAILED: Buffer full!\n");
		return -1;
	}
}

int circular_list_remove(struct circular_list *l, item *i) {
	sem_wait(&full);
	pthread_mutex_lock(&mutex);
	if (1 > l->elems) {
		printf("ERROR: CALL TO circular_list_remove() FAILED: Buffer empty!\n");
		return -1;
	}
	else {
		*i = l->buffer[l->start];
		l->start = (l->start + 1) % l->size;
		l->elems--;
		pthread_mutex_unlock(&mutex);
		sem_post(&empty);
		return 0;
	}
}
