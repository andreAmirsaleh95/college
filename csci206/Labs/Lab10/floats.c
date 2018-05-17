/*
 * CSCI 206 Computer Organization & Programming
 * Author: Alan Marchiori
 * Date: 2014-03-01
 * Copyright (c) 2014 Bucknell University
 *
 * Permission is hereby granted, free of charge, to any individual or
 * institution obtaining a copy of this software and associated
 * on files (the "Software"), to use, copy, modify, and
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
/* Received help from: Nazmul
*/

#include <stdio.h>
#include <stdlib.h>

/* Forward declaration for our assembly functions
 * so gcc knows the return type (the return type defaults
 * to int so, it would look in the $v0 register w/o this).
 * Knowning the return type is a float/double gcc will
 * look in the $f0 (float) or $f0-$f1 (double) registers.
 */
float one_half_single( void );
double one_half_double( void );

unsigned int f2u( float f );
float u2f( unsigned int u );
unsigned long long d2u( double d );
double u2d( unsigned long long u );


/**
 * Prints "S = x, E = y, M = z"
 */
void inspect_float( float f ) {
	unsigned int u = f2u( f );
	unsigned int s = u >> 31;
	unsigned int e = u >> 23;
	e = e & 0x7f; // truncate mantissa
	unsigned int m = u & 0x7fffff;
	printf( "sign = %x, exponent = 0x%02x, fraction = 0x%06x\n", s, e, m );
}

/**
 * Prints "S = x, E = y, M = z"
 */
void inspect_double( double d ) {
	unsigned long long u = d2u( d );
	unsigned long long s = u >> 63;
	unsigned long long e = ( u >> 52 ) & 0x7ff;
	unsigned long long m = u & 0x7ffffffffffff;
	printf( "sign = %llx, exponent = 0x%03llx, fraction = 0x%013llx\n", s, e, m );
}

void precision( void ) {
	/* I'm guessing that floating point precision decreases as
	 * numbers get very small/large.
	 */
	float f = u2f( f2u( 1.0 ) + 1 );
	printf( "Next precision float after 1:\n" );
	inspect_float( f );
}

int is_near( float num1, float num2, double epsilon ) {
	double diff = num1 - num2;
	if ( diff < 0 ) {
		diff *= -1;
	}
	if ( diff < epsilon ) {
		return 1;
	} else {
		return 0;
	}
}

void sum() {
	/* This function returns false at first because sum == 100
	 * will always be false due to loss of significance when
	 * using floating point values.
	 */
	float a = 0.1;
	float sum = 0;
	int i;
	char* truth_value;

	for ( i = 0; i < 1000; i++ ) {
		sum += a;
	}

	if ( is_near( sum, 100, 0.01 ) == 1 ) {
		truth_value = "TRUE";
	} else {
		truth_value = "FALSE";
	}

	printf( "a = %1.28f, sum = %1.28f, sum == 100 ==> %s\n",
			a,
			sum,
			truth_value );

	inspect_float( a );
	inspect_float( sum );
	inspect_float( 100 - sum );
}

int main() { 
	printf("0.5 (single) = %f\n", one_half_single());
	inspect_float( one_half_single() );
	printf("0.5 (double) = %lf\n", one_half_double());
	inspect_double( one_half_double() );
	precision();
	sum();

	return 0;
}