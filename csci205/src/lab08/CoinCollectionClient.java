/* *****************************************
* CSCI205 - Software Engineering and Design
* Spring 2016
*
* Name: Andre Amirsaleh
* Date: Feb 12, 2016
* Time: 9:22:37 PM
*
* Project: csci205
* Package: lab08
* File: CoinCollectionClient
* Description: More practice with JOptionPane
*
* ****************************************
 */
package lab08;

import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class CoinCollectionClient {

    enum AddRemoveChoices {
        DONE("Done"), REMOVE("Remove Coins"), ADD("Add Coins");

        private String label;

        /**
         * Constructor to initialize button labels for JOptionPane
         *
         * @param s (String) button label for JOptionPane
         */
        AddRemoveChoices(String s) {
            this.label = s;
        }

        /**
         * Represents AddRemoveChoices (enum) as a string
         *
         * @return (String) the label of the button in JOptionPane
         */
        @Override
        public String toString() {
            return this.label;
        }
    }

    /**
     * main method to test CoinCollection methods
     *
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        CoinCollection myCoins = new CoinCollection();
        int choice;
        Coin coinChoice;
        String numCoinsString;
        Integer numCoins;
        JFrame myFrame = new JFrame();
        int maxCoins;

        // Initialize the coin collection with some coins
        myCoins.addCoins(Coin.NICKEL, 5);
        myCoins.addCoins(Coin.DIME, 3);
        myCoins.addCoins(Coin.QUARTER, 7);

        while (true) {
            choice = JOptionPane.showOptionDialog(null, myCoins,
                                                  "Add or remove?", 0, 0, null,
                                                  AddRemoveChoices.values(),
                                                  AddRemoveChoices.ADD);
            if (choice == AddRemoveChoices.DONE.ordinal()) {
                break;
            } else if (choice == AddRemoveChoices.ADD.ordinal()) {
                coinChoice = (Coin) JOptionPane.showInputDialog(null,
                                                                "Select coin type:",
                                                                "Coin Selection",
                                                                JOptionPane.QUESTION_MESSAGE,
                                                                null,
                                                                Coin.values(),
                                                                Coin.values()[0]);
                if (coinChoice == null) {
                    break;
                }
                numCoinsString = JOptionPane.showInputDialog(myFrame,
                                                             "How many do you want to add?",
                                                             "Add coins",
                                                             JOptionPane.QUESTION_MESSAGE);
                if (numCoinsString == null) {
                    break;
                }
                numCoins = Integer.parseInt(numCoinsString);
                myCoins.addCoins(coinChoice, numCoins);
            } else if (choice == AddRemoveChoices.REMOVE.ordinal()) {
                coinChoice = (Coin) JOptionPane.showInputDialog(null,
                                                                "Select coin type:",
                                                                "Coin Selection",
                                                                JOptionPane.QUESTION_MESSAGE,
                                                                null,
                                                                Coin.values(),
                                                                Coin.values()[0]);
                if (coinChoice == null) {
                    break;
                }
                maxCoins = myCoins.getCount(coinChoice);
                numCoinsString = JOptionPane.showInputDialog(myFrame,
                                                             "How many do you want to remove? Max = " + maxCoins,
                                                             "Remove coins",
                                                             JOptionPane.QUESTION_MESSAGE);
                if (numCoinsString == null) {
                    break;
                }
                numCoins = Integer.parseInt(numCoinsString);
                myCoins.removeCoins(coinChoice, numCoins);
            }
        }
        // Display goodbye dialog box
        JOptionPane.showConfirmDialog(null,
                                      "You have:\n" + myCoins + "\n\n Goodbye!",
                                      "Goodbye", JOptionPane.DEFAULT_OPTION,
                                      JOptionPane.INFORMATION_MESSAGE);
    }

}
