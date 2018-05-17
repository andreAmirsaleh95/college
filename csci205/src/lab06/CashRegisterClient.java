/* *****************************************
* CSCI205 - Software Engineering and Design
* Spring 2016
*
* Name: Andre Amirsaleh
* Date: Feb 8, 2016
* Time: 12:00:16 AM
*
* Project: csci205
* Package: lab06
* File: CashRegisterClient
* Description:
*
* ****************************************
 */
package lab06;

/**
 * Class to test CashRegister class
 *
 * @author Andre Amirsaleh
 */
public class CashRegisterClient {

    /**
     * main method to test CashRegister class
     *
     * @param args Command line arguments
     */
    public static void main(String[] args) {
        CashRegister reg1 = new CashRegister(), reg2 = new CashRegister(
                "Register 2");
        System.out.println("Constructed:\n" + reg1 + "\n" + reg2);
        reg1.setName("Register 1");
        reg1.startDay(100.0);
        reg2.startDay(200.0);
        System.out.println("Started day:\n" + reg1 + "\n" + reg2);
        System.out.println(
                "TESTING: reg1: New transaction: $2.50, $9.95, $5.50 = $17.95");
        reg1.startTransaction();
        reg1.scanItem(2.50);
        reg1.scanItem(9.95);
        reg1.scanItem(5.50);
        System.out.println(
                "reg1.isInTransaction() = true. ACTUAL = " + reg1.isInTransaction());
        System.out.printf("reg1.getTotal() = $17.95. ACTUAL = $%.2f%n",
                          reg1.getTransactionTotal());
        System.out.println(
                "reg1.getNumItems() = 3. ACTUAL = " + reg1.getNumItemsInTrans());
        System.out.println(
                "reg1.getAmountPaid = 0.0 ACTUAL = " + reg1.getAmountPaid());
        System.out.println(
                "reg1.getAmountOwed() = 17.95. ACTUAL = " + reg1.getAmountOwed());
        System.out.println("Testing out toString() for reg1...");
        System.out.println(reg1);
        double amtBack = reg1.collectPayment(15.0);
        System.out.printf(
                "reg1: made payment of $15. Result = -2.95: ACTUAL = $%.2f%n",
                amtBack);
        System.out.println(reg1);
        System.out.println(
                "reg1: reg1.finishTransaction() = false. ACTUAL = " + reg1.finishTransaction());
        System.out.printf(
                "reg1: reg1.collectPayment(10), result: $7.05 ACTUAL = $%.2f%n",
                reg1.collectPayment(10));
        System.out.println(reg1);
        System.out.println(
                "reg1: reg1.finishTransaction() = true. ACTUAL = " + reg1.finishTransaction());
        System.out.println(reg1);
        System.out.println(
                "reg1: New transaction: $10, $7.50, $19.95, $5 = $42.45");
        reg1.startTransaction();
        reg1.scanItem(10);
        reg1.scanItem(7.50);
        reg1.scanItem(19.95);
        reg1.scanItem(5.00);
        System.out.println(reg1);
        System.out.printf("reg1.collectPayment($42.45) = 0.0. ACTUAL = $%.2f%n",
                          reg1.collectPayment(42.45));
        System.out.println(reg1);
        reg1.finishTransaction();
        System.out.println("Checking reg2, should still be untouched:");
        System.out.println(reg2);
        System.out.printf("reg1.finishDay() = $160.40. ACTUAL = $%.2f%n",
                          reg1.finishDay());
        System.out.println("Reg1 should be empty: " + reg1);
        System.out.printf("reg2.finishDay(): = $200. ACTUAL = $%.2f%n",
                          reg2.finishDay());
        System.out.println("Reg2 shuold be empty: " + reg2);
    }
}
