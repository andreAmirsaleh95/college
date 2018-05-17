/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: May 2, 2016
 * Time: 4:31:53 PM
 *
 * Project: csci205FinalProject
 * Package: tetris.view
 * File: PixelDimension
 * Description: The number of pixels for specific dimensions in the GUI
 *
 * ****************************************
 */
package tetris.view;

/**
 * Dimensions in pixels used for rendering images in the GUI
 *
 * @author Andre Amirsaleh
 */
public enum PixelDimension {
    BLOCK_WIDTH(32), WINDOW_WIDTH(640), WINDOW_HEIGHT(640);

    /**
     * The number of pixels for this dimension.
     */
    private final int pixels;

    /**
     * Constructs a new PixelDimension instance
     *
     * @param pixels The number of pixels in this PixelDimension.
     */
    PixelDimension(int pixels) {
        this.pixels = pixels;
    }

    /**
     * Returns the <code>pixels</code> attribute
     *
     * @return The number of pixels for this dimension
     */
    public int getPixels() {
        return pixels;
    }
}
