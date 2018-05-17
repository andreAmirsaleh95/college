/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: Apr 19, 2016
 * Time: 2:04:03 AM
 *
 * Project: csci205FinalProject
 * Package: tetris.model
 * File: Direction
 * Description: Contains the possible directions in which the Tetrimino can move
 *
 * ****************************************
 */
package tetris.model;

import java.awt.Point;

/**
 * Contains the possible directions in which the Tetrimino can move. This cuts
 * down on a lot of reused code inside the MainController class...
 *
 * @author Brooke Bullek
 */
public enum Direction {
    // each Direction is simply an x and y value
    LEFT(new Point(-1, 0)), RIGHT(new Point(1, 0)), DOWN(new Point(0, 1));

    /**
     * A Point object to hold the coordinate direction associated with each
     * type. For example, 'LEFT' is -1 on the horizontal axis but doesn't modify
     * the y-axis, so its Point is (-1, 0).
     */
    private final Point d;

    /**
     * Constructor for the Direction enum.
     *
     * @author Brooke Bullek
     * @param d the direction as a Point object
     */
    Direction(Point d) {
        this.d = d;
    }

    public Point getDirection() {
        return d;
    }

    public int getX() {
        return (int) d.getX();
    }

    public int getY() {
        return (int) d.getY();
    }
}
