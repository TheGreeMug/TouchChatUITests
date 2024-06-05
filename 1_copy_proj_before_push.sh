#!/bin/bash

# Define the relative source and destination paths
SOURCE_PATH="../TouchChat.xcodeproj/project.pbxproj"
DESTINATION_PATH="./"

# Copy the file from source to destination
cp "$SOURCE_PATH" "$DESTINATION_PATH"

# Print a message indicating that the copy was successful
echo "File copied successfully from $SOURCE_PATH to $DESTINATION_PATH"
