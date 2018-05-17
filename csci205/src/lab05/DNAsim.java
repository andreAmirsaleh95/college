/* *****************************************
* CSCI205 - Software Engineering and Design
* Spring 2016
*
* Name: Andre Amirsaleh
* Date: Feb 3, 2016
* Time: 9:05:10 PM
*
* Project: csci205
* Package: lab05
* File: DNAsim
* Description:
*
* ****************************************
 */
package lab05;

import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author Andre Amirsaleh
 */
public class DNAsim {

    /**
     * Generates a character string of nucleotides (ACGT) representing DNA
     *
     * @param length length of DNA (integer number of characters)
     * @param gcContentPct percent (double) of Gs and Cs in DNA
     * @return Array of ACGT characters
     */
    public static char[] generateDNA(int length, double gcContentPct) {
        System.out.println("Generating...");
        Random rand = new Random();
        char[] dna = new char[length];
        double chance;

        for (int i = 0; i <= length - 1; i++) {
            chance = rand.nextDouble() * 100;
            if (chance <= gcContentPct) {
                if (rand.nextInt(2) == 0) {
                    dna[i] = 'G';
                } else {
                    dna[i] = 'C';
                }
            } else if (rand.nextInt(2) == 0) {
                dna[i] = 'T';
            } else {
                dna[i] = 'A';
            }
        }
        System.out.println("Complete!");
        return dna;
    }

    /**
     * Prints the actual frequencies for each nucleotide in the DNA array
     *
     * @param dna Array of ACGT characters
     */
    public static void printDNAStats(char[] dna) {
        int aTotal = 0;
        int cTotal = 0;
        int gTotal = 0;
        int tTotal = 0;

        for (int i = 0; i <= dna.length - 1; i++) {
            if (dna[i] == 'A') {
                aTotal += 1;
            } else if (dna[i] == 'C') {
                cTotal += 1;
            } else if (dna[i] == 'G') {
                gTotal += 1;
            } else if (dna[i] == 'T') {
                tTotal += 1;
            }
        }
        double aPct = (double) aTotal / dna.length * 100;
        double cPct = (double) cTotal / dna.length * 100;
        double gPct = (double) gTotal / dna.length * 100;
        double tPct = (double) tTotal / dna.length * 100;

        System.out.println("Actial content of DNA sequence");
        System.out.printf("A: %8d (%.1f%%)%n", aTotal, aPct);
        System.out.printf("C: %8d (%.1f%%)%n", cTotal, cPct);
        System.out.printf("G: %8d (%.1f%%)%n", gTotal, gPct);
        System.out.printf("T: %8d (%.1f%%)%n", tTotal, tPct);
    }

    /**
     * Prints the index and length of the longest repeating nucleotide
     *
     * @param dna Array of ACGT characters
     */
    public static void printLongestRepeat(char[] dna) {
        char prevChar;
        char currChar;
        int finalIndex = 0;
        int currRpt = 0;
        int longestRpt = 0;
        char longestNucleotide = dna[finalIndex];

        for (int i = 1; i <= dna.length - 1; i++) {
            prevChar = dna[i - 1];
            currChar = dna[i];

            if (prevChar == currChar) {
                currRpt += 1;
                if (currRpt > longestRpt) {
                    longestRpt = currRpt;
                    longestNucleotide = currChar;
                }
            } else {
                if (currRpt == longestRpt) {
                    finalIndex = i - longestRpt;
                }
                currRpt = 0;
            }
        }
        System.out.printf("Longest repeated nucleotide: %d %c's [index: %d]%n",
                          longestRpt, longestNucleotide, finalIndex);
    }

    /**
     * Main method to run all other class methods
     *
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int length;
        double gcContentPct;

        System.out.print("Hello. Welcome to the DNA simulator. How long? ");
        Scanner in = new Scanner(System.in);
        length = in.nextInt();
        System.out.print("What %GC-content? ");
        gcContentPct = in.nextInt();
        char[] dna = generateDNA(length, gcContentPct);
        printDNAStats(dna);
        printLongestRepeat(dna);
    }

}
