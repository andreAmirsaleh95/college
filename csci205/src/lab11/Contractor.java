/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: Feb 25, 2016
 * Time: 9:12:58 PM
 *
 * Project: csci205
 * Package: lab11
 * File: Contractor
 * Description:
 *
 * ****************************************
 */
package lab11;

import java.util.Date;

/**
 * Class to represent independent contractors
 *
 * @author Andre Amirsaleh
 */
public class Contractor implements Payable {

    private int id;

    private String firstName;

    private String lastName;

    private int ssNum;

    private double hourlyRate;

    /**
     * Constructor for Contractor class
     *
     * @param id (int) ID
     * @param firstName (String) first name
     * @param lastName (String) last name
     * @param ssNum (int) Social Security number
     * @param hourlyRate (double) hourly rate [dollars / hour]
     */
    public Contractor(int id, String firstName, String lastName, int ssNum,
                      double hourlyRate) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.ssNum = ssNum;
        this.hourlyRate = hourlyRate;
    }

    /**
     * Gets ID (attribute)
     *
     * @return int - this.id
     */
    public int getId() {
        return id;
    }

    /**
     * Gets first name (attribute)
     *
     * @return String - this.firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * Gets last name (attribute)
     *
     * @return String - this.lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * Gets Social Security number (attribute)
     *
     * @return int - this.ssNum
     */
    public int getSsNum() {
        return ssNum;
    }

    /**
     * Gets hourly rate (attribute)
     *
     * @return double - this.hourlyRate
     */
    public double getHourlyRate() {
        return hourlyRate;
    }

    /**
     * Calculates amount to pay Contractor based on hours worked
     *
     * @param numHours number of hours worked
     * @return double - amount to pay to Contractor
     */
    @Override
    public double calculatePay(double numHours) {
        return numHours * this.hourlyRate;
    }

    /**
     * Returns the String to put in the pay to field of the check
     *
     * @return (String) the Contractor's name
     */
    @Override
    public String getPayTo() {
        return this.firstName + " " + this.lastName;
    }

    /**
     * Returns the String to place in the memo field of the check
     *
     * @return String
     */
    @Override
    public String getPayMemo() {
        return String.format("Contractor ID: %d, Pay Date: %s", this.getId(),
                             HRUtility.dateToStr(new Date()));
    }

    /**
     * Returns String representation of the Contractor instance
     *
     * @return String - All of the Contractor attributes
     */
    @Override
    public String toString() {
        return String.format("Contractor: %d,%s,%s,%d,%.2f", this.id,
                             this.lastName, this.firstName, this.ssNum,
                             this.hourlyRate);
    }
}
