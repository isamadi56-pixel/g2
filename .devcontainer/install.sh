    #!/bin/bash
    set -e # Exit immediately if a command exits with a non-zero status.

    echo "Starting G2Ray setup..."

    # --- Install V2Ray Core ---
    echo "Installing V2Ray core..."
    # Use the official installation script for V2Ray
    curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install.sh | bash -s -- -version v5.0.0

    # --- Copy Configuration File ---
    # Ensure the V2Ray configuration directory exists
    mkdir -p /etc/v2ray
    # Copy the config.json from the workspace to the V2Ray configuration directory
    # Make sure config.json is present in the workspace root or adjust the path
    if [ -f "/workspaces/g2ray-master/config.json" ]; then
        cp /workspaces/g2ray-master/config.json /etc/v2ray/config.json
        echo "Configuration file copied to /etc/v2ray/config.json"
    else
        echo "Warning: config.json not found at /workspaces/g2ray-master/config.json. Please ensure it's included."
        # As a fallback, create a minimal default config if config.json is missing
        echo '{
          "log": { "loglevel": "warning" },
          "inbounds": [ { "port": 8080, "listenIP": "0.0.0.0", "protocol": "socks", "settings": { "auth": "noauth", "udp": true } } ],
          "outbounds": [ { "protocol": "freedom", "settings": {} } ]
        }' > /etc/v2ray/config.json
        echo "Created a minimal default config.json at /etc/v2ray/config.json"
    fi

    # --- Set Permissions (Optional but Recommended) ---
    # Ensure the config file is readable by the V2Ray process
    chmod 644 /etc/v2ray/config.json
    # You might need to adjust permissions for the V2Ray binary itself if issues arise

    echo "G2Ray setup complete."
