/* *****************************************
* CSCI205 - Software Engineering and Design
* Spring 2016
* Instructor: Brian King
* Section: 1:00-2:00 MWF
*
* Name: Andre Amirsaleh
* Date: 1/28/2016
*
* Lab / Assignment: lab03 / Exercise 4
*
* Description: Fibonacci sequence functions using recursion (first method) and a while loop * (second method)
*
* *****************************************/
package lab03;

import java.util.Scanner;

/**
 * A simple class designed to give the user an opportunity to test a recursive
 * and non-recursive version of fibonacci
 *
 * Date: 2015-fall
 *
 * @author BRK
 */
public class Fibonacci {

    /**
     * Compute the nth fibonacci number recursively
     *
     * @param n - the nth number to find
     * @return the nth number in the fibonacci sequence
     */
    public static int recFib(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        return recFib(n - 2) + recFib(n - 1);
    }

    /**
     * Compute the nth fibonacci number non-recursively, using a while loop.
     *
     * @param n - the nth number to find
     * @return the nth number in the fibonacci sequence
     */
    public static int nonRecFib(int n) {
        int prevVal = 1;
        int curVal = 1;
        int temp = 0;
        int i = 2;
        while (i < n) {
            temp = curVal;
            curVal += prevVal;
            prevVal = temp;
            i++;
        }
        return curVal;
    }

    /**
     * Main program to test both fibonacci methods
     */
    public static void main(String[] args) {
        System.out.println("What fibonacci number do you want?");
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();

        System.out.println("Recursive fib: " + recFib(n));
        System.out.println("Non-recursive fib: " + nonRecFib(n));
    }

}
