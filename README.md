# Gemini CLI Context Engineer

A comprehensive template for getting started with Context Engineering - the discipline of engineering context for AI coding assistants so they have the information necessary to get the job done end to end.

> **Context Engineering is 10x better than prompt engineering and 100x better than vibe coding.**

## 🚀 Quick Start

```bash
# 1. Clone this template
git clone https://github.com/your-username/Gemini-CLI-Context-Engineer.git
cd Gemini-CLI-Context-Engineer

# 2. Install Gemini CLI (if not already installed)
npm install -g @google/generative-ai

# 3. Create your initial feature request
# Edit INITIAL.md with your feature requirements

# 4. Generate a comprehensive PRP (Product Requirements Prompt)
./scripts/generate-prp.sh INITIAL.md

# 5. Execute the PRP with Gemini CLI to implement your feature
./scripts/execute-prp.sh PRPs/your-feature-name.md
```

## 📚 Table of Contents

- [What is Context Engineering?](#what-is-context-engineering)
- [Template Structure](#template-structure)
- [Step-by-Step Guide](#step-by-step-guide)
- [Writing Effective INITIAL.md Files](#writing-effective-initialmd-files)
- [The PRP Workflow](#the-prp-workflow)
- [Using Examples Effectively](#using-examples-effectively)
- [Best Practices](#best-practices)

## What is Context Engineering?

Context Engineering represents a paradigm shift from traditional prompt engineering:

### Prompt Engineering vs Context Engineering

**Prompt Engineering:**
- Focuses on clever wording and specific phrasing
- Limited to how you phrase a task
- Like giving someone a sticky note

**Context Engineering:**
- A complete system for providing comprehensive context
- Includes documentation, examples, rules, patterns, and validation
- Like writing a full screenplay with all the details

### Why Context Engineering Matters

1. **Reduces AI Failures**: Most agent failures aren't model failures - they're context failures
2. **Ensures Consistency**: AI follows your project patterns and conventions
3. **Enables Complex Features**: AI can handle multi-step implementations with proper context
4. **Self-Correcting**: Validation loops allow AI to fix its own mistakes

## Template Structure

```
gemini-cli-context-engineer/
├── scripts/
│   ├── generate-prp.sh    # Generates comprehensive PRPs
│   └── execute-prp.sh     # Executes PRPs to implement features
├── PRPs/
│   ├── templates/
│   │   └── prp_base.md       # Base template for PRPs
│   └── EXAMPLE_multi_agent_prp.md  # Example of a complete PRP
├── examples/                  # Your code examples (critical!)
├── GEMINI.md                 # Global rules for AI assistant
├── INITIAL.md               # Template for feature requests
├── INITIAL_EXAMPLE.md       # Example feature request
└── README.md                # This file
```

This template doesn't focus on RAG and tools with context engineering because I have a LOT more in store for that soon. ;)

## Step-by-Step Guide

### 1. Set Up Global Rules (GEMINI.md)

The `GEMINI.md` file contains project-wide rules that the AI assistant will follow in every conversation. The template includes:

- **Project awareness**: Reading planning docs, checking tasks
- **Code structure**: File size limits, module organization
- **Testing requirements**: Unit test patterns, coverage expectations
- **Style conventions**: Language preferences, formatting rules
- **Documentation standards**: Docstring formats, commenting practices

**You can use the provided template as-is or customize it for your project.**

### 2. Create Your Initial Feature Request

Edit `INITIAL.md` to describe what you want to build:

```markdown
## FEATURE:
[Describe what you want to build - be specific about functionality and requirements]

## EXAMPLES:
[List any example files in the examples/ folder and explain how they should be used]

## DOCUMENTATION:
[Include links to relevant documentation, APIs, or MCP server resources]

## OTHER CONSIDERATIONS:
[Mention any gotchas, specific requirements, or things AI assistants commonly miss]
```

**See `INITIAL_EXAMPLE.md` for a complete example.**

### 3. Generate the PRP

PRPs (Product Requirements Prompts) are comprehensive implementation blueprints that include:

- Complete context and documentation
- Implementation steps with validation
- Error handling patterns
- Test requirements

They are similar to PRDs (Product Requirements Documents) but are crafted more specifically to instruct an AI coding assistant.

Run the generation script:
```bash
./scripts/generate-prp.sh INITIAL.md
```

This command will:
1. Read your feature request from INITIAL.md
2. Extract the current codebase structure
3. Create a comprehensive PRP in `PRPs/your-feature-name.md`
4. Include validation commands and implementation guidelines

### 4. Execute the PRP

Once generated, execute the PRP with Gemini CLI to implement your feature:

```bash
./scripts/execute-prp.sh PRPs/your-feature-name.md
```

The script will:
1. Pass the PRP to Gemini CLI
2. Let Gemini CLI read all context from the PRP
3. Gemini CLI will implement the feature based on the requirements
4. Review the generated files and test the implementation

## 🤖 How It Works

### Generate Script (`generate-prp.sh`)
- Reads your INITIAL.md requirements
- Extracts feature name automatically
- Creates current codebase tree
- Generates Gemini CLI-specific context prompt
- Outputs structured PRP file

### Execute Script (`execute-prp.sh`)
- Validates PRP file exists
- Checks Gemini CLI availability
- Passes PRP file to Gemini CLI
- Lets Gemini CLI handle the implementation

## Writing Effective INITIAL.md Files

### Key Sections Explained

**FEATURE**: Be specific and comprehensive
- ❌ "Build a web scraper"
- ✅ "Build an async web scraper using BeautifulSoup that extracts product data from e-commerce sites, handles rate limiting, and stores results in PostgreSQL"

**EXAMPLES**: Leverage the examples/ folder
- Place relevant code patterns in `examples/`
- Reference specific files and patterns to follow
- Explain what aspects should be mimicked

**DOCUMENTATION**: Include all relevant resources
- API documentation URLs
- Library guides
- MCP server documentation
- Database schemas

**OTHER CONSIDERATIONS**: Capture important details
- Authentication requirements
- Rate limits or quotas
- Common pitfalls
- Performance requirements

## The PRP Workflow

### How the Scripts Work

**generate-prp.sh** follows this process:

1. **Input Validation**
   - Checks if INITIAL.md exists
   - Verifies Gemini CLI is available

2. **Feature Extraction**
   - Extracts feature name from input file
   - Creates organized PRP structure

3. **Context Building**
   - Adds current codebase tree
   - Includes implementation guidelines
   - Adds validation steps

4. **PRP Generation**
   - Creates Gemini CLI-specific prompt
   - Outputs structured markdown file

**execute-prp.sh** follows this process:

1. **Validation**: Checks PRP file exists and Gemini CLI is available
2. **Execution**: Passes PRP to Gemini CLI with `gemini -f` command
3. **Completion**: Gemini CLI implements the feature based on the PRP context

See `PRPs/recipe-optimizer.md` for a complete example of what gets generated.

## Using Examples Effectively

The `examples/` folder is **critical** for success. AI coding assistants perform much better when they can see patterns to follow.

### What to Include in Examples

1. **Code Structure Patterns**
   - How you organize modules
   - Import conventions
   - Class/function patterns

2. **Testing Patterns**
   - Test file structure
   - Mocking approaches
   - Assertion styles

3. **Integration Patterns**
   - API client implementations
   - Database connections
   - Authentication flows

4. **CLI Patterns**
   - Argument parsing
   - Output formatting
   - Error handling

### Example Structure

```
examples/
├── README.md           # Explains what each example demonstrates
├── cli.py             # CLI implementation pattern
├── agent/             # Agent architecture patterns
│   ├── agent.py      # Agent creation pattern
│   ├── tools.py      # Tool implementation pattern
│   └── providers.py  # Multi-provider pattern
└── tests/            # Testing patterns
    ├── test_agent.py # Unit test patterns
    └── conftest.py   # Pytest configuration
```

## Best Practices

### 1. Be Explicit in INITIAL.md
- Don't assume the AI knows your preferences
- Include specific requirements and constraints
- Reference examples liberally

### 2. Provide Comprehensive Examples
- More examples = better implementations
- Show both what to do AND what not to do
- Include error handling patterns

### 3. Use Validation Gates
- PRPs include test commands that must pass
- AI will iterate until all validations succeed
- This ensures working code on first try

### 4. Leverage Documentation
- Include official API docs
- Add MCP server resources
- Reference specific documentation sections

### 5. Customize GEMINI.md
- Add your conventions
- Include project-specific rules
- Define coding standards

## Resources

- [Gemini Code Documentation](https://www.google.com/docs/about/)
- [Context Engineering Best Practices](https://www.philschmid.de/context-engineering)