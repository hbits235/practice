package com.practice;

/**
 * Main CLI entry point
 * Handles command-line arguments and routes to appropriate utility functions
 */
public class Cli {

    public static void main(String[] args) {
        if (args.length == 0) {
            printUsage();
            System.exit(1);
        }

        String command = args[0].toLowerCase();

        switch (command) {
            case "greet":
                handleGreet(args);
                break;
            case "reverse":
                handleReverse(args);
                break;
            case "--help":
            case "-h":
            case "help":
                printHelp();
                break;
            case "--version":
            case "-v":
                printVersion();
                break;
            default:
                System.err.println("Unknown command: " + command);
                printUsage();
                System.exit(1);
        }
    }

    private static void handleGreet(String[] args) {
        if (args.length < 2) {
            System.out.println(Utils.greet(""));
        } else {
            String name = String.join(" ", java.util.Arrays.copyOfRange(args, 1, args.length));
            System.out.println(Utils.greet(name));
        }
    }

    private static void handleReverse(String[] args) {
        if (args.length < 2) {
            System.err.println("Error: reverse command requires a string argument");
            System.exit(1);
        }
        String text = String.join(" ", java.util.Arrays.copyOfRange(args, 1, args.length));
        System.out.println(Utils.reverse(text));
    }

    private static void printUsage() {
        System.err.println("Usage: clitool <command> [arguments]");
        System.err.println("Run 'clitool help' for more information");
    }

    private static void printHelp() {
        System.out.println("CLI Tool - Simple utility functions");
        System.out.println();
        System.out.println("USAGE:");
        System.out.println("    clitool <command> [arguments]");
        System.out.println();
        System.out.println("COMMANDS:");
        System.out.println("    greet [name]     - Greet a person. If no name given, greets 'World'");
        System.out.println("    reverse <text>   - Reverse the given text");
        System.out.println("    help             - Show this help message");
        System.out.println("    --version, -v    - Show version information");
        System.out.println();
        System.out.println("EXAMPLES:");
        System.out.println("    clitool greet John");
        System.out.println("    clitool reverse \"hello world\"");
        System.out.println("    clitool --help");
    }

    private static void printVersion() {
        System.out.println("clitool version 1.0.0");
    }
}
