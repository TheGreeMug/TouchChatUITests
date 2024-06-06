#!/bin/bash

# Define colors
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Step 1: Go up one folder
cd ..

# Define paths and timestamp
SOURCE_PATH="TouchChat.xcodeproj/project.pbxproj"
BACKUP_DIR="TouchChatUITests/backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Step 2: Create a copy of the file in TouchChatUITests/backups and overwrite existing files if any
if cp "$SOURCE_PATH" "$BACKUP_DIR/project.pbxproj"; then
    echo -e "${GREEN}Current project.pbxproj copied to $BACKUP_DIR/project.pbxproj${NC}"
else
    echo -e "${RED}Failed to copy project.pbxproj to $BACKUP_DIR${NC}"
    exit 1
fi

# Step 3: Create a backup of the file with YES changes in TouchChatUITests/backups directory
BACKUP_YES_PATH="$BACKUP_DIR/project_backupYESChanges_$TIMESTAMP.pbxproj"
if cp "$SOURCE_PATH" "$BACKUP_YES_PATH"; then
    echo -e "${GREEN}Backup with YES changes created at $BACKUP_YES_PATH${NC}"
else
    echo -e "${RED}Failed to create backup with YES changes${NC}"
    exit 1
fi

# Step 4: Revert the GIT changes to TouchChat.xcodeproj/project.pbxproj
if git checkout -- "$SOURCE_PATH"; then
    echo -e "${GREEN}Reverted Git changes to TouchChat.xcodeproj/project.pbxproj${NC}"
else
    echo -e "${RED}Failed to revert Git changes to TouchChat.xcodeproj/project.pbxproj${NC}"
    exit 1
fi

# Step 5: Create a backup of the file with NO changes in TouchChatUITests/backups directory
BACKUP_NO_PATH="$BACKUP_DIR/project_backupNOChanges_$TIMESTAMP.pbxproj"
if cp "$SOURCE_PATH" "$BACKUP_NO_PATH"; then
    echo -e "${GREEN}Backup with NO changes created at $BACKUP_NO_PATH${NC}"
else
    echo -e "${RED}Failed to create backup with NO changes${NC}"
    exit 1
fi
