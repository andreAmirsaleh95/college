/* *****************************************
* CSCI205 - Software Engineering and Design
* Spring 2016
* Instructor: Brian King
* Section: 1:00-2:00 MWF
*
* Name: Andre Amirsaleh
* Date: 1/28/2016
*
* Lab / Assignment: lab03
*
* Description: practice string methods
*
* *****************************************/
package lab03;

/**
 * The StringChallenge class is used to evaluate several different string
 * exercises from lab03.
 *
 * @author brk009
 */
public class StringChallenge {

    /**
     * Count the number of vowels in a string.
     *
     * @param s The string to test
     * @return The number of vowels in <code>s</code>
     */
    public static int countVowels(String s) {

        int numVowels = 0;
        int stringLength = s.length();
        String currLetter;

        for (int i = 0; i < stringLength; i++) {
            currLetter = s.substring(i, i + 1);
            if (currLetter.equalsIgnoreCase("a") || currLetter.equalsIgnoreCase(
                    "e") || currLetter.equalsIgnoreCase("i") || currLetter.equalsIgnoreCase(
                    "o") || currLetter.equalsIgnoreCase("u")) {
                numVowels += 1;
            }

        }
        return numVowels;
    }

    /**
     * Count the number of vowels in a string. This method uses recursion
     *
     * @param s The string to test
     * @return The number of vowels in <code>s</code>
     */
    public static int countVowelsRec(String s) {
        int stringLength = s.length();
        String subString = s.substring(0, 1);

        if (subString.equalsIgnoreCase("a") || subString.equalsIgnoreCase("e") || subString.equalsIgnoreCase(
                "i") || subString.equalsIgnoreCase("o") || subString.equalsIgnoreCase(
                "u")) {
            if (stringLength >= 2) {
                return 1 + countVowelsRec(s.substring(1));
            } else {
                return 1;
            }
        } else if (stringLength >= 2) {
            return 0 + countVowelsRec(s.substring(1));
        } else {
            return 0;
        }
    }

    /**
     * Tests if a string is a palindrome.
     *
     * @param s The string to test
     * @return boolean
     */
    public static boolean isPalindrome(String s) {

        int stringLength = s.length();
        String newString = "";

        for (int i = stringLength - 1; i >= 0; i--) {
            newString += s.substring(i, i + 1);
        }
        if (newString.equals(s)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * Swaps the first and last characters of a string as long as they are both
     * letters.
     *
     * @param s The string in which the letters are swapped
     * @return <code>s</code> with the first and last characters swapped
     */
    public static String swapFirstAndLastLetter(String s) {
        char firstChar = s.charAt(0);
        char lastChar = s.charAt(s.length() - 1);
        if (Character.isLetter(firstChar) && Character.isLetter(lastChar)) {
            return s.substring(s.length() - 1).toUpperCase() + s.substring(1,
                                                                           s.length() - 1) + s.substring(
                            0, 1).toLowerCase();
        } else {
            return s;
        }
    }

    /**
     * Removes all instances of one string from another.
     *
     * @param s The string from which we will remove
     * @param sRemove The string which we will remove from <code>s</code>
     * @return The number of vowels in <code>s</code>
     */
    public static String withoutString(String s, String sRemove) {
        return s.replaceAll(sRemove, "");
    }

    /**
     * Sums all of the integers in a string
     *
     * @param s The string which may contain integers to sum
     * @return Integer sum of all of the integers that may be in <code>s</code>
     */
    public static int sumNumbersInString(String s) {

        int sLength = s.length();
        char currChar;
        int sum = 0;
        int currNum = 0;
        boolean midNum = false;

        for (int i = 0; i < sLength; i++) {
            currChar = s.charAt(i);
            if (Character.isDigit(currChar)) {
                if (midNum) {
                    currNum = currNum * 10 + Integer.parseInt(s.substring(i,
                                                                          i + 1));
                } else {
                    currNum += Integer.parseInt(s.substring(i, i + 1));
                    midNum = true;
                }
                if (i == sLength - 1) {
                    sum += currNum;
                }
            } else {
                sum += currNum;
                currNum = 0;
                midNum = false;
            }
        }

        return sum;
    }

    /**
     * Main program to test out each String processing method
     */
    public static void main(String[] args) {
        String sTest = "Mississippi River";
        System.out.printf("countVowels(\"%s\") = %d\n", sTest,
                          countVowels(sTest));
        System.out.printf("countVowelsRec(\"%s\") = %d\n", sTest,
                          countVowelsRec(sTest));

        System.out.printf("isPalindrome(\"%s\") = %b\n", sTest, isPalindrome(
                          sTest));
        sTest = "amanapanama";
        System.out.printf("isPalindrome(\"%s\") = %b\n", sTest, isPalindrome(
                          sTest));

        sTest = "Testing";
        System.out.printf("swapFirstAndLastLetter(\"%s\") = \"%s\"\n", sTest,
                          swapFirstAndLastLetter(sTest));
        sTest = "Testing123";
        System.out.printf("swapFirstAndLastLetter(\"%s\") = \"%s\"\n", sTest,
                          swapFirstAndLastLetter(sTest));

        sTest = "Testing Running Walking Jumping";
        System.out.printf("withoutString(\"%s\",\"%s\") = \"%s\"\n", sTest,
                          "ing", withoutString(sTest, "ing"));
        System.out.printf("withoutString(\"%s\",\"%s\") = \"%s\"\n", sTest,
                          "Sleep", withoutString(sTest, "Sleep"));

        sTest = "a1b2c3";
        System.out.printf("sumNumbersInString(\"%s\") = %d\n", sTest,
                          sumNumbersInString(sTest));
        sTest = "aa12bb34cc56dd78";
        System.out.printf("sumNumbersInString(\"%s\") = %d\n", sTest,
                          sumNumbersInString(sTest));
    }
}
