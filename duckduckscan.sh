#!/bin/bash

python3 printd.py
RED="\033[91m"
GREEN="\033[92m"
BLUE="\033[94m"
YELLOW="\033[93m"
ORANGE="\033[38;5;208m"
CYAN="\033[95m"
RESET="\033[0m"

printf "${RED}All Functions Available:-\n${RESET}"
echo ""
printf "${ORANGE}1. Host Discovery\n${RESET}${CYAN}2. Port Scanning\n${RESET}"
echo ""
echo "Enter your Choice:"
read op

if [ "$op" == "1" ]; then
    echo -e "${RED}Enter the IP Address of the target / Network Address(e.g. 1.1.1.0):-${RESET}"
    read ip
    echo ""
    echo -e "${RED}All Host Discovery Options:-${RESET}"
    echo ""
    printf "${RED}1. Ping Scan\n2. TCP SYN Scan\n3. TCP ACK Scan\n4. UDP Scan\n5. ICMP Echo Scan\n6. IP Protocol Scan\n${RESET}"
    echo -e "${RED}Enter Your Choice(1-6):${RESET}"
    echo ""
    read num
    echo ""
    echo -e "${GREEN}[*] Discovering Hosts using Nmap...${RESET}"
    echo ""

    case $num in
        1)
            echo -e "${GREEN}[*] Performing Ping Scan...${RESET}"
            echo ""
            echo -e "${GREEN}[*] Hosts Discovered${RESET}"
            echo "--------------------------------------------------"
            echo ""
            nmap -sP -sn "$ip/24" | grep "Nmap scan" | cut -d " " -f 5 > scan.txt
            cat scan.txt | sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n
            ;;
       2)
    		echo -e "${GREEN}[*] Performing TCP SYN Scan...${RESET}"
    		echo ""
    		echo -e "${GREEN}[*] Hosts Discovered${RESET}"
    		echo "--------------------------------------------------"
    		echo ""
    		nmap -PS -sn "$ip/24" | grep "Nmap scan" | cut -d " " -f 5 > scan.txt
    		cat scan.txt | sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n
    		;;
    	3)
    		echo -e "${GREEN}[*] Performing TCP ACK Scan...${RESET}"
    		echo ""
    		echo -e "${GREEN}[*] Hosts Discovered${RESET}"
    		echo "--------------------------------------------------"
    		echo ""
    		nmap -PA -sn "$ip/24" | grep "Nmap scan" | cut -d " " -f 5 > scan.txt
    		cat scan.txt | sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n
    		;;
    	4)
    		echo -e "${GREEN}[*] Performing UDP Scan...${RESET}"
    		echo ""
    		echo -e "${GREEN}[*] Hosts Discovered${RESET}"
    		echo "--------------------------------------------------"
    		echo ""
    		nmap -PU -sn "$ip/24" | grep "Nmap scan" | cut -d " " -f 5 > scan.txt
    		cat scan.txt | sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n
    		;;
    	5)
    		echo -e "${GREEN}[*] Performing ICMP Echo Scan...${RESET}"
    		echo ""
    		echo -e "${GREEN}[*] Hosts Discovered${RESET}"
    		echo "--------------------------------------------------"
    		echo ""
    		nmap -sP -sn "$ip/24" | grep "Nmap scan" | cut -d " " -f 5 > scan.txt
    		cat scan.txt | sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n
    		;;
    	6)
    		echo -e "${GREEN}[*] Performing IP Protocol Scan...${RESET}"
    		echo ""
    		echo -e "${GREEN}[*] Hosts Discovered${RESET}"
    		echo "--------------------------------------------------"
    		echo ""
    		nmap -PO -sn "$ip/24" | grep "Nmap scan" | cut -d " " -f 5 > scan.txt
    		cat scan.txt | sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n
    		;;
    esac
    echo ""
    echo "--------------------------------------------------"
    echo -e "${GREEN}[*] Hosts Discovery Completed...${RESET}"
    echo ""
    echo -e "${RED}Do you want to go for port scanning? (Y or N)${RESET}"
    read get

    if [ "$get" == "Y" ]; then
        echo -e "${RED}Enter the IP Address of the target:${RESET}"
        read ip
        python3 pscan.py "$ip"
        echo "--------------------------------------------------"
        echo -e "${GREEN}[*] Port Scanning Completed${RESET}"
        echo ""
        echo ""
        echo -e "${BLUE}Thank You for using my tool..."
        echo -e "Check out more tools at :- https://github.com/WhitewolfX01/ ${RESET}"
    else
        echo ""
        echo ""
        echo -e "${BLUE}Thank You for using my tool..."
        echo -e "Check out more tools at :- https://github.com/WhitewolfX01/ ${RESET}"
    fi
    echo ""
    echo "--------------------------------------------------"
    rm scan.txt
    
elif [ "$op" == "2" ]; then
    echo "Enter the IP Address of the target:"
    read ip
    python3 pscan.py "$ip"
    echo "--------------------------------------------------"
    echo -e "${GREEN}[*] Port Scanning Completed${RESET}"
    echo ""
    echo ""
    echo -e "${BLUE}Thank You for using my tool..."
    echo -e "Check out more tools at :- https://github.com/WhitewolfX01/ ${RESET}"
    
else
    echo "Invalid option selected."
fi



