package com.practice;

import org.junit.Test;
import static org.junit.Assert.*;

/**
 * Unit tests for Utils class
 */
public class UtilsTest {

    @Test
    public void testGreetWithName() {
        String result = Utils.greet("John");
        assertEquals("Hello, John!", result);
    }

    @Test
    public void testGreetWithoutName() {
        String result = Utils.greet("");
        assertEquals("Hello, World!", result);
    }

    @Test
    public void testGreetWithNull() {
        String result = Utils.greet(null);
        assertEquals("Hello, World!", result);
    }

    @Test
    public void testReverseSimpleString() {
        String result = Utils.reverse("hello");
        assertEquals("olleh", result);
    }

    @Test
    public void testReverseWithSpaces() {
        String result = Utils.reverse("hello world");
        assertEquals("dlrow olleh", result);
    }

    @Test
    public void testReverseEmptyString() {
        String result = Utils.reverse("");
        assertEquals("", result);
    }

    @Test
    public void testReverseNull() {
        String result = Utils.reverse(null);
        assertEquals("", result);
    }

    @Test
    public void testReverseSingleCharacter() {
        String result = Utils.reverse("a");
        assertEquals("a", result);
    }
}
