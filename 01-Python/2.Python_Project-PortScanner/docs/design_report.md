
# Port Scanner Design Report

## Overview
This document outlines the design and implementation of the port scanning application developed by Duck Slouster team. The application is a command-line tool that allows users to scan ports on specified hosts using either URLs or IP addresses.

## System Architecture

The system is divided into three main modules:

1. `port_scanner.py` - Main entry point
2. `scan_module.py` - Core scanning functionality
3. `validation.py` - Input validation and verification

### Component Breakdown

#### 1. Port Scanner (port_scanner.py)
- Entry point for the application
- Imports and initializes the scanning module

#### 2. Scan Module (scan_module.py)
Main components:
- ASCII art logo display
- Logging setup functionality
- Website scanning function
- Port scanning implementation
- Main program flow control

Key Functions:
- `setup_logging()`: Configures logging system
- `scan_website(website)`: Resolves website URLs to IP addresses
- `find_port(ip_address)`: Performs port scanning
- `main()`: Handles user interaction and program flow

#### 3. Validation Module (validation.py)
Input validation functions:
- `validate_ip_address(ip_address)`: Validates IP address format
- `validate_port_range(port_range)`: Validates port numbers and ranges
- `validate_url(url)`: Validates and resolves URLs

## Features

1. Input Flexibility
   - Accepts both URLs and IP addresses
   - Supports single port and port range scanning

2. Validation
   - IP address format verification
   - URL format and resolution checking
   - Port range validation (1-65535)

3. Logging
   - Comprehensive logging system
   - Timestamps for all operations
   - Separate log files for different operations

4. Error Handling
   - Graceful error management
   - User-friendly error messages
   - Proper exception handling

## Security Considerations

1. Input Sanitization
   - All user inputs are validated
   - Protection against invalid inputs
   - Safe URL parsing and resolution

2. Resource Management
   - Proper socket handling
   - Timeout implementations
   - Controlled port scanning

## Technical Implementation

### Dependencies
- socket: Network operations
- logging: Event logging
- validators: URL validation
- ipaddress: IP address handling
- urllib.parse: URL parsing

### Data Flow
1. User Input → Validation
2. Input Processing → IP Resolution
3. Port Scanning → Results
4. Output Generation → Logging

## Future Improvements

1. Performance Optimization
   - Implement multi-threading for faster scanning
   - Add batch scanning capabilities

2. Feature Enhancements
   - Service detection
   - Custom timeout settings
   - Scan result export formats

3. User Interface
   - Add GUI interface option
   - Improve result visualization

## Team Members
- Harold
- Tommy
- Patrick
- Steve
