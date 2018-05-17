/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: Apr 30, 2016
 * Time: 11:50:27 PM
 *
 * Project: csci205FinalProject
 * Package: tetris.view
 * File: TetriminoPreviewComponent
 * Description: Component class used to display elements
 * relevant to blocks/Tetriminos not on the gameboard.
 *
 * ****************************************
 */
package tetris.view;

import java.awt.Point;
import org.newdawn.slick.GameContainer;
import org.newdawn.slick.Graphics;
import org.newdawn.slick.Image;
import tetris.model.Block;
import tetris.model.TShape;
import tetris.model.Tetrimino;
import tetris.resources.Resources;

/**
 * Displays the next Tetrimino that will be available.
 *
 * @author Daniel Vasquez
 */
public class TetriminoPreviewComponent {

    /**
     * The point at which to begin drawing the Tetrimino.
     */
    private static final Point RELATIVE_LOCATION = new Point(14, 7);

    /**
     * The offset at which to draw the next Tetrimino.
     */
    private static final Point NEXT_OFFSET = new Point(0, 0);

    /**
     * The offset at which to draw the held Tetrimino.
     */
    private static final Point HOLD_OFFSET = new Point(0, 7);

    /**
     * Used to draw the next Tetrimino preview.
     */
    private Tetrimino nextTetrimino;

    /**
     * Used to draw the hold Tetrimino preview.
     */
    private Tetrimino holdTetrimino;

    /**
     * Constructs a NextTetriminoComponent object.
     *
     * @author Daniel Vasquez
     */
    public TetriminoPreviewComponent() {
        // Initialize tetriminos to something
        this.nextTetrimino = null;
        this.holdTetrimino = null;
    }

    /**
     * Constructs a NextTetriminoComponent object with nextShape and
     * holdTetrimino preinitialized.
     *
     * @author Daniel Vasquez
     * @param nextTetrimino
     * @param holdTetrimino
     */
    public TetriminoPreviewComponent(Tetrimino nextTetrimino,
                                     Tetrimino holdTetrimino) {
        this.nextTetrimino = nextTetrimino;
        this.holdTetrimino = holdTetrimino;
    }

    /* Getters and setters */
    public void setNextTetrimino(Tetrimino nextTetrimino) {
        if (nextTetrimino != this.nextTetrimino) {
            this.nextTetrimino = nextTetrimino;
        }
    }

    public void setHoldTetrimino(Tetrimino holdTetrimino) {
        if (holdTetrimino != this.holdTetrimino) {
            this.holdTetrimino = holdTetrimino;
        }
    }
    /* End of getters and setters */

    /**
     * Renders the Hold and Next Tetrimino previews and their graphical
     * elements.
     *
     * @author Daniel Vasquez
     * @param gc A generic game container that handles the game loop
     * @param g A graphics context used to render primitives to the canvas
     */
    public void render(GameContainer gc, Graphics g) {
        Point[] offsets = {NEXT_OFFSET, HOLD_OFFSET};
        Tetrimino[] tetriminos = {nextTetrimino, holdTetrimino};
        for (int i = 0; i < tetriminos.length; i++) {
            if (tetriminos[i] != null) {
                for (Block block : tetriminos[i].getBlockArray()) {
                    // record absolute position of this Block
                    int xLocation = (int) (RELATIVE_LOCATION.getX() + offsets[i].getX()
                                           + block.getLocation().getX());
                    int yLocation = (int) (RELATIVE_LOCATION.getY() + offsets[i].getY()
                                           + block.getLocation().getY());

                    if (tetriminos[i].getShape() == TShape.O_BLOCK) {
                        yLocation += 1;
                    }

                    // extract the color of this Block
                    String color = block.getColor();
                    // draw the block as a small square
                    Image image = Resources.IMAGES.get(color);
                    image.draw(
                            xLocation * PixelDimension.BLOCK_WIDTH.getPixels(),
                            yLocation * PixelDimension.BLOCK_WIDTH.getPixels(),
                            PixelDimension.BLOCK_WIDTH.getPixels(),
                            PixelDimension.BLOCK_WIDTH.getPixels());
                }
            }
        }
    }
}
