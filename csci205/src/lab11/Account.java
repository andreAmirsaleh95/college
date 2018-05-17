/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: Feb 26, 2016
 * Time: 1:09:20 PM
 *
 * Project: csci205
 * Package: lab11
 * File: Account
 * Description:
 *
 * ****************************************
 */
package lab11;

class InsufficientFundsException extends Exception {

    /**
     * Initializes InsufficientFundsException
     *
     * @param message String - message to display when this exception is thrown
     */
    public InsufficientFundsException(String message) {
        super(message);
    }
}

/**
 *
 * @author Andre Amirsaleh
 */
public class Account {
    private double balance;

    /**
     * Constructor for the Account class
     *
     * @param initBalance double - initial balance
     */
    public Account(double initBalance) {
        this.balance = initBalance;
    }

    /**
     * Gets balance attribute
     *
     * @return double - this.balance
     */
    public double getBalance() {
        return this.balance;
    }

    /**
     * Adds <code>amount</code> money to the balance attribute
     *
     * @param amount double - amount of money to add to the balance
     */
    public void credit(double amount) {
        this.balance += amount;
    }

    public void debit(double amount) throws InsufficientFundsException {
        if (this.balance >= amount) {
            this.balance -= amount;
        } else {
            throw new InsufficientFundsException(String.format(
                    "INSUFFICIENT FUNDS! Required: $%.2f, Available: $%.2f",
                    amount, this.balance));
        }
    }

    public void processCheck(Payable payee, double hoursBilled) throws InsufficientFundsException {
        double amount = payee.calculatePay(hoursBilled);
        this.debit(amount);
        System.out.println("Pay to:     " + payee.getPayTo());
        System.out.println("Pay memo:   " + payee.getPayMemo());
        System.out.println(String.format("Pay amount: $%.2f", amount));
    }

    /**
     * Returns a String representing the Account instance
     *
     * @return String - Account balance (attribute)
     */
    @Override
    public String toString() {
        return String.format("Account Balance: $%.2f", this.balance);
    }
}
