/* *****************************************
* CSCI205 - Software Engineering and Design
* Spring 2016
*
* Name: Andre Amirsaleh
* Date: Feb 7, 2016
* Time: 9:58:38 PM
*
* Project: csci205
* Package: lab06
* File: CashRegister
* Description: A cash register class used for practice with object-oriented
* programming in Java
*
* *****************************************/
package lab07;

import java.util.ArrayList;

/**
 * Simple class representing a cash register
 *
 * @author Andre Amirsaleh
 */
public class CashRegister {

    /**
     * List of item prices sold throughout the day
     */
    private ArrayList<Double> itemList;

    /**
     * The name of the cash drawer
     */
    private String sName;

    /**
     * The amount of cash in the drawer
     */
    private double cashInDrawer;

    /**
     * Are we currently in a transaction?
     */
    private boolean inTransaction;

    /**
     * The total amount of the transaction
     */
    private double transTotal;

    /**
     * The total number of items purchased in this transaction so far
     */
    private int numItemsInTrans;

    /**
     * The total amount of money collected toward the transaction
     */
    private double amountPaid;

    /**
     * The total amount paid for each transaction processed today
     */
    private ArrayList<Double> transTotalsToday;

    /**
     * Initialize a default empty cash register
     */
    public CashRegister() {
        this.cashInDrawer = 0;
        this.inTransaction = false;
        this.transTotal = 0;
        this.numItemsInTrans = 0;
        this.amountPaid = 0;
        this.sName = "Default";
        this.itemList = new ArrayList<>();
        this.transTotalsToday = new ArrayList<>();
    }

    /**
     * Initialize an empty cash register with a specified name
     *
     * @param sName The name of the register (String)
     */
    public CashRegister(String sName) {
        this();
        this.sName = sName;
    }

    /**
     * Initializes the amount of cash to be placed in the drawer
     *
     * @param initCash The amount of cash to be placed in the drawer
     */
    public void startDay(double initCash) {
        this.cashInDrawer = initCash;
        this.itemList.clear();
        this.transTotalsToday.clear();
    }

    /**
     * Sets the amount of cash in the register to zero
     *
     * @return (double) total amount in drawer
     */
    public double finishDay() {
        double temp = this.cashInDrawer;
        this.cashInDrawer = 0;
        return temp;
    }

    /**
     * Returns true if there is cash in the drawer and not mid-transaction
     *
     * @return boolean representing whether a transaction can begin
     */
    public boolean startTransaction() {
        if (!this.inTransaction && this.cashInDrawer > 0) {
            this.inTransaction = true;
        }
        return this.inTransaction;
    }

    /**
     * Returns true as long as a transaction is in process and no money is owed
     *
     * @return boolean representing whether a transaction can finish
     */
    public boolean finishTransaction() {
        if (this.inTransaction && this.getAmountOwed() <= 0) {
            if (this.amountPaid > this.transTotal) {
                this.cashInDrawer -= (this.amountPaid - this.transTotal);
                this.amountPaid -= (this.amountPaid - this.transTotal);
            }
            this.transTotalsToday.add(this.amountPaid);
            this.numItemsInTrans = 0;
            this.transTotal = 0;
            this.amountPaid = 0;
            this.inTransaction = false;
            return true;
        } else {
            return false;
        }
    }

    /**
     * Adds the price of the given item to the transaction total
     *
     * @param price The price of the current item
     */
    public void scanItem(double price) {
        this.numItemsInTrans += 1;
        this.transTotal += price;
        this.itemList.add(price);
    }

    /**
     * Returns the number of items purchased throughout the day
     *
     * @return (int) number of items purchased throughout the day
     */
    public int getNumItemsToday() {
        return this.itemList.size();
    }

    /**
     * Calculates the average item price purchased today
     *
     * @return (double) average item price purchased today
     */
    public double getAveItemPurchasedToday() {
        double total = 0;

        for (int i = 0; i < this.getNumItemsToday(); i++) {
            total += this.itemList.get(i);
        }

        return total / this.getNumItemsToday();
    }

    /**
     * Returns the total price of the current transaction
     *
     * @return transaction total
     */
    public double getTransactionTotal() {
        return this.transTotal;
    }

    /**
     * Returns the number of items in the current transaction
     *
     * @return (int) the number of items in the transaction
     */
    public int getNumItemsInTrans() {
        return this.numItemsInTrans;
    }

    /**
     * Returns the amount paid by the customer towards the current transaction
     *
     * @return amount paid
     */
    public double getAmountPaid() {
        return this.amountPaid;
    }

    /**
     * Returns the name of the register
     *
     * @return The name of the register
     */
    public String getName() {
        return this.sName;
    }

    /**
     * Returns true if mid-transaction; returns false otherwise
     *
     * @return boolean representing whether register is mid-transaction
     */
    public boolean isInTransaction() {
        return this.inTransaction;
    }

    /**
     * Returns the amount owed towards current transaction
     *
     * @return amount owed towards current transaction
     */
    public double getAmountOwed() {
        return this.transTotal - this.amountPaid;
    }

    /**
     * Sets the name of the register
     *
     * @param sName The new name for the register
     */
    public void setName(String sName) {
        this.sName = sName;
    }

    /**
     * Calculates money owed to customer after payment
     *
     * @param payment The amount the customer paid
     * @return The amount the seller owes to the customer
     */
    public double collectPayment(double payment) {
        this.amountPaid += payment;
        this.cashInDrawer += payment;

        return this.amountPaid - this.transTotal;
    }

    /**
     * Prints the item list to System.out
     */
    public void displayItemList() {
        System.out.println(
                "Item Log: " + this.getNumItemsToday() + " items purchased today");
        for (int i = 0; i < this.getNumItemsToday(); i++) {
            System.out.println(this.itemList.get(i).toString());
        }
    }

    /**
     * Calculates the average transaction total for today
     *
     * @return (double) average transaction total for today
     */
    public double getAveTransToday() {
        double sum = 0;
        for (Double transactionTotal : this.transTotalsToday) {
            sum += transactionTotal;
        }
        return sum / this.getNumTransToday();

    }

    /**
     * Returns the number of transactions that were processed today
     *
     * @return (int) the number of transactions processed today
     */
    public int getNumTransToday() {
        return this.transTotalsToday.size();
    }

    /**
     * A toString method to represent the cash register object as a string
     *
     * @return String representation of the cash register object
     */
    @Override
    public String toString() {
        String returnString;
        if (this.isInTransaction()) {
            returnString = String.format(
                    this.sName + ":   drawer: $%.2f" + " CURRENT TRANS: #items: " + numItemsInTrans + ", total sale: $%.2f, amount paid: $%.2f",
                    this.cashInDrawer, this.transTotal, this.amountPaid);
        } else {
            returnString = String.format(
                    this.sName + ":   drawer: $%.2f NOT IN TRANSACTION",
                    this.cashInDrawer);
        }
        returnString += "\nTODAY: #items: " + this.getNumItemsToday() + ", #trans: " + this.getNumTransToday();
        return returnString;
    }

}
