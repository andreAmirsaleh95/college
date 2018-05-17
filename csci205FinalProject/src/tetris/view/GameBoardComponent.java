/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: Apr 29, 2016
 * Time: 4:06:51 AM
 *
 * Project: csci205FinalProject
 * Package: tetris.view
 * File: GameBoardComponent
 * Description: The Component class for GameBoard
 *
 * ****************************************
 */
package tetris.view;

import org.newdawn.slick.GameContainer;
import org.newdawn.slick.Graphics;
import org.newdawn.slick.Image;
import tetris.model.GameBoard;
import tetris.resources.Resources;

/**
 * Possesses the capability to render the GameBoard on the screen.
 *
 * @author Brooke Bullek
 */
public class GameBoardComponent {
    /* The GameBoard to be rendered by this component */
    private GameBoard gameBoard;

    /**
     * The constructor for the GameBoardComponent class.
     */
    public GameBoardComponent() {
        gameBoard = null;
    }

    /* Getters and setters */
    public GameBoard getGameBoard() {
        return gameBoard;
    }

    public void setGameBoard(GameBoard gameBoard) {
        this.gameBoard = gameBoard;
    }
    /* End of getters and setters */

    /**
     * Renders a given GameBoard by iterating through the Block array and
     * rendering colorful squares wherever the board is occupied.
     *
     * @author Xizhou Li & Brooke Bullek
     * @param gc A generic game container that handles the game loop
     * @param g A graphics context used to render primitives to the canvas
     */
    public void render(GameContainer gc, Graphics g) {
        Image background = Resources.IMAGES.get("background");

        // iterate through the rows and columns of the Board, drawing each block
        for (int i = 0; i < gameBoard.getWidth(); i++) {
            for (int j = 0; j < gameBoard.getHeight(); j++) {
                // be careful to check that there is indeed a block to draw
                if (gameBoard.getTheBoard()[i][j] != null) {
                    // set the color of this block and fill in the square
                    String color = gameBoard.getTheBoard()[i][j].getColor();
                    // draw the block as a small square
                    Image image = Resources.IMAGES.get(color);
                    image.draw(i * PixelDimension.BLOCK_WIDTH.getPixels(),
                               j * PixelDimension.BLOCK_WIDTH.getPixels(),
                               PixelDimension.BLOCK_WIDTH.getPixels(),
                               PixelDimension.BLOCK_WIDTH.getPixels());
                }
            }
        }
    }

}
