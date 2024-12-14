# [+] =============================================== [+]
# [+]                                                 [+]
# [+] - INSTALLER PTERODACTYL                         [+]
# [+]                                                 [+]
# [+]  CREDITS :                                      [+]
# [+] • Seyori (seyori-eth-h4xer)                   [+]
# [+] • Creator of Telegram & WhatsApp Bot          [+]
# [+] • For Users of Tele & WhatsApp Bots           [+]
# [+]                                                 [+]
# [+] © Created by Seyori                            [+]
# [+] =============================================== [+]

#!/bin/bash

# Color
BLUE='\033[0;34m'       
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Display welcome message
display_welcome() {
  echo -e ""
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                                                 [+]${NC}"
  echo -e "${BLUE}[+]            PTERODACTYL AUTO INSTALLER           [+]${NC}"
  echo -e "${BLUE}[+]                  © BY SEYORI                   [+]${NC}"
  echo -e "${BLUE}[+]                                                 [+]${NC}"
  echo -e "${RED}[+] ===============================================  [+]${NC}"
  echo -e ""
  echo -e "This script was created to simplify the installation of Pterodactyl."
  echo -e "Strictly prohibited to sell or distribute for commercial use."
  echo -e ""
  echo -e "DON'T FORGET TO SUBSCRIBE @SEYORI-ETH-H4XER"
  echo -e ""
  echo -e "CREDITS TO :"
  echo -e "ALL CREATORS OF WHATSAPP BOTS"
  echo -e "SEYORI ( MYSELF )"
  sleep 4
  clear
}

# Update and install jq
install_jq() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]             UPDATE & INSTALL JQ                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sudo apt update && sudo apt install -y jq
  if [ $? -eq 0 ]; then
    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]              INSTALL JQ SUCCESSFUL            [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
  else
    echo -e "                                                       "
    echo -e "${RED}[+] =============================================== [+]${NC}"
    echo -e "${RED}[+]              INSTALL JQ FAILED               [+]${NC}"
    echo -e "${RED}[+] =============================================== [+]${NC}"
    exit 1
  fi
  echo -e "                                                       "
  sleep 1
  clear
}

# Check user token
check_token() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]               LICENSE VALIDATION               [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  echo -e "${YELLOW}ENTER ACCESS TOKEN:${NC}"
  read -r USER_TOKEN

  if [ "$USER_TOKEN" = "iniwannbroku" ]; then
    echo -e "${GREEN}ACCESS SUCCESSFUL${NC}"}
  else
    echo -e "${GREEN}Please contact Seyori if the token is incorrect.${NC}"
    exit 1
  fi
  clear
}

# Create a new node
create_node() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    CREATE NODE                  [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "

  # Request input from the user
  read -p "Enter location name: " location_name
  read -p "Enter location description: " location_description
  read -p "Enter domain: " domain
  read -p "Enter node name: " node_name
  read -p "Enter RAM (in MB): " ram
  read -p "Enter maximum disk space (in MB): " disk_space
  read -p "Enter Location ID: " locid

  # Change to Pterodactyl directory
  cd /var/www/pterodactyl || { echo "Directory not found"; exit 1; }

  # Create a new location
  php artisan p:location:make <<EOF
$location_name
$location_description
EOF

  # Create a new node
  php artisan p:node:make <<EOF
$node_name
$location_description
$locid
https
$domain
yes
no
no
$ram
$ram
$disk_space
$disk_space
100
8080
2022
/var/lib/pterodactyl/volumes
EOF

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]           CREATE NODE & LOCATION SUCCESSFUL     [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  exit 0
}

# Uninstall the panel
uninstall_panel() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    UNINSTALL PANEL               [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "

  bash <(curl -s https://pterodactyl-installer.se) <<EOF
y
y
y
y
EOF

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]               UNINSTALL PANEL SUCCESSFUL       [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  exit 0
}

# Configure Wings
configure_wings() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    CONFIGURE WINGS              [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "

  # Request input token from the user
  read -p "Enter token to configure and run wings: " wings

  eval "$wings"
  # Start wings service
  sudo systemctl start wings

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]              CONFIGURE WINGS SUCCESSFUL        [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  exit 0
}

# Main script
display_welcome
install_jq
check_token

while true; do
  clear
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                   SELECT OPTION                [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  echo -e "SELECT OPTION :"
  echo "3. Configure Wings"
  echo "4. Create Node"
  echo "5. Uninstall Panel"
  echo "x. Exit"
  echo -e "Enter your choice (3/4/5):"
  read -r MENU_CHOICE
  clear

  case "$MENU_CHOICE" in
      3)
      configure_wings
      ;;
      4)
      create_node
      ;;
      5)
      uninstall_panel
      ;;
    x)
      echo "Exiting the script."
      exit 0
      ;;
    *)
      echo "Invalid choice, please try again."
      ;;
  esac
done
