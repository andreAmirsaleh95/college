/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: Apr 18, 2016
 * Time: 8:02:16 PM
 *
 * Project: csci205FinalProject
 * Package: tetris.model
 * File: MainModel
 * Description:
 *
 * ****************************************
 */
package tetris.model;

import java.awt.Point;
import java.util.ArrayList;
import java.util.Random;
import tetris.resources.Resources;

/**
 * Contains all of the internal states of Tetris that are subject to change
 * throughout the duration of a game.
 *
 * @author Brooke Bullek
 */
public class MainModel {

    /**
     * The default location of a new Tetrimino when it's first being loaded.
     * Traditionally, the Tetrimino starts at the top of the middle of the
     * screen.
     */
    private Point initialTetriminoLocation;

    /**
     * The active game board for this game
     */
    public GameBoard myBoard;

    /**
     * A bag of 7 different types of T-shapes
     */
    private ArrayList<TShape> bag;

    /**
     * The Tetrimino that is currently being placed
     */
    private Tetrimino activeTetrimino;

    /**
     * The Tetrimino that will be available to the player when the active
     * Tetrimino is placed
     */
    private TShape nextTetrimino;

    /**
     * The Tetrimino stored in the hold place. Switched with the active
     * Tetrimino when the hold button is pressed.
     */
    private Tetrimino heldTetrimino;

    /**
     * Flagged when Tetrimino is held and reset when a new Tetrimino is moved
     * from the queue into the activeTetrimino slot.
     */
    private boolean tetriminoHasBeenHeldThisMove;

    /**
     * The location of the center block of the active Tetrimino RELATIVE to the
     * game board
     */
    private Point activeTetriminoLocation;

    /**
     * The rate at which Tetriminos fall; scales with difficulty and increases
     * whenever the user performs a "soft drop"
     */
    private int dropSpeed;

    /**
     * A toggle that indicates whether to perform a soft drop (holding the down
     * arrow key) on the Tetrimino
     */
    private boolean softDropActivated;

    /**
     * Marks the elapsed time since the last game update
     */
    private int timer;

    /**
     * Indicates whether the current game is still active or has been lost
     */
    private boolean gameOver;

    /**
     * The number of lines cleared so far in the current game
     */
    private int numLinesCleared;

    /**
     * The index of the LEVELS array corresponds to the number of lines that
     * have been cleared, and the value at each index is the drop speed (in
     * milliseconds) at this level.
     */
    private static final int[] LEVELS = {800, 720, 630, 550, 470, 380, 300,
                                         220, 130, 100, 80, 80, 80, 70, 70, 70, 50, 50, 50, 30, 30, 30, 30, 30,
                                         30, 30, 30, 30, 20};

    /**
     * Constructs a new instance of MainModel.
     *
     * @author Brooke Bullek
     */
    public MainModel() {
        bag = new ArrayList<>();

        // TODO: Modify gameboard selection to change with user's choice of
        // game mode?
        myBoard = new GameBoard();

        // the Tetrimino should spawn at the midpoint of the top of the screen
        initialTetriminoLocation = new Point(myBoard.getWidth() / 2, 0);

        heldTetrimino = null;
        tetriminoHasBeenHeldThisMove = false;

        setNextTetrimino(pickTShape()); // pick the first shape
        advanceTetriminoQueue(); // set the first active Tetrimino

        dropSpeed = 800; // initialize to 800 ms

        softDropActivated = false; // will change if user holds DOWN arrow key

        numLinesCleared = 0;

        gameOver = false;
    }

    /* Getters and setters */
    public Point getActiveTetriminoLocation() {
        return activeTetriminoLocation;
    }

    public void setActiveTetriminoLocation(Point activeTetriminoLocation) {
        this.activeTetriminoLocation = activeTetriminoLocation;
    }

    public GameBoard getMyBoard() {
        return this.myBoard;
    }

    public void setMyBoard(GameBoard myBoard) {
        this.myBoard = myBoard;
    }

    public Tetrimino getActiveTetrimino() {
        return this.activeTetrimino;
    }

    public void setActiveTetrimino(Tetrimino activeTetrimino) {
        this.activeTetrimino = activeTetrimino;
    }

    public void setActiveTetrimino(TShape shape) {
        this.activeTetrimino = new Tetrimino(shape);
        this.activeTetriminoLocation = initialTetriminoLocation;
    }

    public TShape getNextTetrimino() {
        return this.nextTetrimino;
    }

    public void setNextTetrimino(TShape nextTetrimino) {
        this.nextTetrimino = nextTetrimino;
    }

    public Tetrimino getHeldTetrimino() {
        return this.heldTetrimino;
    }

    public void setHeldTetrimino(Tetrimino heldTetrimino) {
        this.heldTetrimino = heldTetrimino;
    }

    public int getTimer() {
        return timer;
    }

    public void setTimer(int timer) {
        this.timer = timer;
    }

    public int getDropSpeed() {
        return dropSpeed;
    }

    public void setDropSpeed(int dropSpeed) {
        this.dropSpeed = dropSpeed;
    }

    public int getPoints() {
        return this.myBoard.getScoreBoard().getPoints();
    }

    public void addPoints(int points) {
        this.myBoard.getScoreBoard().addPoints(points);
    }

    public boolean isSoftDropActivated() {
        return softDropActivated;
    }

    public void setSoftDropActivated(boolean softDropActivated) {
        this.softDropActivated = softDropActivated;
    }

    public boolean isGameOver() {
        return gameOver;
    }

    public void setGameOver(boolean gameOver) {
        this.gameOver = gameOver;
    }

    public ArrayList<TShape> getBag() {
        return bag;
    }
    /* End of getters and setters */

    /**
     * Inserts each of the 7 Tetrimino types (from the TShape enum) into the
     * "grab bag" to be used for Tetrimino generation.
     *
     * @author Xizhou Li
     */
    public void initializeBag() {
        for (TShape shape : TShape.values()) {
            bag.add(shape);
        }
    }

    /**
     * Randomly selects an available TShape from the "grab bag," removes this
     * from the bag, and returns it.
     *
     * @author Xizhou Li
     * @return an available TShape to set as the next Tetrimino to drop
     */
    public TShape pickTShape() {
        // if this "grab bag" has been depleted, reset it with all 7 TShapes
        if (this.bag.isEmpty()) {
            initializeBag();
        }

        // use a random number generator to pull out a new TShape
        Random randomizer = new Random();
        int index = randomizer.nextInt(this.bag.size());
        TShape shape = bag.get(index);

        // remove this TShape from the bag
        bag.remove(index);

        return shape;
    }

    /**
     * Sets the active Tetrimino to the next Tetrimino in the queue and
     * generates a new next Tetrimino.
     *
     * @author Daniel Vasquez
     */
    private void advanceTetriminoQueue() {
        setActiveTetrimino(nextTetrimino);
        setNextTetrimino(pickTShape());
        this.tetriminoHasBeenHeldThisMove = false;
    }

    /**
     * Places the blocks in the active Tetrimino into the gameboard and load a
     * new Tetrimino at the top of the screen.
     *
     * @author Brooke Bullek & Daniel Vasquez
     */
    public void lockActiveTetrimino() {
        if (gameOver) {
            return; // prevent loading new Tetriminos if the game is over
        }

        for (Block block : activeTetrimino.getBlockArray()) {
            // extract the location (x/y coordinates) of this block
            int xPos = (int) (block.getLocation().getX() + activeTetriminoLocation.getX());
            int yPos = (int) (block.getLocation().getY() + activeTetriminoLocation.getY());
            Point[] newBlockPosition = {new Point(xPos, yPos)};
            if (myBoard.validate(newBlockPosition) == true) {
                myBoard.setBlock(xPos, yPos, block); // stick this Block in the board
            }
        }

        // detect lines that may have been made, clear them, and perform the appropriate drops
        ArrayList<Integer> lines = (ArrayList<Integer>) this.myBoard.detectLines();
        if (!lines.isEmpty()) {
            increaseDifficulty(lines.size());
            this.myBoard.clearLines(lines);
            Resources.SOUNDS.get("breakSound").play();
            this.myBoard.dropLines(lines);
        }
        // change the active Tetrimino and add shape to queue
        advanceTetriminoQueue();
    }

    /**
     * Increases the model's numLinesCleared by a given amount and updates the
     * game's difficulty accordingly.
     *
     * @author Brooke Bullek
     * @param lines The number of lines that were recently cleared
     */
    public void increaseDifficulty(int lines) {
        numLinesCleared += lines;

        /* 28 lines cleared corresponds to the max level of the game; difficulty
         will not increase after this */
        if (numLinesCleared > 28) {
            dropSpeed = LEVELS[28];
        } else {
            dropSpeed = LEVELS[numLinesCleared];
        }
    }

    /**
     * Swaps the active Tetrimino with the held Tetrimino.
     *
     * @author Daniel Vasquez
     */
    public void holdActiveTetrimino() {
        if (!this.tetriminoHasBeenHeldThisMove) {
            if (this.heldTetrimino == null) {
                this.heldTetrimino = this.activeTetrimino;
                this.setActiveTetrimino(pickTShape());
            } else {
                Tetrimino oldHeldTetrimino = this.heldTetrimino;
                this.heldTetrimino = this.activeTetrimino;
                this.activeTetrimino = oldHeldTetrimino;
            }
            this.activeTetriminoLocation = initialTetriminoLocation;
            this.tetriminoHasBeenHeldThisMove = true;
        }
    }

    /**
     * Returns an array of points corresponding to updated locations on the
     * gameboard if we were to move the active Tetrimino.
     *
     * @author Brooke Bullek
     * @param shiftAmountX the number of horizontal blocks to move the Tetrimino
     * @param shiftAmountY the number of vertical blocks to move the Tetrimino
     * @return an array of the new positions of the Tetrimino's blocks
     */
    public Point[] calculateNewBlockPositions(int shiftAmountX, int shiftAmountY) {
        Point newBlockPositions[] = new Point[4];
        int i = 0;
        for (Block block : activeTetrimino.getBlockArray()) {
            /* calculate the new coordinate, which is the absolute position
             * of this Tetrimino on the gameboard, plus the relative position
             * of this individual block to the Tetrimino, plus the shift amount
             */
            int newX = (int) (block.getLocation().getX()
                              + activeTetriminoLocation.getX()
                              + shiftAmountX);
            int newY = (int) (block.getLocation().getY()
                              + activeTetriminoLocation.getY()
                              + shiftAmountY);
            newBlockPositions[i] = new Point(newX, newY);
            i++;
        }
        return newBlockPositions;
    }

    /**
     * Checks whether the game is over (i.e the Tetrimino has reached the top of
     * the screen).
     *
     * @author Brooke Bullek
     * @return a boolean indicating whether the player has lost the game
     */
    public boolean checkGameOver() {
        int row = 0; // we'll only check row 0 (the top of the board)
        for (int i = 0; i < myBoard.getWidth(); i++) {
            if (myBoard.getTheBoard()[i][row] != null) {
                return true;
            }
        }
        return false;
    }

    /**
     * Moves the active Tetrimino in a specified direction if there is room on
     * the gameboard. If so, this position is updated; else, nothing happens.
     *
     * @authors Daniel Vasquez & Brooke Bullek
     * @param d A Direction associated with this movement; e.g. left/right/down
     * @return a boolean indicating whether this Tetrimino was able to be moved
     */
    public boolean moveActiveTetrimino(Direction d) {
        Point[] newBlockPositions = calculateNewBlockPositions(d.getX(),
                                                               d.getY());

        if (myBoard.validate(newBlockPositions) == true) {
            Point newPosition = new Point(
                    (int) activeTetriminoLocation.getX() + d.getX(),
                    (int) activeTetriminoLocation.getY() + d.getY());
            activeTetriminoLocation = newPosition;

            if (softDropActivated) {
                // performing a soft drop adds 1 point per row
                addPoints(ScoreBoard.SOFT_DROP_POINTS_PER_ROW);
            }
            return true;
        } else {
            if (d == Direction.DOWN) {
                // lock this Tetrimino if it can't be moved downward
                lockActiveTetrimino();
            }
            return false;
        }
    }

    /**
     * Instantly drops a Tetrimino to the bottom of the gameboard.
     *
     * @author Brooke Bullek
     */
    public void instantDropTetrimino() {
        while (moveActiveTetrimino(Direction.DOWN)) {
            addPoints(ScoreBoard.HARD_DROP_POINTS_PER_ROW);
        }
    }

    /**
     * Allows the active Tetrimino to rotate if there is room on the gameboard.
     * If so, this position is updated; else, nothing happens.
     *
     * @author Brooke Bullek
     * @param factor
     */
    public void rotateActiveTetrimino(int factor) {
        // create a deep copy of the old arrangement of Tetrimino blocks
        Block[] oldBlockArray = new Block[Tetrimino.NUM_BLOCKS];
        for (int i = 0; i < Tetrimino.NUM_BLOCKS; i++) {
            oldBlockArray[i] = (Block) activeTetrimino.getBlockArray()[i].copy();
        }

        Point[] newBlockPositions = new Point[Tetrimino.NUM_BLOCKS];
        activeTetrimino.rotate(factor);

        // grab the new absolute positions (i.e. their positions on the board)
        int i = 0;
        for (Block block : activeTetrimino.getBlockArray()) {
            int newX = (int) (block.getLocation().getX() + activeTetriminoLocation.getX());
            int newY = (int) (block.getLocation().getY() + activeTetriminoLocation.getY());
            newBlockPositions[i] = new Point(newX, newY);
            i++;
        }

        // reset to the old block array if this rotation is illegal
        if (myBoard.validate(newBlockPositions) == false) {
            activeTetrimino.setFourBlocks(oldBlockArray);
        }
    }
}
