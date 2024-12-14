# [+] =============================================== [+]
# [+]                                                 [+]
# [+] - PTERODACTYL INSTALLER                         [+]
# [+]                                                 [+]
# [+]  CREDITS :                                      [+]
# [+] • Seyori (Myself, seyori-eth-h4xer)             [+]
# [+] • Creator of WhatsApp & Telegram Bots           [+]
# [+] • For Users of Tele & WhatsApp Bots             [+]
# [+]                                                 [+]
# [+] © Created by Seyori                             [+]
# [+] =============================================== [+]

#!/bin/bash

# Prompt user for input
read -p "Enter location name: " location_name
read -p "Enter location description: " location_description
read -p "Enter domain: " domain
read -p "Enter node name: " node_name
read -p "Enter RAM (in MB): " ram
read -p "Enter maximum disk space (in MB): " disk_space
read -p "Enter Location ID (Locid): " locid

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

echo "Location and node creation process has been completed."
