#!/bin/bash

# Define the relative source and destination paths
SOURCE_PATH="../project.pbxproj"
DESTINATION_PATH="../TouchChat.xcodeproj/project.pbxproj"

# Check if the destination file exists and delete it
if [ -f "$DESTINATION_PATH" ]; then
    rm "$DESTINATION_PATH"
    echo "Deleted existing file at $DESTINATION_PATH"
else
    echo "No existing file found at $DESTINATION_PATH"
fi

# Copy the file from the source to the destination
cp "$SOURCE_PATH" "$DESTINATION_PATH"

# Print a message indicating that the copy was successful
echo "File copied successfully from $SOURCE_PATH to $DESTINATION_PATH"
