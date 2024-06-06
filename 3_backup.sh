#!/bin/bash

# Step 1: Go up one folder
cd ..

# Define paths and timestamp
SOURCE_PATH="TouchChat.xcodeproj/project.pbxproj"
BACKUP_DIR="TouchChatUITests/backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Step 2: Create a copy of the file in TouchChatUITests/backups and overwrite existing files if any
cp "$SOURCE_PATH" "$BACKUP_DIR/project.pbxproj"
echo "Current project.pbxproj copied to $BACKUP_DIR/project.pbxproj"

# Step 3: Create a backup of the file with YES changes in TouchChatUITests/backups directory
BACKUP_YES_PATH="$BACKUP_DIR/project_backupYESChanges_$TIMESTAMP.pbxproj"
cp "$SOURCE_PATH" "$BACKUP_YES_PATH"
echo "Backup with YES changes created at $BACKUP_YES_PATH"

# Step 4: Revert the GIT changes to TouchChat.xcodeproj/project.pbxproj
git checkout -- "$SOURCE_PATH"
echo "Reverted Git changes to TouchChat.xcodeproj/project.pbxproj"

# Step 5: Create a backup of the file with NO changes in TouchChatUITests/backups directory
BACKUP_NO_PATH="$BACKUP_DIR/project_backupNOChanges_$TIMESTAMP.pbxproj"
cp "$SOURCE_PATH" "$BACKUP_NO_PATH"
echo "Backup with NO changes created at $BACKUP_NO_PATH"
