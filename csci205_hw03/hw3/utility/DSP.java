/* *****************************************
 * CSCI205 - Software Engineering and Design
 * Spring 2016
 *
 * Name: Brian King
 *
 * Project: csci205_hw3
 *
 * Package: hw3.model
 * File: DSP
 * Description - a collection of DSP utility methods
 * ****************************************
 */
package hw3.utility;

import hw3.model.SampleSizeType;
import hw3.model.WaveForm;
import hw3.model.WaveFormException;
import java.nio.ByteBuffer;
import java.nio.ShortBuffer;
import java.util.Arrays;

/**
 * The DSP class will act as a utility class to assist with DSP transformations
 * on WaveForm data.
 *
 * @author brk009
 */
public class DSP {
    /**
     * Adjust the volume of a WaveForm instance. The code behaves a bit differently
     * between 8-bit and 16-bit PCM files due to the differences in internal
     * representation of PCM data.
     *
     * 8-bit PCM format store values from 0 -> 255.
     * 16-bit PDM format files are -32768 -> 32767
     *
     * Clearly, 16-bit files match how Java behaves. However, 8-bit files do not!
     * Thus, you need to be careful how you do the math for 8-bit files.!
     *
     * @param wave - The WaveForm instance to adjust the volume with
     * @param pct - The percentage to adjust the volume. 100.0 would result in no change
     *
     * @throws WaveFormException
     */
    public static void adjustVolume(WaveForm wave, float pct) throws WaveFormException {
        if (wave.getSampleSize() == SampleSizeType.EIGHT_BIT) {
            ByteBuffer toBuf = wave.getByteBufferWrapper();
            toBuf.rewind();
            byte[] origBytes = Arrays.copyOf(wave.getByteArray(), wave.getByteArray().length);

            for(int i = 0; i < toBuf.limit(); i++) {
                // Convert the value to a short to access it as 0-255
                short val = (short)(origBytes[i] & 0xFF);

                // Adjust the value
                val = (short)(val * pct / 100.0);

                // Write the value back as a byte
                toBuf.put((byte)(val & 0xFF));
            }
        }
        else {
            // The data is 16-bit. Grab the ShortBuffer view of the data, and
            // iterate thorugh adjusting the volume
            ShortBuffer toBuf = wave.getShortBufferWrapper();
            toBuf.rewind();
            short[] origShorts = new short[toBuf.limit()];
            toBuf.get(origShorts);
            toBuf.rewind();

            for(int i = 0; i < toBuf.limit(); i++) {
                toBuf.put((short)(origShorts[i] * pct / 100.0));
            }
        }

    }
}

