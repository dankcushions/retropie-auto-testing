#!/bin/bash

# Get options
while getopts s: option
do
    case "${option}"
    in
    s) SYSTEM=${OPTARG};;
    esac
done

# SYSTEM must be supplied
echo $SYSTEM

# Make sure Emulationstation is exited

# Initialise variables
ROOT_PATH="/home/pi/RetroPie/roms"
SYSTEM_PATH="$ROOT_PATH/$SYSTEM"
CONFIG_PATH="/opt/retropie/configs"
RUNCOMMAND="/home/pi/RetroPie-Setup/scriptmodules/supplementary/runcommand/runcommand.sh"
RETROARCH="/opt/retropie/emulators/retroarch/bin/retroarch"
RETROARCH_CFG="$CONFIG_PATH/all/retroarch.cfg"
SYSTEM_CFG="$CONFIG_PATH/$SYSTEM/retroarch.cfg"
# Location of Core binary. Hardcoded as SNES for now. Eventually get in same way as runcommand. ALSO MAKE SURE IT'S LIBRETRO!
CORE="/opt/retropie/libretrocores/lr-snes9x2010/snes9x2010_libretro.so"
# Frames to let game run
FRAMES=600

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
cd $SYSTEM_PATH
for EXT in "${SYSTEM_EXTS[@]}"; do
    EXT_GAMES=(*.$EXT)
    SYSTEM_GAMES=("${SYSTEM_GAMES[@]}" "${EXT_GAMES[@]}")
done

# Loop through array, launching each game
for GAME in "${SYSTEM_GAMES[@]}"; do
    GAME_PATH="$SYSTEM_PATH/$GAME"
    echo $GAME_PATH
    # Launch game with frame limit
    $RETROARCH -L $CORE --verbose --max-frames=$FRAMES --config $SYSTEM_CFG "$GAME_PATH"
    # Launch game with timeout
    #echo timeout $LOOP_LENGTH $RUNCOMMAND 0 _SYS_ $SYSTEM $GAME_PATH
    #timeout $LOOP_LENGTH $RETROARCH -L $CORE --verbose --config $SYSTEM_CFG "$GAME_PATH"
    #timeout $LOOP_LENGTH $RUNCOMMAND 0 _SYS_ $SYSTEM "$GAME_PATH"
done

## Terminate after 60 seconds

## Is Crash?

## What's the framerate?

## Post to screen
