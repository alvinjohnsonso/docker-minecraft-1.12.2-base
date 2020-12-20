#!/bin/sh

install_files() {
    java -jar installer.jar --installServer > /dev/null 2>&1
}

echo "Installing Forge and required jars."
install_files
echo "Done!"