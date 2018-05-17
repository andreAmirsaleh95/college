/* *****************************************
* CSCI205 - Software Engineering and Design
* Spring 2016
*
* Name: Andre Amirsaleh
* Date: Feb 8, 2016
* Time: 1:43:07 PM
*
* Project: csci205
* Package: lab07
* File: CashRegisterClient
* Description:
*
* *****************************************/
package lab07;

/**
 *
 * @author Andre Amirsaleh
 */
public class CashRegisterClient {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        CashRegister reg1 = new CashRegister(), reg2 = new CashRegister(
                "Register 2");
        System.out.println("Constructed:\n" + reg1 + "\n" + reg2);
        reg1.setName("Register 1");
        System.out.println("reg1.startDay(100), reg2.startDay(200)");
        reg1.startDay(100.0);
        reg2.startDay(200.0);
        System.out.println(reg1 + "\n" + reg2);
        System.out.println("reg1 - Transaction: $2.50, $9.95, $5.50 = $17.95");
        reg1.startTransaction();
        reg1.scanItem(2.50);
        reg1.scanItem(9.95);
        reg1.scanItem(5.50);
        System.out.println(
                "reg2 - Transaction: $5.00, $15.95, $2.75 $20 = $43.70");
        reg2.startTransaction();
        reg2.scanItem(5.0);
        reg2.scanItem(15.95);
        reg2.scanItem(2.75);
        reg2.scanItem(20);
        System.out.println(reg1 + "\n" + reg2);
        System.out.printf("reg1.collectPayment($15) = -2.95: ACTUAL: $%.2f%n",
                          reg1.collectPayment(15));
        System.out.printf("reg1.collectPayment($10) = 7.05: ACTUAL: $%.2f%n",
                          reg1.collectPayment(10));
        reg1.finishTransaction();
        System.out.printf("reg2.collectPayment($43.70) = 0.0: ACTUAL : $%.2f%n",
                          reg2.collectPayment(43.70));
        reg2.finishTransaction();
        System.out.println(reg1 + "\n" + reg2);
        System.out.println("reg1 - Transaction: $10, $7.50, $19.95, $5 = $42.45");
        reg1.startTransaction();
        reg1.scanItem(10);
        reg1.scanItem(7.50);
        reg1.scanItem(19.95);
        reg1.scanItem(5.00);
        System.out.println(reg1 + "\n" + reg2);
        System.out.printf("reg1.collectPayment($50.00) = 7.55. ACTUAL: $%.2f%n",
                          reg1.collectPayment(50));
        reg1.finishTransaction();
        System.out.println(reg1 + "\n" + reg2);
        System.out.printf("reg1.finishDay() = $160.40. ACTUAL: $%.2f%n",
                          reg1.finishDay());
        System.out.println("Reg1 should now be empty: " + reg1);
        System.out.printf("reg2.finishDay(): = $243.70. ACTUAL: $%.2f%n",
                          reg2.finishDay());
        System.out.println("Reg2 shuold now be empty: " + reg2);
        System.out.println("reg1.displayItemList:");
        reg1.displayItemList();
        System.out.println("reg2.displayItemList:");
        reg2.displayItemList();
        System.out.printf(
                "reg1.getAveItemPurchasedToday() = 8.63. ACTUAL: $%.2f%n",
                reg1.getAveItemPurchasedToday());
        System.out.printf("reg1: getNumTransToday() = 2. ACTUAL: %d%n",
                          reg1.getNumTransToday());
        System.out.printf("reg1: getAveTranToday() = 30.20. ACTUAL: $%.2f%n",
                          reg1.getAveTransToday());
        System.out.printf(
                "reg2.getAveItemPurchasedToday() = 10.93. ACTUAL: $%.2f%n",
                reg2.getAveItemPurchasedToday());
        System.out.printf("reg2: getNumTransToday() = 1. ACTUAL: %d%n",
                          reg2.getNumTransToday());
        System.out.printf("reg2: getAveTransToday() = 43.70. ACTUAL: $%.2f%n",
                          reg2.getAveTransToday());
        System.out.println(
                "reg1.startDay(150), reg2.startDay(250), both should be zeroed out:");
        reg1.startDay(150.0);
        reg2.startDay(250.0);
        System.out.println(reg1 + "\n" + reg2);
    }

}
