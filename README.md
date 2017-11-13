# RetroPie Auto Testing
Bash script that auto-runs all games for a chosen libretro system, outputting results to screen. Useful for diagnosing regressions in performance or compatibility.

## Usage
```bash retropie-auto-testing -s PLATFORMNAME```
e.g.:
```bash retropie-auto-testing -s snes```

## To-do
* Allow user to pick the emulator for the testing, rather than default.
* Output to .csv
* Update compatibility lists with results
* Non-libretro tests.
* Use as a attract-mode screensaver
* Load save-state if present? Useful for games with specific issues.
