/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: Feb 29, 2016
 * Time: 8:35:45 PM
 *
 * Project: csci205
 * Package: lab12
 * File: ScanWebPage
 * Description:
 *
 * ****************************************
 */
package lab12;

import java.io.BufferedInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.Scanner;
import java.util.regex.Pattern;

/**
 * Contains main method which scans a web page and outputs a file containing all
 * of links on the page
 *
 * @author Andre Amirsaleh
 */
public class ScanWebPage {

    private static URL locator;
    private static BufferedInputStream buffed;

    /**
     * Scans a web page and outputs a file containing all of links on the page
     *
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        String tag;
        String regex;
        Scanner scanner = null;
        while (scanner == null) {
            try {
                System.out.print("Enter the URL to scan: ");
                bufferWebPage(in.next());
                scanner = new Scanner(locator.openStream());
            } catch (MalformedURLException ex) {
                System.out.println("Malformed URL! Please try again.");
            } catch (UnknownHostException ex) {
                System.out.println(
                        "Valid URL, but Host does not exist! Please try again.");
            } catch (IllegalArgumentException ex) {
                System.out.println("Invalid URL syntax! Please, try again.");
            } catch (FileNotFoundException ex) {
                System.out.println(
                        "Could not find resource on host! Please try again.");
            } catch (IOException ex) {
                System.out.println("Something went wrong! Please try again.");
            }
        }
        System.out.print(
                "Connection established. What tag do you want to scan for? ");
        tag = in.next();
        regex = "<" + tag + "[^>]*?>";
        Pattern pattern = Pattern.compile(regex);

        PrintWriter outFile = null;
        String outFileName = null;
        while (outFileName == null || outFile == null) {
            try {
                System.out.print("Enter the file name to store the results: ");
                outFileName = in.next();
                outFile = new PrintWriter(outFileName);
            } catch (FileNotFoundException ex) {
                System.out.println("Invalid file name! Please try again.");
            }
        }

        String sMatch;
        int numTagsFound = 0;
        while ((sMatch = scanner.findWithinHorizon(pattern, 0)) != null) {
            outFile.printf(sMatch + "%n");
            numTagsFound += 1;
        }
        outFile.print("Total number of tags = " + numTagsFound);
        outFile.close();
        System.out.println(
                "Wrote " + numTagsFound + " <" + tag + "> tags to " + outFileName);
        System.out.println("Goobye!");
    }

    /**
     * Gets the name of the web page to scan from the user
     *
     * @param address (String) Web page address
     * @throws MalformedURLException
     * @throws IOException
     */
    public static void bufferWebPage(String address) throws MalformedURLException, IOException {
        ScanWebPage.locator = new URL(address);
        ScanWebPage.buffed = new BufferedInputStream(locator.openStream());
    }

}
