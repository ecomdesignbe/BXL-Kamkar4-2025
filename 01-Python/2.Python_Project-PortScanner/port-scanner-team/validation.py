import ipaddress
import re
import validators
import socket
from urllib.parse import urlparse
import logging


def validate_ip_address(ip_address):
    try:
        ipaddress.ip_address(ip_address)
        return True
    except ValueError:
        print(f"That IP address is invalid: {ip_address}")
        logging.warning(f"That IP address is invalid: {ip_address}")
        return False


def validate_port_range(port_range):
    # Single port case validation
    if port_range.isdigit():
        port = int(port_range)
        if 1 <= port <= 65535:
            logging.info(f"Valid single port: {port}")
            return True, (port, port)
        else:
            logging.info(f"Invalid single port: {port}")
            return False, f"{port_range} is out of range (1-65535)"

    # Port range case validation
    match = re.match(r'^(\d+)-(\d+)$', port_range)
    if match:
        start, end = int(match.group(1)), int(match.group(2))
        if 1 <= start <= end <= 65535:
            logging.info(f"Valid range: {start}-{end}")
            return True, (start, end)
        else:
            logging.info(f"Invalid range: {start}-{end}")
            return False, f"Invalid range port range: {port_range}"
    else:
        logging.warning(f"Invalid port range: {port_range}")
        return False, f"Invalid port range format: {port_range} . Please use this format (port1-port2) ie: (3-554)"


def validate_url(url):
    if url.startswith(('http://', 'https://')):
        if validators.url(url):
            parsed_url = urlparse(url)
            hostname = parsed_url.hostname
        else:
            print(f"Invalid URL format: {url}")
            logging.error(f"Invalid URL format: {url}")
            return False, None
    else:
        # If not a full URL, treat as hostname and add http:// for validation purpose
        test_url = f"http://{url}"
        if validators.url(test_url):
            hostname = url
        else:
            # Try as plain hostname anyway
            hostname = url

    if hostname:
        try:
            ip_address = socket.gethostbyname(hostname)
            if validate_ip_address(ip_address):
                print(f"Successfully resolved {hostname} to {ip_address}")
                logging.info(f"Successfully resolved {hostname} to {ip_address}")
                return True, ip_address
            else:
                return False, None
        except socket.gaierror:
            print(f"Couldn't resolve hostname: {hostname}")
            logging.error(f"Couldn't resolve hostname: {hostname}")

            return False, None
        except Exception as e:
            print(f"Error resolving hostname: {e}")
            logging.error(f"Error resolving hostname: {e}")

            return False, None
    else:
        print(f"Couldn't extract hostname from: {url}")
        logging.error(f"Couldn't extract hostname from: {url}")

        return False, None
