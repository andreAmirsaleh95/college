/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Brian King
 *
 * Package: hw3
 * File: ExampleMain
 *
 * Description:
 * This file contains a simple class with a main method to demonstrate how
 * to interact with the audio and WaveForm classes
 * ****************************************
 */
package hw3;

import hw3.utility.DSP;
import hw3.model.SampleSizeType;
import hw3.model.WaveForm;
import hw3.model.WaveFormException;
import hw3.utility.AudioUtility;
import hw3.utility.WaveFormUtility;
import java.io.File;
import java.io.IOException;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.UnsupportedAudioFileException;

/**
 * This class does nothing more than shows a simple demonstration of how to
 * interact with the other audio and waveform classes.
 *
 * @author Prof. Brian King
 */
public class ExampleMain {

    /**
     * Main method to demonstrate the WaveForm and related classes
     *
     * @param args the command line arguments
     *
     * @throws javax.sound.sampled.UnsupportedAudioFileException
     * @throws java.io.IOException
     * @throws hw3.model.WaveFormException
     * @throws javax.sound.sampled.LineUnavailableException
     */
    public static void main(String[] args) throws UnsupportedAudioFileException, IOException, WaveFormException, LineUnavailableException {
        // Use your own .wav file here. THis example code hard-codes the file
        // name. This code has been tested with 8-bit or 16-bit files.
//      File inFile = new File("Bowed-Bass-C2.wav");
        File inFile = new File("baaaaa_8bit.wav");

        // Print some info about the file
        AudioUtility.printAudioFileFormatInfo(inFile);

        // Create a WaveForm from the file
        WaveForm wav = new WaveForm(inFile);

        // Print the AudioFormat info for the WaveForm
        AudioUtility.printAudioFormat(wav.getFormat());

        // Play it!
        AudioUtility.playAudioInputStream(wav.getAudioInputStream());

        // Write it - Shows how you can get the raw data as a CSV file.
        WaveFormUtility.writeWavDataAsCSV(wav, "wavdata.csv");

        // Adjust the volume
        DSP.adjustVolume(wav, 50.0f);

        // Play it!
        AudioUtility.playAudioInputStream(wav.getAudioInputStream());

        // OK. Now, let's show how to generate a waveform. Let's use
        // concert A - 440Hz, at 16kHZ
        wav = new WaveForm(440, 44100.0f, SampleSizeType.SIXTEEN_BIT,
                           1.0);
        // Print the AudioFormat info for the WaveForm
        AudioUtility.printAudioFormat(wav.getFormat());
        
        // Play it!
        AudioUtility.playAudioInputStream(wav.getAudioInputStream());


    }

}
