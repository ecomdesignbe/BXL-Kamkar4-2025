![Cybersecurity Illustration](https://raw.githubusercontent.com/GSGSDgggdzez/stactic/main/uploads/Harold_Defree_A_futuristic_cybersecurity-themed_illustration_fea_91e21a5a-36e7-45d2-a1c0-9d7bb35c593a.png)

# Port Scanner Tool

A robust and efficient port scanning utility written in Python that allows you to scan network ports on target hosts.

## Features

- Fast multi-threaded port scanning
- Support for both TCP and UDP scanning
- Custom port range specification
- Input validation and error handling
- Easy-to-use command line interface
- Detailed scan results output

## Project Structure

```
port-scanner-team/
├── scan_module.py    # Core scanning functionality with an interactive dialog
├── validation.py     # Input validation and error checking
└── port_scanner.py   # Scanning functionality with command line
```

## Installation

1. Clone the repository:
```bash
git clone https://github.com/your-username/port-scanner-team.git
cd port-scanner-team
```

2. Ensure you have Python 3.6+ installed
3. No additional dependencies required - uses Python standard library

## Usage

Basic usage:
```bash
python port_scanner.py -h <host> -p <ports>
```

Examples:
```bash
# Scan a single port
python port_scanner.py --url google.com --ports 80

# Scan a range of ports
python port_scanner.py --url google.com --ports 80-443
```

## Features Explained

### Scan Module
- Implements core port scanning logic
- Handles TCP/UDP connections
- Manages threading for concurrent scans
- Provides detailed port status information

### Validation Module
- Validates IP addresses and hostnames
- Ensures proper port range formatting
- Handles input error checking
- Provides helpful error messages

### Port Scanner
- Manages command line interface
- Coordinates scanning operations
- Displays results in a user-friendly format
- Handles program flow control

## Security Notice

This tool is intended for network administrators and security professionals to audit their own networks. Always ensure you have permission before scanning any networks or systems you don't own.

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Authors

- Port Scanner Team

## Acknowledgments

- Thanks to all contributors who have helped with testing and development
- Inspired by classic network security tools like nmap
