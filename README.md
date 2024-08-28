
## Satvik [An0n B@sH] Port Scanner

**An0n B@sH Port Scanner** is a minimalistic, yet powerful port scanner and vulnerability assessment tool designed to work seamlessly on Linux. This script resolves IP addresses and domain names, provides verbose scanning, and displays real-time progress with estimated completion time. It is an essential tool for security enthusiasts and professionals who require a quick and reliable solution to identify open ports and potential vulnerabilities.

## Features

- **Target Resolution**: Automatically resolves domain names to IP addresses and vice versa, displaying the result in bold blue.
- **Interactive Input**: Prompts users for an IP address or domain name and validates the input.
- **Verbose Scanning**: Executes a detailed scan on the target, providing live updates on progress in bold green.
- **Estimated Completion Time**: Shows a live countdown timer for scan completion in MM:SS format, displayed in bold orange.
- **Help Guide**: Offers an integrated help system with usage details, author information, and links.

## Installation

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/satvik-vs/portscanner.git
   cd portscanner
   ```

2. **Make the Script Executable**:

   ```bash
   chmod +x port_scanner.sh
   ```

3. **Run the Script**:

   You can now run the script directly from the terminal.

   ```bash
   ./port_scanner.sh
   ```

## Usage

### Basic Usage

To run the script, simply provide an IP address or domain name as an argument:

```bash
./port_scanner.sh <IP/Domain>
```

### Interactive Mode

If no arguments are provided, the script will prompt you for input:

```bash
./port_scanner.sh
```

### Help Guide

For a complete overview of available options and usage, use the help switch:

```bash
./port_scanner.sh -h
```

## Example

```bash
./port_scanner.sh example.com
```

- The script will resolve `example.com` to its corresponding IP address.
- The scan will then begin, with a live countdown timer showing the estimated completion time.

## Author

**Satvik (An0n B@sH)**  
- [GitHub](https://github.com/satvik-vs)  
- [Website](https://satvik.live)  
- [contact@satvik.live](mailto:contact@satvik.live)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

