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
 * Description: Class that represents a generic gameboard
 *
 * ****************************************
 */
package tetris.model;

import java.awt.Point;
import java.util.ArrayList;
import java.util.List;

/**
 * Generic gameboard which contains falling and sitting blocks
 *
 * @author Daniel Vasquez
 */
public class GameBoard {
    /**
     * Standard width in <code>Block</code>s
     */
    public static final int WIDTH = 10;

    /**
     * Standard width in <code>Block</code>s
     */
    public static final int HEIGHT = 20;

    /**
     * Width of the <code>GameBoard</code>'s grid
     *
     * @author Daniel Vasquez
     */
    private final int width;

    /**
     * Height of the <code>GameBoard</code>'s grid
     *
     * @author Daniel Vasquez
     */
    private final int height;

    /**
     * The <code>GameBoard</code>'s grid
     *
     * @author Daniel Vasquez
     */
    private Block[][] blockArray;

    /**
     * Contains info/methods to access/manipulate current score.
     */
    private ScoreBoard scoreBoard;

    /**
     * Constructs an empty standard size Tetris board with default height and
     * width.
     *
     * @author Daniel Vasquez
     */
    public GameBoard() {
        this.blockArray = new Block[WIDTH][HEIGHT];
        this.width = WIDTH;
        this.height = HEIGHT;
        this.scoreBoard = new ScoreBoard();
    }

    /**
     * Constructs an empty custom size Tetris board.
     *
     * @param width Width of the <code>Board</code>'s grid
     * @param height Height of the <code>Board</code>'s grid
     * @author Daniel Vasquez
     */
    public GameBoard(int width, int height) {
        this.blockArray = new Block[width][height];
        this.width = width;
        this.height = height;
    }

    /* Getters and setters */
    public int getWidth() {
        return width;
    }

    public int getHeight() {
        return height;
    }

    public ScoreBoard getScoreBoard() {
        return scoreBoard;
    }

    public Block[][] getTheBoard() {
        return blockArray;
    }

    /**
     * Given a block and a pair of coordinates corresponding to indices of this
     * board's 2D Block array, sets the cell in that position to the new Block.
     *
     * @author Brooke Bullek
     * @param xPos the row in which to place the new Block
     * @param yPos the column in which to place the new Block
     * @param block the new Block to insert
     */
    public void setBlock(int xPos, int yPos, Block block) {
        blockArray[xPos][yPos] = block;
    }
    /* End of getters and setters */

    /**
     * Validates that a given array of cells (represented by Points) are empty
     * on this board so that we can place Blocks here. Returns false if any of
     * the Points exceed the boundary of this board or if the cell is already
     * full.
     *
     * @author Brooke Bullek
     * @param newPositions An array of points being checked for occupency on the
     * board.
     * @return Whether <code>newPositions</code> are valid spots on this
     * GameBoard
     */
    public boolean validate(Point[] newPositions) {
        int newXPos;
        int newYPos;

        // check each of the Points and only return true if they all fit
        for (int i = 0; i < newPositions.length; i++) {
            // grab the i and y coordinates from this Point
            newXPos = (int) newPositions[i].getX();
            newYPos = (int) newPositions[i].getY();

            // return false if this Point exceeds the vertical boundary
            if (newYPos < 0 || newYPos >= this.height) {
                return false;
            }
            // return false if this Point exceeds the horizontal boundary
            if (newXPos < 0 || newXPos >= this.width) {
                return false;
            }
            // return false if this is a valid cell that is already occupied
            if (this.blockArray[newXPos][newYPos] != null) {
                return false;
            }
        }
        return true; // everything's good!
    }

    /**
     * Detects lines in the board's block array.
     *
     * @author Daniel Vasquez
     * @return List of indexes where lines are located
     */
    public List detectLines() {
        ArrayList<Integer> rowIndices = new ArrayList();
        // Iterate over each row
        for (int j = 0; j < this.height; j++) {
            // Iterate over each column
            for (int i = 0; i < this.width; i++) {
                // If the block is empty, ignore this line
                if (this.blockArray[i][j] == null) {
                    break;
                    // If the line was full, flag the line as full
                } else if (i + 1 == this.width) {
                    rowIndices.add(j);
                }
            }
        }
        return rowIndices;
    }

    /**
     * Clears all lines in a given list.
     *
     * @author Daniel Vasquez
     * @param lineYCoords a list of y coordinates indicating lines in the board.
     */
    public void clearLines(ArrayList<Integer> lineYCoords) {
        for (Integer y : lineYCoords) {
            clearLine(y);
        }
    }

    /**
     * Clears a line.
     *
     * @author Daniel Vasquez
     * @param y The value of the line's vertical position.
     */
    public void clearLine(int y) {
        for (int x = 0; x < this.width; x++) {
            this.blockArray[x][y] = null;
        }
        scoreBoard.addPoints(ScoreBoard.POINTS_PER_LINE);
    }

    /**
     * Performs line drops for each line listed.
     *
     * @param lineYCoords a list of y coordinates indicating lines in the board.
     */
    public void dropLines(ArrayList<Integer> lineYCoords) {
        for (Integer y : lineYCoords) {
            dropLine(y);
        }
    }

    /**
     * Drops every block above a line down one place.
     *
     * @author Daniel Vasquez
     * @param y The coordinate of the line's vertical position. Y.
     */
    public void dropLine(int y) {
        // Iterate over each line starting with y and ending at 1.
        for (int j = y; j > 0; j--) {
            // Iterate over each block in the line
            for (int i = 0; i < this.width; i++) {
                // Set the line to the line above it
                this.blockArray[i][j] = this.blockArray[i][j - 1];
            }
        }
    }

}
