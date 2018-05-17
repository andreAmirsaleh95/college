/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: Mar 1, 2016
 * Time: 10:19:42 PM
 *
 * Project: csci205
 * Package: lab12
 * File: WordCountClient
 * Description:
 *
 * ****************************************
 */
package lab12;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;

/**
 * A client for the WordCount class for testing doIt()
 *
 * @author Andre Amirsaleh
 */
public class WordCountClient {

    /**
     * Main method which runs WordCount methods and catches exceptions
     *
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        JFileChooser fc = new JFileChooser(".");
        int returnVal;
        File file;
        WordCount wc;
        int choice;

        while (true) {
            try {
                returnVal = fc.showOpenDialog(fc);
                if (returnVal == JFileChooser.APPROVE_OPTION) {
                    file = fc.getSelectedFile();
                    System.out.println("Opening: " + file.getName() + ".");
                    wc = new WordCount(file);
                } else {
                    System.out.println("Open command cancelled by user.");
                    return;
                }
            } catch (FileNotFoundException ex) {
                JOptionPane.showMessageDialog(null, "We couldn't find your file",
                                              "ERROR", JOptionPane.ERROR_MESSAGE);
                continue;
            }
            try {
                wc.doIt();
            } catch (IOException ex) {
                JOptionPane.showMessageDialog(null,
                                              "ERROR: Something went wrong",
                                              "IOException",
                                              JOptionPane.ERROR_MESSAGE);
                try {
                    wc.getInBuf().close();
                } catch (IOException ex1) {
                    JOptionPane.showMessageDialog(null,
                                                  "ERROR: Couln't close buffer",
                                                  "IOException",
                                                  JOptionPane.ERROR_MESSAGE);
                }
                return;
            }
            choice = JOptionPane.showOptionDialog(null,
                                                  wc.toString() + "\nTry again?",
                                                  "WordCount Results",
                                                  JOptionPane.YES_NO_OPTION,
                                                  JOptionPane.QUESTION_MESSAGE,
                                                  null, null, null);
            if (choice != 0) {
                try {
                    wc.getInBuf().close();
                } catch (IOException ex) {
                    JOptionPane.showMessageDialog(null,
                                                  "ERROR: Couldn't close buffer",
                                                  "IOException",
                                                  JOptionPane.ERROR_MESSAGE);
                }
                return;
            }
        }
    }
}
