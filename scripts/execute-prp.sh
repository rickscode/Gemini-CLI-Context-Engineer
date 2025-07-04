#!/bin/bash
# This script executes a Product Requirements Prompt (PRP) using Gemini CLI.

set -e

# Default PRP file
PRP_FILE=${1:-"PRPs/recipe-optimizer.md"}

# Check if PRP file exists
if [ ! -f "$PRP_FILE" ]; then
    echo "Error: PRP file '$PRP_FILE' not found."
    echo "Usage: $0 [prp_file.md]"
    echo "Available PRPs:"
    ls -1 PRPs/*.md 2>/dev/null || echo "  No PRP files found"
    exit 1
fi

# Check if Gemini CLI is available
if ! command -v gemini >/dev/null 2>&1; then
    echo "Error: Gemini CLI not found. Please install it first."
    echo "Install with: npm install -g @google/generative-ai"
    exit 1
fi

echo "🤖 Executing PRP with Gemini CLI: $PRP_FILE"

# Extract feature name
FEATURE_NAME=$(basename "$PRP_FILE" .md)
echo "📋 Feature: $FEATURE_NAME"

# Execute with Gemini CLI directly
echo "🔄 Running Gemini CLI with PRP..."
echo "📋 Passing PRP to Gemini for implementation..."

# Use Gemini CLI to process the PRP and implement the feature
# Add delay to avoid rate limiting
sleep 10
gemini -f "$PRP_FILE"

echo ""
echo "🎉 Gemini CLI execution completed!"
echo "📋 The AI should have implemented the feature based on the PRP."
echo "🔧 Review the generated files and test the implementation."
