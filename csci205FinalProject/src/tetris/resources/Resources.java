/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Andre Amirsaleh, Brooke Bullek, Daniel Vasquez, Xizhou Li
 * Date: Apr 23, 2016
 * Time: 4:36:27 PM
 *
 * Project: csci205FinalProject
 * Package: tetris.resources
 * File: Resources
 * Description: Images, sounds, songs, and animations
 *
 * ****************************************
 */
package tetris.resources;

import java.awt.Font;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import javax.sound.sampled.UnsupportedAudioFileException;
import org.newdawn.slick.Animation;
import org.newdawn.slick.Image;
import org.newdawn.slick.Music;
import org.newdawn.slick.SlickException;
import org.newdawn.slick.Sound;
import org.newdawn.slick.SpriteSheet;
import org.newdawn.slick.TrueTypeFont;
import org.newdawn.slick.util.ResourceLoader;

/**
 * Contains static Map attributes of files (image, sound, music, and animation
 * files) to use in the GUI.
 *
 * @author Xizhou Li and Brooke Bullek
 */
public class Resources {

    /**
     * Image files.
     */
    public static final Map<String, Image> IMAGES = collectImages();

    /**
     * Sounds files.
     */
    public static final Map<String, Sound> SOUNDS = collectSounds();

    /**
     * Music files.
     */
    public static final Map<String, Music> MUSICS = collectMusic();

    /**
     * Animation files.
     */
    public static final Map<String, Animation> ANIMATIONS = collectAnimations();

    /**
     * Font files.
     */
    public static final Map<String, TrueTypeFont> FONTS = collectFonts();

    /**
     * Loads an image from the directory given a relative path so that it can be
     * used within the game.
     *
     * @author Xizhou Li
     * @param path A relative path from the root of the project directory
     * @return An Image object
     * @throws SlickException
     */
    private static Image loadImage(String path) throws SlickException {
        String abspath = new File(path).getAbsolutePath();
        return new Image(abspath, false, Image.FILTER_NEAREST);
    }

    /**
     * Loads music (as a .wav) from the directory so that it can be used within
     * the game.
     *
     * @author Xizhou Li
     * @param path A relative path from the root of the project directory
     * @return A Music object
     * @throws SlickException
     * @throws UnsupportedAudioFileException
     * @throws IOException
     */
    private static Music loadMusic(String path) throws SlickException, UnsupportedAudioFileException, IOException {
        String abspath = new File(path).getAbsolutePath();
        return new Music(path);
    }

    /**
     * Loads a sound (as a .wav) from the directory so that it can be used
     * within the game.
     *
     * @author Xizhou Li
     * @param path A relative path from the root of the project directory
     * @return A Sound object
     * @throws SlickException
     * @throws UnsupportedAudioFileException
     * @throws IOException
     */
    private static Sound loadSound(String path) throws SlickException, UnsupportedAudioFileException, IOException {
        return new Sound(path);
    }

    /**
     * Loads a custom font from a .ttf file into the game's default font.
     *
     * @author Brooke Bullek
     * @see
     * <a href="http://wiki.lwjgl.org/wiki/Slick-Util_Library_-_Part_3_-_TrueType_Fonts_for_LWJGL">
     * http://wiki.lwjgl.org/wiki/Slick-Util_Library_-_Part_3_-_TrueType_Fonts_for_LWJGL</a>
     * @param path The relative path to the .ttf file
     * @param fontSize the size of the font to create
     * @return A TrueTypeFont object which can be used to set the font of
     * Slick's Graphics object when drawing strings
     */
    private static TrueTypeFont loadFont(String path, float fontSize) {
        TrueTypeFont font = null;
        // load font from a .ttf file
        try {
            InputStream inputStream = ResourceLoader.getResourceAsStream(
                    path);
            Font awtFont = Font.createFont(Font.TRUETYPE_FONT, inputStream);
            awtFont = awtFont.deriveFont(fontSize); // set font size
            font = new TrueTypeFont(awtFont, false);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return font;
    }

    /**
     * Collects all of the relevant images from the project directory and places
     * them into a HashMap
     *
     * @author Xizhou Li and Brooke Bullek
     * @return The Map for the <code>IMAGES</code> attribute
     */
    private static Map<String, Image> collectImages() {
        Map<String, Image> images = new HashMap<>();
        try {
            // load block graphics
            images.put("red", loadImage("res/red.png"));
            images.put("orange", loadImage("res/orange.png"));
            images.put("green", loadImage("res/green.png"));
            images.put("yellow", loadImage("res/yellow.png"));
            images.put("blue", loadImage("res/blue.png"));
            images.put("cyan", loadImage("res/cyan.png"));
            images.put("magenta", loadImage("res/magenta.png"));

            // load menu backgrounds
            images.put("background", loadImage("res/spaceHalf.png"));
            images.put("menuNoHighlight", loadImage(
                       "res/menu_bg_nohl.png"));
            images.put("menuHighlightPlay", loadImage(
                       "res/menu_bg_hl_play.png"));
            images.put("menuHighlightScores", loadImage(
                       "res/menu_bg_hl_scores.png"));
            images.put("menuHighlightExit", loadImage(
                       "res/menu_bg_hl_exit.png"));

            // load high scores backgrounds
            images.put("backgroundScores", loadImage(
                       "res/high_scores_bg.png"));
            images.put("backgroundScoresHighLight", loadImage(
                       "res/high_scores_bg_hl.png"));

            // load panel component for the game state
            images.put("gameComponent", loadImage(
                       "res/game_component.png"));

            // load Tetris logo
            images.put("menu", loadImage("res/Tetris-logo.png"));
        } catch (SlickException ex) {
            ex.printStackTrace();
        }
        return images;
    }

    /**
     * Collects all of the relevant sounds from the project directory and places
     * them into a HashMap.
     *
     * @author Xizhou Li
     * @return The Map for the <code>SOUNDS</code> attribute
     */
    private static Map<String, Sound> collectSounds() {
        Map<String, Sound> sounds = new HashMap<>();
        try {
            sounds.put("breakSound", loadSound("res/break.wav"));
        } catch (SlickException | UnsupportedAudioFileException | IOException ex) {
            ex.printStackTrace();
        }
        return sounds;
    }

    /**
     * Collects all of the relevant music from the project directory and places
     * them into a HashMap.
     *
     * @author Xizhou Li and Brooke Bullek
     * @return The HashMap for the <code>MUSICS</code> attribute
     */
    private static Map<String, Music> collectMusic() {
        Map<String, Music> musics = new HashMap<>();
        try {
            musics.put("backgroundMusicRemix", loadMusic(
                       "res/bgremix.wav"));
            musics.put("backgroundMusic2", loadMusic("res/Tetris2.wav"));
            musics.put("backgroundMusic1", loadMusic("res/Tetris1.wav"));
        } catch (SlickException | UnsupportedAudioFileException | IOException ex) {
            ex.printStackTrace();
        }
        return musics;
    }

    /**
     * Collects all of the relevant animations from the project directory and
     * places them into a HashMap.
     *
     * @author Brooke Bullek
     * @return The Map for the <code>ANIMATIONS</code> attribute
     */
    private static Map<String, Animation> collectAnimations() {
        Map<String, Animation> animations = new HashMap<>();
        try {
            // load the game over animation
            SpriteSheet gameOverSheet = new SpriteSheet(
                    "res/gameOverSheet.png", 1800, 400);
            animations.put("gameOverAnimation",
                           new Animation(gameOverSheet, 200));
        } catch (SlickException ex) {
            ex.printStackTrace();
        }
        return animations;
    }

    /**
     * Collects all of the relevant fonts from the project directory and places
     * them into a HashMap.
     *
     * @author Brooke Bullek
     * @return The Map for the <code>FONTS</code> attribute
     */
    private static Map<String, TrueTypeFont> collectFonts() {
        Map<String, TrueTypeFont> fonts = new HashMap<>();
        // load the font for the active score of the game window
        fonts.put("activeHighScore", loadFont("res/digitalism.ttf", 40f));

        // load the font for the high scores screen
        fonts.put("oldHighScore", loadFont("res/digitalism.ttf", 30f));
        fonts.put("scoreRetro", loadFont("res/prstartk.ttf", 15f));
        return fonts;
    }
}
