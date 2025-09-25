#!/bin/bash

# Exit on error
set -e

# Font name
FONT_NAME="JetBrainsMono"

# Temp directory
TEMP_DIR="$HOME/.fonts-temp"

# Target font directory
FONT_DIR="$HOME/.local/share/fonts"

# Create temp directory
mkdir -p "$TEMP_DIR"

# Download the font zip
echo "Downloading $FONT_NAME Nerd Font..."
wget -O "$TEMP_DIR/$FONT_NAME.zip" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$FONT_NAME.zip"

# Unzip the font
echo "Extracting..."
unzip -q "$TEMP_DIR/$FONT_NAME.zip" -d "$TEMP_DIR/$FONT_NAME"

# Create font directory if it doesn't exist
mkdir -p "$FONT_DIR"

# Move all .ttf files to the fonts directory
echo "Installing font..."
find "$TEMP_DIR/$FONT_NAME" -type f -name "*.ttf" -exec mv {} "$FONT_DIR/" \;

# Refresh font cache
echo "Refreshing font cache..."
fc-cache -fv > /dev/null

# Clean up
rm -rf "$TEMP_DIR"

echo "✅ $FONT_NAME Nerd Font installed successfully!"

