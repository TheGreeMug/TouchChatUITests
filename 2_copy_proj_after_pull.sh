#!/bin/bash

# Define colors
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Define the source and destination paths
SOURCE_PATH="backups/project.pbxproj"
DESTINATION_PATH="../TouchChat.xcodeproj/project.pbxproj"

# Check if the source file exists
if [ ! -f "$SOURCE_PATH" ]; then
    echo -e "${RED}Source file $SOURCE_PATH does not exist. Halting operation.${NC}"
    exit 1
fi

# Check if the destination file exists and delete it if it does
if [ -f "$DESTINATION_PATH" ]; then
    rm "$DESTINATION_PATH"
    echo -e "${YELLOW}Existing destination file $DESTINATION_PATH deleted.${NC}"
fi

# Copy the file from source to destination
cp "$SOURCE_PATH" "$DESTINATION_PATH"

# Print a message indicating that the copy was successful
echo -e "${GREEN}File copied successfully from $SOURCE_PATH to $DESTINATION_PATH${NC}"
