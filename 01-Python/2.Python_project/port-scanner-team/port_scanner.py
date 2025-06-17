# On utilise des outils pour lire ce que l'utilisateur tape / We use tools to read user input from command line
import argparse

# On utilise un carnet pour noter ce qu'on fait / We use a notebook to write down what we do (logs)
import logging
from scan_module import setup_logging
# On prend une fonction spéciale pour configurer le carnet (logs) / We take a special tool to setup the log notebook

# On prend des outils déjà faits pour vérifier les IP et ports / We take tools already made to check IPs and ports
import validation
# On utilise une prise pour parler avec un autre ordinateur / We use a plug to talk with another computer
import socket

# On utilise ça pour savoir où on est sur l'ordi / We use this to know where we are in the computer folders
import os


# Ici on lit ce que l'utilisateur nous demande / Here we read what the user wants to do
def parse_args():
    parser = argparse.ArgumentParser(description="Duck Slouster Port Scanner")

    # L'utilisateur doit choisir soit une IP, soit une URL / User must choose either an IP or a URL
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("--ip", help="Adresse IP à scanner / IP address to scan")
    group.add_argument("--url", help="URL à scanner / URL to scan")

    # Il doit dire quels ports il veut tester / Must say which ports to check
    parser.add_argument("--ports", required=True,
                        help="Plage de ports (ex: 22 ou 20-80) / Port range (e.g. 22 or 20-80)")

    # Il peut demander à voir aussi les ports fermés / Can choose to also see closed ports
    parser.add_argument("--verbose", action="store_true", help="Affiche les ports fermés / Show closed ports")

    return parser.parse_args()


# On va vérifier chaque port un par un / We will check each port one by one
def scan_target(ip, port_range, verbose=False):
    # On vérifie si les ports demandés sont valides / Check if the port range is valid
    is_valid, result = validation.validate_port_range(port_range)
    if not is_valid:
        print(f"❌ Erreur : {result}")
        logging.error(f"Invalid port range: {port_range} -> {result}")
        return

    start_port, end_port = result
    print(f"🔍 Scan de {ip} de {start_port} à {end_port}")
    logging.info(f"Scanning host {ip} from port {start_port} to {end_port}")

    # Chemin vers le fichier open-ports.txt dans le dossier parent / Path to open-ports.txt in parent folder
    open_ports_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'open-ports.txt'))

    for port in range(start_port, end_port + 1):
        # On met un petit temps d'attente pour ne pas aller trop vite / Small wait time to not go too fast
        socket.setdefaulttimeout(1)

        # On crée une prise réseau / We create a network plug
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

        # On essaye de se connecter au port / We try to connect to the port
        result = sock.connect_ex((ip, port))

        if result == 0:
            # Si ça marche, le port est ouvert / If it works, port is open
            print(f"🟢 Port {port} ouvert")
            logging.info(f"Port {port} is open on {ip}")

            # On écrit ça dans le fichier open-ports.txt / We write it in open-ports.txt
            with open(open_ports_path, "a") as f:
                f.write(f"Port {port} is open on {ip}\n")
        elif verbose:
            # Si l’utilisateur a demandé les ports fermés, on les montre aussi / If user wants to see closed ports, show them
            print(f"🔴 Port {port} fermé")
            logging.info(f"Port {port} is closed on {ip}")

        sock.close()  # On ferme la prise / We close the plug


# Partie principale du programme / Main part of the program
if __name__ == "__main__":
    # On utilise le logging centralise / Use centralized logging configuration from scan_module
    setup_logging()
    logging.info("Port scanner started from command line")

    logging.info("Port scanner started")  # On écrit qu’on commence / We write that we start

    args = parse_args()  # On lit les options données par l'utilisateur / Read the user options

    ip = None

    # Si on a une IP directe / If we have a direct IP
    if args.ip:
        if validation.validate_ip_address(args.ip):
            ip = args.ip
            logging.info(f"Using provided IP: {ip}")
        else:
            print("❌ IP invalide / Invalid IP")
            logging.error("Invalid IP address provided")

    # Si on a une URL à convertir en IP / If we have a URL to convert to IP
    elif args.url:
        resolved, ip_address = validation.validate_url(args.url)
        if resolved:
            ip = ip_address
            logging.info(f"Resolved URL {args.url} to {ip}")
        else:
            print("❌ Impossible de résoudre l’URL / Could not resolve URL")
            logging.error(f"Failed to resolve URL: {args.url}")

    # Si on a bien une IP, on lance le scan / If we have a valid IP, start scanning
    if ip:
        scan_target(ip, args.ports, args.verbose)
        logging.info("✅ Scan terminé / Scan finished")
    else:
        print("❌ Aucun hôte valide à scanner / No valid host to scan")
        logging.warning("No valid target provided")
