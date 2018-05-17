/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: May 2, 2016
 * Time: 9:56:00 PM
 *
 * Project: csci205FinalProject
 * Package: tetris.model
 * File: GameBoardTest
 * Description:
 *
 * ****************************************
 */
package tetris.model;

import java.awt.Point;
import org.junit.After;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import org.junit.Before;
import org.junit.Test;

/**
 *
 * @author xizhouli
 */
public class GameBoardTest {
    GameBoard instance;

    public GameBoardTest() {
    }

    @Before
    public void setUp() {
        instance = new GameBoard();
    }

    @After
    public void tearDown() {
        instance = null;
    }

    /**
     * Test of validate method, of class GameBoard.
     */
    @Test
    public void testValidate() {
        System.out.println("validate");
        int xPos = 0;
        int yPos = 0;
        Point[] newPositions = {new Point(xPos, yPos)};
        instance = new GameBoard();
        instance.setBlock(xPos, yPos, new Block());
        boolean expResult = false;
        boolean result = instance.validate(newPositions);
        assertEquals(expResult, result);

        xPos = 1;
        yPos = 1;
        Point[] newPositions2 = {new Point(xPos, yPos)};
        expResult = true;
        result = instance.validate(newPositions2);
        assertEquals(expResult, result);

    }

    /**
     * Test of clearLine method, of class GameBoard.
     *
     * @author Xizhou Li and Brooke Bullek
     */
    @Test
    public void testClearLine() {
        System.out.println("clearLine");
        int y = 0;
        instance = new GameBoard();
        for (int i = 0; i < instance.getWidth(); i++) {
            instance.setBlock(i, y, new Block());
        }

        instance.clearLine(y);
        for (int i = 0; i < instance.getWidth(); i++) {
            assertTrue(instance.getTheBoard()[i][y] == null);
        }
    }

    /**
     * Test of dropLine method, of class GameBoard.
     *
     * @author Xizhou Li and Brooke Bullek
     */
    @Test
    public void testDropLine() {
        System.out.println("dropLine");
        int y = 2;
        instance = new GameBoard();
        for (int i = 0; i < instance.getWidth(); i++) {
            instance.setBlock(i, y, new Block());
        }

        instance.dropLine(y);
        for (int i = 0; i < instance.getWidth(); i++) {
            assertTrue(instance.getTheBoard()[i][y - 1] == null);
        }
    }

}
