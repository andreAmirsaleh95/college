/* *****************************************
* CSCI205 - Software Engineering and Design
* Spring 2016
* Instructor: Brian King
* Section: List time of your lecture
*
* Name: Andre Amirsaleh
* Date: 2/2/2016
*
* Lab / Assignment: lab04
*
* Description:
*
* *****************************************/

package lab04;

import java.util.Arrays;

/**
 * The ArrayChallenge class is used to valuate several different array
 * exercises from lab04
 *
 * @author aa026
 */
public class ArrayChallenge {

	/**
	 * Creates an array representing the concatonation of two arrays
	 *
	 * @param a1 Array to concatonate onto first half
	 * @param a2 Array to concatonate onto second half
	 * @return Array representing the concatonation of <code>a1</code> and <code>a2</code>
	 */
	public static double[] concat( double[] a1, double[] a2 ) {

		double[] result = Arrays.copyOf( a1, a1.length + a2.length );
		
		for ( int i = 0; i < a2.length; i++ )
			result[ a1.length + i ] = a2[ i ];
		
		return result;
	}

	/**
	 * Duplicates an array in reverse order
	 *
	 * @param a Double array to reverse
	 * @return Double array in reverse order of <code>a</code>
	 */
	public static double[] reverse( double[] a ) {

		if ( a.length <= 1 ) {
			return a;
		}

		return concat( reverse( Arrays.copyOfRange( a, 1, a.length ) ), Arrays.copyOf( a, 1 ) );
	}

	/**
	 * Calculates alternationg sum of elements in a double array
	 *
	 * @param a Double array containing operands
	 * @return Double representing the alternating sum of <code>a</code>
	 */
	public static double altSum( double[] a ) {

		double total = 0;

		for ( int i = 0; i <= a.length - 1; i++ ) {
			if ( i % 2 == 0 ) {
				total += a[i];
			} else {
				total -= a[i];
			}
		}

		return total;
	}

	/**
	 * Returns true if double array elements are in increasing order and false otherwise
	 *
	 * @param a Double array
	 * @return Boolean representing that the elements are in increasing order <code>a</code>
	 */
	public static boolean isSorted( double[] a ) {
		
		for ( int i = 1; i <= a.length - 1; i++ ) {
			if ( a[i] < a[i-1] ) {
				return false;
			}
		}

		return true;
	}
	/**
     * Main program to test out each Array processing method
     */
	public static void main(String[] args) {

 		double[] array1 = { 2, 3, 5, 7, 11 };
 		double[] array2 = { 1, 4, 6, 8, 0 };

		System.out.printf("array1: %s\n", Arrays.toString(array1));
		System.out.printf("array2: %s\n", Arrays.toString(array2));
		System.out.printf("concat test: %s\n", Arrays.toString(concat(array1,array2)));

		System.out.printf("reverse test: %s\n", Arrays.toString(reverse(array1)));

		System.out.printf("altSum test: %.1f\n", altSum(concat(array1, array2)));

		System.out.printf("sorted test 1: %b\n", isSorted(array1));

		System.out.printf("sorted test 2: %b\n", isSorted(array2));
	}
}
