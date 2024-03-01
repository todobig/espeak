#!/bin/bash

# Define the log file path
LOG_FILE="espeak_install.log"

# Function to log commands and their outputs
log_command() {
    echo "$ $1" >> "$LOG_FILE"
    eval "$1" >> "$LOG_FILE" 2>&1
    echo "" >> "$LOG_FILE"
}

# Update package manager repositories
log_command "sudo zypper update"

# Install necessary packages
log_command "sudo zypper install make"
log_command "sudo zypper install gcc"
log_command "sudo zypper install espeak-ng-devel"

# Clone the Asterisk-eSpeak repository
log_command "git clone https://github.com/zaf/Asterisk-eSpeak.git"
log_command "cd Asterisk-eSpeak/"

# Compile and install Asterisk-eSpeak
log_command "make"
log_command "sudo make install"
log_command "sudo make samples"

# Locate espeak.conf
log_command "locate espeak.conf"
log_command "updatedb"
log_command "locate espeak.conf"

# Edit espeak.conf
log_command "sudo vi /etc/asterisk/espeak.conf"

echo "Installation complete. Log file: $LOG_FILE"
