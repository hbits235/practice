# CLITool

A simple, lightweight command-line tool built with Java that provides utility functions. This is a practice project demonstrating how to create a distributable CLI tool installable via WinGet.

## Features

- **Greet Command**: Greet a person by name or the world by default
- **Reverse Command**: Reverse any given string
- Simple command-line interface with helpful messages
- Built with Java 11+

## Installation

### Prerequisites

- Windows 10 or later (for WinGet)
- Java Runtime Environment (JRE) 11 or later

### Install via WinGet

```bash
winget install practice.clitool
```

The tool will be installed to your system PATH, and you can run `clitool` from anywhere.

### Manual Installation

1. Download the latest release from [GitHub Releases](https://github.com/yourusername/practice/releases)
2. Extract the ZIP file to a location of your choice
3. Add the extracted folder to your system PATH, or run `clitool.bat` directly

## Usage

### Show Help

```bash
clitool help
clitool --help
clitool -h
```

### Greet Command

Greet a person by name:

```bash
clitool greet John
# Output: Hello, John!
```

Greet the world (no argument):

```bash
clitool greet
# Output: Hello, World!
```

### Reverse Command

Reverse a string:

```bash
clitool reverse "hello"
# Output: olleh
```

Reverse a phrase with spaces:

```bash
clitool reverse "hello world"
# Output: dlrow olleh
```

### Version

Show version information:

```bash
clitool --version
clitool -v
# Output: clitool version 1.0.0
```

## Project Structure

```
practice/
├── clitool/                          # Main CLI tool project
│   ├── pom.xml                      # Maven build configuration
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/
│   │   │   │   └── com/practice/
│   │   │   │       ├── Cli.java           # Main entry point with argument parsing
│   │   │   │       └── Utils.java         # Utility functions (greet, reverse)
│   │   │   └── resources/
│   │   └── test/
│   │       └── java/
│   │           └── com/practice/
│   │               └── UtilsTest.java     # Unit tests
│   ├── bin/
│   │   └── clitool.bat              # Windows batch wrapper
│   └── out/                         # Compiled classes (generated)
├── winget/
│   └── practice.clitool.yaml        # WinGet package manifest
├── .gitignore
└── README.md
```

## Development

### Build the Project

Using Maven:

```bash
cd clitool
mvn clean package
```

The FAT JAR will be created at `target/clitool.jar`.

### Run Tests

```bash
cd clitool
mvn test
```

### Compile Manually (without Maven)

```bash
cd clitool
javac -d out/classes src/main/java/com/practice/*.java
```

### Run the Tool

**From JAR (after building):**

```bash
java -jar clitool/target/clitool.jar greet Alice
```

**Using the batch wrapper:**

```bash
clitool/bin/clitool.bat greet Alice
```

## Creating a Release for WinGet

1. **Build the project**
   ```bash
   cd clitool
   mvn clean package
   ```

2. **Create distribution package**
   - Copy `target/clitool.jar` to a release folder
   - Copy `bin/clitool.bat` to the same folder
   - Create a ZIP file with both files

3. **Upload to GitHub Releases**
   - Create a new release on GitHub
   - Upload the ZIP file as an asset
   - Note the download URL

4. **Update WinGet manifest**
   - Calculate SHA256 hash of the ZIP file:
     ```bash
     certutil -hashfile clitool-1.0.0.zip SHA256
     ```
   - Update `winget/practice.clitool.yaml`:
     - Replace `InstallerUrl` with the GitHub release URL
     - Replace `InstallerSha256` with the calculated hash

5. **Submit to WinGet Repository**
   - Fork the [winget-pkgs](https://github.com/microsoft/winget-pkgs) repository
   - Create a new directory: `manifests/p/practice/clitool/1.0.0/`
   - Copy your manifest files there
   - Submit a Pull Request

## Command-Line Arguments

| Command | Arguments | Description |
|---------|-----------|-------------|
| `greet` | `[name]` | Greet a person by name. If no name is provided, greets "World" |
| `reverse` | `<text>` | Reverse the provided text (required) |
| `help` | - | Display help information |
| `--help`, `-h` | - | Display help information |
| `--version`, `-v` | - | Display version information |

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Support

For issues, questions, or suggestions, please open an issue on [GitHub Issues](https://github.com/yourusername/practice/issues).

## Changelog

### Version 1.0.0 (2026-02-26)
- Initial release
- Implemented `greet` command
- Implemented `reverse` command
- Created WinGet installer support
