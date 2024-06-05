#!/bin/bash

# Step 1: Go up one folder
cd ..

# Step 2: Revert the GIT changes to TouchChat.xcodeproj/project.pbxproj
git checkout -- TouchChat.xcodeproj/project.pbxproj
echo "Reverted Git changes to TouchChat.xcodeproj/project.pbxproj"

# Step 3: Create a backup of the file in TouchChatUITests directory
SOURCE_PATH="TouchChat.xcodeproj/project.pbxproj"
BACKUP_PATH="TouchChatUITests/project_backup.pbxproj"
cp "$SOURCE_PATH" "$BACKUP_PATH"
echo "Backup created at $BACKUP_PATH"
