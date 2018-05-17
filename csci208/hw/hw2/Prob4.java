/*
 * Assignment: Homework 2, Problem 4
 * Authors: Andre Amirsaleh and Stefano Cobelli
 *
 * Date: 9/12/16
 * Class: CSCI 208 - Programming Language Design
 * Section: 2:00PM-3:00PM
 * Professor: Benoit Razet
 */

/**
 *
 * @author Andre Amirsaleh and Stefano Cobelli
 */
public class Prob4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("PROBLEM 4:");
        System.out.println(
                "Java is strongly typed, but implicit casting allows us to do operations like...");
        System.out.println("i = 'w' / 4");
        double i = 'w' / 4;
        System.out.println("i = " + i);
        int p = (int) ('w' / 2.1);

        // No implicit coercian down the hiearchy
        System.out.println(
                "That being said, only certain primitive types can be casted to other particular primitive types.");
        System.out.println("For example, the following lines will not compile:");
        System.out.println("boolean dog = 5;");
        System.out.println("int j = 1.0;");
        // Binary operators don't work on numbers
        System.out.println("int k = 3 && 3;");
        System.out.println("int l = 1 || 0;");
    }

}
