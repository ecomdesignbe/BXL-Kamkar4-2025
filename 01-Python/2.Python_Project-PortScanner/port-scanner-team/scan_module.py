import logging
import socket
import validation
import sys
import os
from datetime import datetime

# ASCII art logo for Duck Slouster
# Art ASCII pour Duck Slouster
print(r"""______            _      _____ _                 _             
|  _  \          | |    /  ___| |               | |            
| | | |_   _  ___| | __ \ `--.| | ___  _   _ ___| |_ ___ _ __ 
| | | | | | |/ __| |/ /  `--. \ |/ _ \| | | / __| __/ _ \ '__|
| |/ /| |_| | (__|   <  /\__/ / | (_) | |_| \__ \ ||  __/ |   
|___/  \__,_|\___|_|\_\ \____/|_|\___/ \__,_|___/\__\___|_|   """)
print("\n****************************************************************")
print("\n* Team Members:                                                 *")
print("\n* - Harold                                                     *")
print("\n* - Tommy                                                      *")
print("\n* - Patrick                                                    *")
print("\n* - Steve                                                      *")
print("\n****************************************************************")


def setup_logging(log_file_path=None):
    """
        Centralized logging configuration for Duck Slouster
        Args:
            log_file_path: Optional custom path for log file. If None, uses 'log.txt' in current directory
        """
    if log_file_path is None:
        log_file_path = "log.txt"

    # Ensure the directory exists
    log_dir = os.path.dirname(log_file_path)
    if log_dir and not os.path.exists(log_dir):
        os.makedirs(log_dir)

    logging.basicConfig(
        level=logging.INFO,
        filename=log_file_path,
        filemode="w",
        format="{asctime} - {filename} - {levelname} - {message}",
        style="{",
        datefmt="%Y-%m-%d %H:%M",
    )

    logging.info("Duck Slouster logging initialized")
    return log_file_path


def scan_website(website):
    # Function to get IP address from website URL
    # Fonction pour obtenir l'adresse IP à partir de l'URL du site web
    is_valid, ip_address = validation.validate_url(website)

    if is_valid:
        print(f"The IP address for {website} is: {ip_address}")
        logging.info(f"The IP address for {website} is: {ip_address}")
        return ip_address
    else:
        return None


def find_port(ip_address):
    # Function to scan a specific port on the given IP address
    print(f"the scanning is for the IP {ip_address} ")
    print("enter the port you are looking for")

    try:
        port = input("enter the port you want to scan: ")
        is_valid, result = validation.validate_port_range(port)
        start = 0
        end = 0
        if is_valid:
            start, end = result
            print(f"Start port: {start}, End port: {end}")
            logging.info(f"Start port: {start}, End port: {end}")
        else:
            print(f"Error: {result}")
            logging.error(f"Error: {result}")
            return
        open_ports = []  # array to put open ports
        for port in range(start, end + 1):
            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            socket.setdefaulttimeout(1)

            result = s.connect_ex((ip_address, port))
            if result == 0:
                print("Port {} is open".format(port))
                open_ports.append(port)
                with open("open-ports.txt", "w") as log_file:
                    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                    log_file.write(f"[{timestamp}] Port {port} is open on {ip_address}\n")
            else:
                print("Port {} is closed".format(port))
                logging.error(f"Port {port} is closed")
            s.close()
    except KeyboardInterrupt:
        print("\n Exiting Program !!!!")
        logging.critical("Exiting Program !!!!")
        sys.exit()
    except socket.gaierror:
        print("\n Hostname Could Not Be Resolved !!!!")
        logging.critical("Hostname Could Not Be Resolved !!!!")
        sys.exit()
    except socket.error:
        print("\ Server not responding !!!!")
        logging.critical("Server not responding !!!!")
        sys.exit()


def main():
    # Main function to handle user input and control program flow
    # Fonction principale pour gérer les entrées utilisateur et contrôler le flux du programme
    url_or_ip = input("Do you have a URL or an IP? ").upper()
    ip = None

    if url_or_ip == "URL":
        # Handle URL input and convert to IP
        # Gérer l'entrée URL et la convertir en IP
        website = input("Enter the website you want to scan: ")
        ip = scan_website(website)
    elif url_or_ip == "IP":
        # Handle direct IP input
        # Gérer l'entrée directe de l'IP
        user_ip = input("Enter the IP you want to scan: ")
        try:
            validation.validate_ip_address(user_ip)
            ip = user_ip
            print(f"✅ Using IP: {ip}")
        except Exception as e:
            print(f"❌ Invalid IP: {e}")
    else:
        print("❌ Please enter either 'URL' or 'IP'")
        logging.warning("Please enter either 'URL' or 'IP'")

    # Only scan ports if we have a valid IP
    # Scanner les ports uniquement si nous avons une IP valide
    if ip:
        find_port(ip)
    else:
        print("❌ No valid IP to scan. Exiting...")
        logging.error("No valid IP to scan. Exiting...")


if __name__ == "__main__":
    setup_logging()
    main()
