/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: Apr 29, 2016
 * Time: 7:58:06 PM
 *
 * Project: csci205FinalProject
 * Package: tetris.utility
 * File: HighScoresUtility
 * Description: Used by MainController and HighScoresState to manage the high
 * scores
 * ****************************************
 */
package tetris.utility;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/**
 * Contains all of the necessary data/methods to access/manage the high scores
 *
 * @author Andre Amirsaleh
 */
public class HighScoresUtility {

    /**
     * The number of high highScores to save.
     */
    private static final int NUM_HIGH_SCORES = 10;

    /**
     * The name of the file to store the top highScores to.
     */
    private static final String FILENAME = "highScores.txt";

    /**
     * If the given <code>score</code> is large enough, it will be saved to the
     * top high highScores. High highScores are saved to <code>FILENAME</code>.
     *
     * @param score Player's score (at the end of the game)
     * @see
     * http://stackoverflow.com/questions/15754523/how-to-write-text-file-java
     */
    public static void updateHighScores(int score) {
        // Must call getHighScores to initialize highScores!!!
        int[] highScores = getHighScores();

        // Sort highScores in descending order:
        List<Integer> highScoresList = new ArrayList<>();
        for (int highScore : highScores) {
            highScoresList.add(highScore);
        }
        highScoresList.add(score);
        highScoresList.sort(Comparator.reverseOrder());
        for (int i = 0; i < highScores.length; i++) {
            highScores[i] = highScoresList.get(i);
        }

        // Save highScores to a text file:
        saveHighScores(highScores);
    }

    /**
     * Gets the top <code>NUM_HIGH_SCORES</code> high highScores from the
     * <code>FILENAME</code> text file
     *
     * @return An array of highScores (integers) in decreasing order
     * @see
     * https://www.caveofprogramming.com/java/java-file-reading-and-writing-files-in-java.html
     */
    @SuppressWarnings("CallToPrintStackTrace")
    public static int[] getHighScores() {
        int[] highScores = new int[NUM_HIGH_SCORES];
        File highScoresFile = new File(FILENAME);
        FileReader reader;
        if (highScoresFile.exists()) {
            try {
                reader = new FileReader(highScoresFile);
                BufferedReader bufferedReader = new BufferedReader(reader);
                String line;
                int score;
                for (int i = 0; i < highScores.length; i++) {
                    if ((line = bufferedReader.readLine()) == null) {
                        break;
                    }
                    score = Integer.valueOf(line);
                    highScores[i] = score;
                }
                bufferedReader.close();
            } catch (FileNotFoundException ex) {
                ex.printStackTrace();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }

        return highScores;
    }

    /**
     * Saves the <code>highScores</code> to the <code>FILENAME</code> text file
     *
     * @param highScores The updated list of high scores
     */
    @SuppressWarnings("CallToPrintStackTrace")
    private static void saveHighScores(int[] highScores) {
        File highScoresFile = new File(FILENAME);
        String sScore;
        BufferedWriter writer = null;
        try {
            if (highScoresFile.createNewFile()) { /* File does not already exist
                 and was successfully created */

                // Write all high scores as 0:
                writer = new BufferedWriter(new FileWriter(highScoresFile));
                for (int i = 0; i < highScores.length; i++) {
                    sScore = String.valueOf(highScores[i]);
                    writer.write(sScore + "\n");
                }

            } else { /* high scores have already been saved to FILENAME and need
                 to be overwritten */

                writer = new BufferedWriter(new FileWriter(
                        highScoresFile));
                for (int i = 0; i < highScores.length; i++) {
                    sScore = String.valueOf(highScores[i]);
                    writer.write(sScore + "\n");
                }
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            try {
                writer.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
