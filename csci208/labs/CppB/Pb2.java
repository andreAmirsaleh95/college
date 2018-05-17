/*
 * Assignment: CppA (lab 4), Problem 2
 * Author: Andre Amirsaleh
 *
 * Date: 9/15/16
 * Class: CSCI 208L - Programming Language Design
 * Section: 1:00PM-2:52PM
 * Professor: Benoit Razet
 */

/**
 * A class that contains and is built around the provided main method
 *
 * @author Andre Amirsaleh
 */
public class Pb2 {
    public static int x = 1;
    public int y;
    private int z;

    public Pb2() {
        this.y = 2;
        this.z = 3;
    }
    
    /**
     * Prints the value of <code>y</code>
     */
    public void print() {
        System.out.println("y = " + y);
    }

    /**
     * Changes field <code>y</code>'s value to <code>n</code>
     * @param n New value for <doe>y</code>
     */
    public void change(int n) {
        y = n;
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Pb2 obj1 = new Pb2();
        Pb2 obj2 = obj1;
        obj1.print();
        obj2.print();
        obj1.change(42); // change a member data to 42
        obj1.print();
        obj2.print();
    }
}