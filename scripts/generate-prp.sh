#!/bin/bash
# This script generates a Product Requirements Prompt (PRP) for Gemini CLI context engineering.

set -e

# Default input file
INPUT_FILE=${1:-"INITIAL.md"}

# Check if input file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file '$INPUT_FILE' not found."
    echo "Usage: $0 [input_file.md]"
    exit 1
fi

# Check if Gemini CLI is available
if ! command -v gemini >/dev/null 2>&1; then
    echo "Error: Gemini CLI not found. Please install it first."
    exit 1
fi

# Extract feature name from input file
FEATURE_NAME=$(grep -m 1 "^#" "$INPUT_FILE" | sed 's/^# *//' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
if [ -z "$FEATURE_NAME" ]; then
    FEATURE_NAME=$(basename "$INPUT_FILE" .md)
fi

PRP_FILE="PRPs/${FEATURE_NAME}.md"

echo "🤖 Generating PRP for Gemini CLI: $FEATURE_NAME"
echo "📄 Input file: $INPUT_FILE"
echo "📝 Output file: $PRP_FILE"

# Create PRPs directory if it doesn't exist
mkdir -p PRPs

# Generate Gemini CLI compatible PRP
cat > "$PRP_FILE" << EOF
# Context Engineering Prompt for Gemini CLI

**Feature:** $FEATURE_NAME

## Instructions for Gemini CLI

Please implement the following feature according to the requirements below. Use the provided context and follow the implementation steps.

### Context from $INPUT_FILE:
EOF

# Add content from input file
cat "$INPUT_FILE" >> "$PRP_FILE"

cat >> "$PRP_FILE" << 'EOF'

### Implementation Guidelines:

1. **Read and understand** the feature requirements above
2. **Analyze the current codebase** structure
3. **Create a development plan** with specific tasks
4. **Implement the feature** following web development best practices
5. **Test the implementation** thoroughly
6. **Provide clear documentation** for usage

### Current Project Structure:
```
EOF

# Add current codebase tree
tree -I 'node_modules|.git|*.log' >> "$PRP_FILE"

cat >> "$PRP_FILE" << 'EOF'
```

### Expected Deliverables:
- [ ] Working web application with all core features
- [ ] Clean, maintainable code structure
- [ ] Basic styling and responsive design
- [ ] Error handling and user feedback
- [ ] Documentation for setup and usage

### Validation Steps:
1. Ensure all files are created and properly structured
2. Test core functionality (ingredient input, recipe search, display)
3. Verify responsive design works on different screen sizes
4. Check error handling for edge cases
5. Validate code follows best practices

### Technical Notes:
- Use vanilla JavaScript for simplicity
- Implement with static data initially (no API calls required)
- Focus on core functionality first, then enhance
- Ensure cross-browser compatibility
- Use modern ES6+ features where appropriate

---

**Note:** This PRP is designed for Gemini CLI context engineering. The AI should implement the complete feature based on these requirements.
EOF

echo "✅ Gemini CLI PRP generated successfully: $PRP_FILE"
echo ""
echo "🚀 Next steps:"
echo "1. Review the PRP: cat $PRP_FILE"
echo "2. Execute with Gemini CLI: gemini -f $PRP_FILE (waits 10s to avoid rate limits)"
echo "3. Or run: ./scripts/execute-prp.sh $PRP_FILE"
echo ""
echo "📋 The PRP contains all context needed for Gemini CLI to implement the feature."
