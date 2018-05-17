/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: Apr 9, 2016
 * Time: 5:26:33 PM
 *
 * Project: csci205FinalProject
 * Package: tetris.model
 * File: ScoreBoard
 * Description: Class that represents the score board. Keeps track of the points
 *
 * ****************************************
 */
package tetris.model;

/**
 * Contains data and methods for the score board. Keeps track of the player's
 * points
 *
 * @author Andre Amirsaleh
 */
public class ScoreBoard {
    /**
     * The number of points you get for clearing a line.
     */
    public static final int POINTS_PER_LINE = 100;

    /**
     * The number of points earned per line during a hard drop
     */
    public static final int HARD_DROP_POINTS_PER_ROW = 2;

    /**
     * The number of points earned per line during a soft drop
     */
    public static final int SOFT_DROP_POINTS_PER_ROW = 1;

    /**
     * Your current score.
     */
    private int points;

    /**
     * Constructs a new <code>ScoreBoard</code> instance
     *
     * @author Andre Amirsaleh
     */
    public ScoreBoard() {
        points = 0;
    }

    /**
     * Adds points to the <code>points</code> attribute
     *
     * @author Andre Amirsaleh and Xizhou Li
     */
    public void addPoints(int points) {
        this.points += points;
    }

    /* Getters and setters */
    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }
    /* End of getters and setters */
}
