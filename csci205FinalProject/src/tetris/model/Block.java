/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: Apr, 2016
 * Time:
 *
 * Project: csci205FinalProject
 * Package: tetris.controller
 * File: MainController
 * Description: Class that represents a single Block or "Mino"
 *
 * ****************************************
 */
package tetris.model;

import java.awt.Point;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * A block used in the construction of Tetriminos and other Tetris pieces.
 *
 * @author Daniel Vasquez & Brooke Bullek
 */
@SuppressWarnings("EqualsAndHashcode")
public class Block implements Cloneable {
    /**
     * The color of the block.
     */
    private String color;

    /**
     * The representation of the block's location relative to its Tetrimino.
     * This is independent from the Gameboard class(es). Every Tetrimino is
     * rotated around a center square and held within a "bounding box," and its
     * shape can be uniquely identified by a set of four points where (0, 0) is
     * the center.
     */
    private Point location;

    /**
     * The default constructor for the Block class.
     *
     * @author Daniel Vasquez
     */
    public Block() {
        this.color = "";
        this.location = null;
    }

    /**
     * The explicit constructor for the Block class. Instantiates a Block with
     * specific attributes.
     *
     * @param color the color of this block
     * @param location A Point (tuple) that stores x- and y-coordinates
     *
     * @author Daniel Vasquez & Brooke Bullek
     */
    public Block(String color, Point location) {
        this.color = color;
        this.location = location;
    }

    /* Getters and setters */
    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Point getLocation() {
        return location;
    }

    public void setLocation(Point location) {
        this.location = location;
    }
    /* End of getters and setters */

    /**
     * Overrides the == operator to check for equality among two Blocks.
     *
     * @author Brooke Bullek
     * @param obj the object with which to compare this Block
     * @return a boolean indicating whether these objects are equal
     */
    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Block other = (Block) obj;
        if (!Objects.equals(this.color, other.color)) {
            return false;
        }
        return Objects.equals(this.location, other.location);
    }

    /**
     * Returns a deep copy of this Block object.
     *
     * @return a copy of this Block object
     */
    public Block copy() {
        Block block = null;
        try {
            block = (Block) this.clone();
        } catch (CloneNotSupportedException ex) {
            Logger.getLogger(Block.class.getName()).log(
                    Level.WARNING,
                    "Block could not be copied; Cloning not supported",
                    ex);
        }
        return block;
    }
}
