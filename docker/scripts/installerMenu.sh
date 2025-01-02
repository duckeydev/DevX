#!/bin/bash

echo "Select applications to install:"

OPTIONS=("NodeJS" "Bun" "GCC" "Clang" "Java" "Go" "Quit")
select opt in "${OPTIONS[@]}"
do
    case $opt in
        "NodeJS")
            echo "Installing NodeJS..."
            echo "Installing via NVM..."
            sleep 2
            curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
            export NVM_DIR="$HOME/.nvm"
            [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
            [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
            nvm install node
            nvm use node
            ;;
        "Bun")
            echo "Installing Bun..."
            curl -fsSL https://bun.sh/install | bash
            ;;
        "GCC")
            echo "Installing GCC..."
            apt update && apt install -y gcc
            ;;
        "Clang")
            echo "Installing Clang..."
            apt update && apt install -y clang
            ;;
        "Java")
            echo "Installing Java..."
            apt update && apt install -y openjdk-17-jdk
            ;;
        "Go")
            echo "Installing Go..."
            curl -OL https://golang.org/dl/go1.22.0.linux-amd64.tar.gz
            tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz
            echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile
            rm go1.22.0.linux-amd64.tar.gz
            ;;
        "Quit")
            break
            ;;
        *)
            echo "Invalid option $REPLY"
            ;;
    esac
done
