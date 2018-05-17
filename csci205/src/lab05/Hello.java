package lab05;

import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

/* *****************************************
* CSCI205 - Software Engineering and Design
* Spring 2016
*
* Name: Andre Amirsaleh
* Date: Feb 3, 2016
* Time: 6:43:15 PM
*
* Project: csci205
* Package: lab05
* File: Hello
* Description: Practice with NetBeans
*
* ****************************************
 */
/**
 * A simple program to aid in understanding NetBeans
 *
 * @author Andre Amirsaleh
 * @version 0.1
 */
public class Hello {

    private static final int NUM_INTS = 10;

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        greetUser();

        int[] x = getArrayOfRandomNums();
        System.out.println(Arrays.toString(x));
    }

    private static int[] getArrayOfRandomNums() {
        Random rand = new Random();
        int[] x = new int[NUM_INTS];
        for (int i = 0; i <= 9; i++) {
            x[i] = rand.nextInt(100);
        }
        return x;
    }

    private static void greetUser() {
        Scanner in = new Scanner(System.in);
        String name;
        System.out.print("Hello. What is your name? ");
        name = in.next();
        System.out.println(name + ", becoming a good programmer takes practice.");
    }

}
