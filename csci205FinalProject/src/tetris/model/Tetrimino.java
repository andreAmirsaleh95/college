/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: Apr 13, 2016
 * Time: 12:15:47 AM
 *
 * Project: csci205FinalProject
 * Package: tetris.model
 * File: TShape
 * Description: Representation of a Tetrimino
 *
 * ****************************************
 */
package tetris.model;

import java.awt.Point;

/**
 * A shaped piece made up of four blocks. Represented as a 2D array of blocks.
 * Rotates about the array's center. "They fall, can be rotated, and used to
 * break lines." -Tetris Wikia
 *
 * @author Daniel Vasquez & Brooke Bullek
 */
public class Tetrimino {

    /**
     * The number of blocks that form a Tetrimino.
     */
    public static final int NUM_BLOCKS = 4;

    /**
     * An array of four Blocks that stores the internal layout of the Tetrimino
     * piece. Each Block contains a Point where (0, 0) is the center (pivot)
     * block of the Tetrimino.
     */
    private Block[] fourBlocks;

    /**
     * The general "shape" of this Tetrimino (S-block, L-block, etc.).
     */
    private TShape shape;

    /**
     * Constructs a new Tetrimino of type TShape.
     *
     * @author Brooke Bullek
     * @param shape the TShape of this piece (e.g. S-block, L-block)
     */
    public Tetrimino(TShape shape) {
        Block[] blockArray = new Block[NUM_BLOCKS];

        initFourBlocks(shape, blockArray);
        /* Assign attributes to this Tetrimino. No need to assign a Color
         * since that information is contained within the TShape enum.
         */
        this.shape = shape;
        this.fourBlocks = blockArray;
    }

    /**
     * Initializes the <code>fourBlocks</code> attribute
     *
     * @param shape1
     * @param blockArray1
     */
    private void initFourBlocks(TShape shape1, Block[] blockArray1) {
        // iterate through the Point array of this TShape and create four Blocks
        for (int i = 0; i < shape1.getBlockLocations().length; i++) {
            blockArray1[i] = new Block(shape1.getColor(),
                                       shape1.getBlockLocations()[i]);
        }
    }

    /* Getters and setters */
    public Block[] getBlockArray() {
        return fourBlocks;
    }

    public void setFourBlocks(Block[] newFourBlocks) {
        this.fourBlocks = newFourBlocks;
    }

    public TShape getShape() {
        return shape;
    }

    public void setShape(TShape shape) {
        this.shape = shape;
    }

    public String getColor() {
        return this.fourBlocks[0].getColor();
    }
    /* End of getters and setters */

    /**
     * Rotates the Tetrimino 90 degrees left or right, depending on the factor
     * given (-1 denotes a left rotation, 1 denotes a right rotation). All
     * Tetriminos will be rotated around their pivot (center) point.
     *
     * @author Brooke Bullek
     *
     * @see <a html="http://www.blitzmax.com/Community/posts.php?topic=77559">
     * http://www.blitzmax.com/Community/posts.php?topic=77559</a>
     *
     * @param factor a positive or negative value indicating CW or CCW rotation
     */
    public void rotate(int factor) {
        // if Tetrimino is an O-block (non-rotatable), do nothing
        if (this.shape == TShape.O_BLOCK) {
            return;
        }

        // update each of the Blocks (i.e. their locations) of this Tetrimino
        for (int i = 0; i < NUM_BLOCKS; i++) {
            // first extract old x, y coordinates of this block
            int oldX = (int) this.fourBlocks[i].getLocation().getX();
            int oldY = (int) this.fourBlocks[i].getLocation().getY();

            // if performing a right (clockwise) rotation
            if (factor > 0) {
                this.fourBlocks[i].setLocation(new Point(oldY, -oldX));
            } // if performing a left (counter-clockwise) rotation
            else if (factor < 0) {
                this.fourBlocks[i].setLocation(new Point(-oldY, oldX));
            }
        }
    }
}
