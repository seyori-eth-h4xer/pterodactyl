# [+] =============================================== [+]
# [+]                                                 [+]
# [+]           PTERODACTYL INSTALLER                 [+]
# [+]                                                 [+]
# [+]  CREDITS:                                       [+]
# [+] • Seyori (Myself)                               [+]
# [+] • Creator of WhatsApp & Telegram Bots           [+]
# [+] • For Users of WhatsApp & Telegram Bots         [+]
# [+]                                                 [+]
# [+] © Created by Seyori                             [+]
# [+] =============================================== [+]

#!/bin/bash

# Request a token from the user
read -p "Enter token to run wings: " token

# Execute the command using the provided token
echo "Executing command with token: $token"
eval $token

# Start the wings service
sudo systemctl start wings

echo "The wings service has been successfully started."
