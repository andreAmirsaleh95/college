/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: Apr 29, 2016
 * Time: 3:48:12 AM
 *
 * Project: csci205FinalProject
 * Package: tetris.view
 * File: TetriminoComponent
 * Description: The Component class for Tetrimino
 *
 * ****************************************
 */
package tetris.view;

import java.awt.Point;
import org.newdawn.slick.GameContainer;
import org.newdawn.slick.Graphics;
import org.newdawn.slick.Image;
import tetris.model.Block;
import tetris.model.Tetrimino;
import tetris.resources.Resources;

/**
 * Possesses the capability to render a given Tetrimino on the screen.
 *
 * @author Brooke Bullek
 */
public class TetriminoComponent {

    /**
     * The Tetrimino to be rendered by this component.
     */
    private Tetrimino tetrimino;

    /**
     * The location of the pivot block of this Tetrimino.
     */
    private Point relativeTetriminoLocation;

    /**
     * The constructor for the TetriminoComponent class.
     */
    public TetriminoComponent() {
        tetrimino = null;
        relativeTetriminoLocation = null;
    }

    /* Getters and setters */
    public Tetrimino getTetrimino() {
        return tetrimino;
    }

    public void setTetrimino(Tetrimino tetrimino) {
        this.tetrimino = tetrimino;
    }

    public Point getRelativeTetriminoLocation() {
        return relativeTetriminoLocation;
    }

    public void setRelativeTetriminoLocation(Point relativeTetriminoLocation) {
        this.relativeTetriminoLocation = relativeTetriminoLocation;
    }
    /* End of getters and setters */

    /**
     * Renders a Tetrimino within the game window by drawing each of its 4
     * Blocks.
     *
     * @author Xizhou Li & Brooke Bullek
     * @param gc A generic game container that handles the game loop
     * @param g A graphics context used to render primitives to the canvas
     */
    public void render(GameContainer gc, Graphics g) {
        // draw each block of this Tetrimino relative to the gameboard
        for (Block block : tetrimino.getBlockArray()) {
            // record absolute position of this Block
            int xLocation = (int) (relativeTetriminoLocation.getX()
                                   + block.getLocation().getX());
            int yLocation = (int) (relativeTetriminoLocation.getY()
                                   + block.getLocation().getY());

            // extract the color of this Block
            String color = block.getColor();
            // draw the block as a small square
            Image image = Resources.IMAGES.get(color);
            image.draw(xLocation * PixelDimension.BLOCK_WIDTH.getPixels(),
                       yLocation * PixelDimension.BLOCK_WIDTH.getPixels(),
                       PixelDimension.BLOCK_WIDTH.getPixels(),
                       PixelDimension.BLOCK_WIDTH.getPixels());
        }
    }
}
