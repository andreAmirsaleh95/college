/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: Feb 12, 2016
 * Time: 1:50:48 PM
 *
 * Project: csci205
 * Package: lab08
 * File: Coin
 * Description:
 *
 * ****************************************
 */
package lab08;

/**
 * Coin - A simple enumerated type to represent the different types of coins
 *
 * @author Andre Amirsaleh
 */
public enum Coin {
    PENNY(0.01),
    NICKEL(0.05),
    DIME(0.10),
    QUARTER(0.25),
    DOLLAR(1.00);

    /**
     * The value of the coin in dollars
     */
    private double value;

    /**
     * Constructor to initialize value attribute
     *
     * @param value the value of the coin in dollars
     */
    private Coin(double value) {
        this.value = value;
    }

    /**
     * Getter method for value attribute
     *
     * @return Value of the coin in dollars
     */
    public double getValue() {
        return value;
    }
}
