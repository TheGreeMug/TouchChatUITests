# TouchChatUITests
 E2E tests for TouchChat

## Steps for having the code in the source project
### Moving the tests under the main project
#### Copy all the files from this project to the root directory of the main project
##### Replace all files if necessary
#### Run "3_backup.sh"
This will create a backup of the current "project.pbxproj" file
### Adding the tests to the main project
#### Open the xCode project
#### Click on "TouchChat" in the file tree from the left side
#### Select "+" in order to add a new target
#### Search for "ui"
#### Select "UI Testing Bundle"
#### Click "Next"
#### Enter in Product Name "TouchChatUITests"
#### In Target to be Tested select "TouchChatHD_WordPower SIMULATOR"
#### Select Finished
The target should be added

### Adding the "TouchChatUITests" new tests
....
## Running a .sh script
To make the script executable and run it, follow these steps:

#### Open Terminal.
#### Navigate to the directory where you saved the script:
`cd ../PRC/Saltillo/git/e2e-tc/touch_chat/TouchChatUITests ` 

#### Make the script executable:
`chmod +x revert_and_backup.sh`

#### Run the script:
`./revert_and_backup.sh`