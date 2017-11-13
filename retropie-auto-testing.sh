#!/bin/bash

# Get options
while getopts s: option
do
    case "${option}"
    in
    s) SYSTEM=${OPTARG};;
    esac
done

# Make SYSTEM lowercase
SYSTEM=${BASH_REMATCH[1],,}

# Initialise variables
ROOT_PATH="/home/pi/RetroPie/roms"
SYSTEM_PATH="$ROOT_PATH/$SYSTEM"

# Get permitted file extensions
# For now, hardcoded for SNES
SYSTEM_EXTS[0]="7z"
SYSTEM_EXTS[0]="bin"
SYSTEM_EXTS[0]="fig"
SYSTEM_EXTS[0]="mgd"
SYSTEM_EXTS[0]="sfc"
SYSTEM_EXTS[0]="smc"
SYSTEM_EXTS[0]="swc"
SYSTEM_EXTS[0]="zip"

# Add all games with valid extensions in directory to an array
local ext
local games
for ext in "${SYSTEM_EXTS[@]}"; do
	cd $SYSTEM_PATH
	games=(*.$ext)
    SYSTEM_GAMES=("${SYSTEM_GAMES[@]}" "${games[@]}")
done
SYSTEM_PATH="$ROOT_PATH/$SYSTEM"

# print test
echo ${SYSTEM_GAMES[@]}
echo ${#SYSTEM_GAMES[@]}

# Loop through array, launching each game in verbose mode

## Terminate after 60 seconds

## Is Crash?

## What's the framerate?

## Post to screen