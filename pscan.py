#!/bin/python3

import sys
import socket
from datetime import datetime

# Define our target
if len(sys.argv) == 2:
    target = socket.gethostbyname(sys.argv[1])  # Translate hostname to IPv4
else:
    print("Invalid amount of arguments.")
    print("Syntax: python3 scanner.py <target>")
    sys.exit(1)

# Add a pretty banner
print("-" * 50)
print("Scanning target " + target)
print("Time started: " + str(datetime.now()))
print("-" * 50)

# Define a dictionary to map common ports to service names
service_names = {
    1: "tcpmux",
    5: "rje",
    7: "echo",
    9: "discard",
    11: "systat",
    13: "daytime",
    17: "qotd",
    18: "msp",
    19: "chargen",
    20: "ftp-data",
    21: "ftp",
    22: "ssh",
    23: "telnet",
    25: "smtp",
    37: "time",
    42: "nameserver",
    43: "whois",
    49: "tacacs",
    53: "domain",
    67: "bootps",
    68: "bootpc",
    69: "tftp",
    70: "gopher",
    79: "finger",
    80: "http",
    81: "hosts2-ns",
    88: "kerberos",
    101: "hostname",
    102: "iso-tsap",
    107: "rtelnet",
    109: "pop2",
    110: "pop3",
    111: "rpcbind",
    113: "ident",
    119: "nntp",
    123: "ntp",
    135: "msrpc",
    137: "netbios-ns",
    138: "netbios-dgm",
    139: "netbios-ssn",
    143: "imap",
    161: "snmp",
    162: "snmptrap",
    179: "bgp",
    194: "irc",
    220: "imap3",
    389: "ldap",
    443: "https",
    445: "microsoft-ds",
    464: "kpasswd",
    514: "shell",
    515: "printer",
    548: "afp",
    587: "submission",
    631: "ipp",
    666: "doom",
    993: "imaps",
    995: "pop3s",
    2049: "nfs",
    3306: "mysql",
    5432: "postgresql",
    5900: "vnc",
    8080: "http-proxy"
}


try:
    for port in range(1, 65536):
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        socket.setdefaulttimeout(1)
        result = s.connect_ex((target, port))  # returns an error indicator - if port is open it throws a 0, otherwise 1
        if result == 0:
            service_name = service_names.get(port, "Unknown Service")
            print(f"Port {port} is open => Service : {service_name}")
        s.close()

except KeyboardInterrupt:
    print("\nExiting program...")
    sys.exit()

except socket.gaierror:
    print("Hostname could not be resolved.")
    sys.exit()

except socket.error:
    print("Could not connect to server.")
    sys.exit()


