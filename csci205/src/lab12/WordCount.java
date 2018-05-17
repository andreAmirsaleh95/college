/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh
 * Date: Mar 1, 2016
 * Time: 9:10:48 PM
 *
 * Project: csci205
 * Package: lab12
 * File: WordCount
 * Description:
 *
 * ****************************************
 */
package lab12;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 * Class to count the number of a words in a specified file
 *
 * @author Andre Amirsaleh
 */
public class WordCount {

    /**
     * (BufferedReader) A buffered version of the input file
     */
    BufferedReader inBuf;

    /**
     * Number of lines in the input file
     */
    private int numLines;

    /**
     * Number of words in the input file
     */
    private int numWords;

    /**
     * Number of bytes in the input file
     */
    private int numBytes;

    /**
     * Name of the input file
     */
    public String fileName;

    /**
     * Constructs a WordCount instance
     *
     * @param file (File) File to count the words of
     * @throws FileNotFoundException
     */
    public WordCount(File file) throws FileNotFoundException {
        this.inBuf = new BufferedReader(new FileReader(file));
        this.numLines = 0;
        this.numWords = 0;
        this.numBytes = 0;
        this.fileName = file.getName();
    }

    /**
     * Constructs a WordCount instance
     *
     * @param fileName (String) Name of a file to count the words of
     * @throws FileNotFoundException
     */
    public WordCount(String fileName) throws FileNotFoundException {
        this.inBuf = new BufferedReader(new FileReader(fileName));
        this.numLines = 0;
        this.numWords = 0;
        this.numBytes = 0;
        this.fileName = fileName;
    }

    /**
     * Counts the number of lines, words, and characters in the file
     *
     * @throws java.io.IOException
     */
    public void doIt() throws IOException {
        int charNum;
        boolean inWord = false;
        char ch;

        do {
            charNum = inBuf.read();
            ch = (char) charNum;

            this.numBytes++;

            if (!Character.isWhitespace(ch)) {
                if (!inWord) {
                    this.numWords++;
                }
                inWord = true;
            } else { // In whitespace
                inWord = false;
                if (ch == '\n') {
                    this.numLines++;
                }
            }
        } while (charNum >= 0);
    }

    /**
     * Returns a String representing the WordCount output
     *
     * @return (String) number of lines, words, and characters in the file
     */
    @Override
    public String toString() {
        return String.format("%d %d %d %s", this.numLines, this.numWords,
                             this.numBytes, this.fileName);
    }

    /**
     * Gets inBuf attribute
     *
     * @return (BufferedReader) inBuf attribute
     */
    public BufferedReader getInBuf() {
        return inBuf;
    }
}
