package com.practice;

/**
 * Utility functions for the CLI tool
 */
public class Utils {

    /**
     * Greets a person by name
     * @param name the name of the person to greet
     * @return a greeting message
     */
    public static String greet(String name) {
        if (name == null || name.isEmpty()) {
            return "Hello, World!";
        }
        return "Hello, " + name + "!";
    }

    /**
     * Reverses a given string
     * @param text the text to reverse
     * @return the reversed text
     */
    public static String reverse(String text) {
        if (text == null) {
            return "";
        }
        return new StringBuilder(text).reverse().toString();
    }
}
