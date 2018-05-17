/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: Feb 24, 2016
 * Time: 1:46:17 PM
 *
 * Project: csci205
 * Package: lab11
 * File: Payable
 * Description:
 *
 * ****************************************
 */
package lab11;

/**
 *
 * @author Andre Amirsaleh
 */
public interface Payable {

    /**
     * Calculates amount to be paid based on number of hours worked
     *
     * @param numHours (double) number of hours for which to pay
     * @return (double) amount to pay
     */
    public abstract double calculatePay(double numHours);

    /**
     * Returns a String to be placed in the "Pay To:" field on the check
     *
     * @return String to place in the "Pay To:" field on the check
     */
    public abstract String getPayTo();

    /**
     * Returns a String that should be placed in the memo field of the check
     *
     * @return (String) message to place in memo field of the check
     */
    public abstract String getPayMemo();
}
