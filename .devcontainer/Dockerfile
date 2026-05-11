    # Use an official Ubuntu as a parent image
    FROM ubuntu:latest

    # Set environment variables to prevent interactive prompts during package installation
    ENV DEBIAN_FRONTEND=noninteractive

    # Update package lists and install necessary packages
    # curl: for downloading files
    # ca-certificates: for SSL certificate verification
    # gnupg: for handling GPG keys
    # wget: for downloading files
    RUN apt-get update && \
        apt-get install -y \
        curl \
        ca-certificates \
        gnupg \
        wget \
        --no-install-recommends && \
        rm -rf /var/lib/apt/lists/*

    # Install V2Ray core
    # Download the latest V2Ray core release script
    RUN curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install.sh | bash -s -- -version v5.0.0

    # Copy custom configuration if needed (assuming config.json will be mounted or copied later)
    # COPY config.json /etc/v2ray/config.json

    # Expose the default V2Ray client port (inbound)
    EXPOSE 8080

    # Command to run V2Ray
    # CMD ["/usr/local/bin/v2ray", "run", "-config", "/etc/v2ray/config.json"]
    # For development, we might want to run a different command or keep the container alive
    # CMD ["tail", "-f", "/dev/null"]
