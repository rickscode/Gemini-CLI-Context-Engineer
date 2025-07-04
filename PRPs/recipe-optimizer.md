name: "Recipe Optimizer Web Application"
description: |

  ## Purpose
  Build a Recipe Optimizer web application that allows users to input available ingredients and receive personalized recipe suggestions with comprehensive nutritional analysis and cooking guidance.

  ## Core Principles
  1. **Context is King**: Include ALL necessary documentation, examples, and caveats
  2. **Validation Loops**: Provide executable tests/lints the AI can run and fix
  3. **Information Dense**: Use keywords and patterns from the codebase
  4. **Progressive Success**: Start simple, validate, then enhance
  5. **Global rules**: Be sure to follow all rules in GEMINI.md

  ---

  ## Goal
  Create a web application that provides users with personalized recipe suggestions based on the ingredients they have on hand. The application should also provide detailed nutritional analysis, cooking guidance, and other helpful features.

  ## Why
  - **Business value**: Help users reduce food waste and discover new recipes.
  - **Integration**: This will be a new, standalone application.
  - **Problems this solves**: Helps users who have a collection of ingredients but don't know what to make.

  ## What
  A web application with the following features:
  - Ingredient input with autocomplete
  - Recipe matching engine
  - Recipe display with nutritional information
  - Smart cooking tips
  - Shopping list generator
  - Recipe scaling
  - Saved/favorite recipes

  ### Success Criteria
  - [ ] Users can input ingredients and receive recipe suggestions.
  - [ ] Nutritional information is displayed for each recipe.
  - [ ] Users can generate a shopping list for missing ingredients.
  - [ ] Users can save their favorite recipes.

  ## All Needed Context

  ### Documentation & References
  ```yaml
  # MUST READ - Include these in your context window
  - url: https://spoonacular.com/food-api
    why: Primary API for recipe search, ingredient information, and nutritional analysis.

  - url: https://fdc.nal.usda.gov/api-guide.html
    why: API for detailed nutritional information for ingredients.

  - url: http://www.recipepuppy.com/about/api/
    why: Backup API for recipe search.

  - url: https://developer.edamam.com/edamam-recipe-api
    why: High-quality recipe data with dietary filters.
  ```

  ### Current Codebase tree
  ```bash
  .
  ├── examples
  ├── PRPs
  │   ├── templates
  │   └── recipe-optimizer.md
  ├── scripts
  ├── .gitattributes
  ├── .gitignore
  ├── GEMINI.md
  ├── INITIAL_EXAMPLE.md
  ├── INITIAL.md
  ├── LICENSE
  └── README.md
  ```

  ### Desired Codebase tree with files to be added and responsibility of file
  ```bash
  .
  ├── public
  │   ├── index.html
  │   └── styles.css
  ├── src
  │   ├── app.js
  │   ├── components
  │   │   ├── IngredientInput.js
  │   │   ├── RecipeList.js
  │   │   └── RecipeDetails.js
  │   └── services
  │       ├── spoonacular.js
  │       └── usda.js
  ├── tests
  │   ├── components
  │   │   ├── IngredientInput.test.js
  │   │   ├── RecipeList.test.js
  │   │   └── RecipeDetails.test.js
  │   └── services
  │       ├── spoonacular.test.js
  │       └── usda.test.js
  ├── .env.example
  └── package.json
  ```

  ### Known Gotchas of our codebase & Library Quirks
  ```python
  # CRITICAL: Spoonacular API has a free tier with limitations on requests per day.
  # CRITICAL: USDA FoodData Central API also has rate limits.
  # CRITICAL: Implement debouncing for ingredient search to avoid hitting API rate limits.
  # CRITICAL: Cache API responses to improve performance and reduce API calls.
  ```

  ## Implementation Blueprint

  ### Data models and structure
  ```javascript
  // Example Recipe Object
  const recipe = {
    id: 716429,
    title: "Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs",
    image: "https://spoonacular.com/recipeImages/716429-556x370.jpg",
    usedIngredientCount: 3,
    missedIngredientCount: 2,
    missedIngredients: [
      {
        id: 1001,
        amount: 1,
        unit: "serving",
        name: "butter"
      },
      {
        id: 2044,
        amount: 1,
        unit: "serving",
        name: "basil"
      }
    ],
    usedIngredients: [
      {
        id: 11215,
        amount: 1,
        unit: "serving",
        name: "garlic"
      },
      {
        id: 1011111,
        amount: 1,
        unit: "serving",
        name: "scallions"
      },
      {
        id: 11135,
        amount: 1,
        unit: "serving",
        name: "cauliflower"
      }
    ],
    likes: 1
  };
  ```

  ### list of tasks to be completed to fullfill the PRP in the order they should be completed

  ```yaml
  Task 1: Setup project structure
    - Create the directory structure as defined in the "Desired Codebase tree" section.
    - Initialize a new npm project.

  Task 2: Build the frontend
    - Create the HTML structure in `public/index.html`.
    - Style the application in `public/styles.css`.
    - Implement the core application logic in `src/app.js`.
    - Create the React components for the UI.

  Task 3: Implement API services
    - Create a service for interacting with the Spoonacular API in `src/services/spoonacular.js`.
    - Create a service for interacting with the USDA FoodData Central API in `src/services/usda.js`.

  Task 4: Write tests
    - Write unit tests for the React components.
    - Write unit tests for the API services.
  ```

  ### Per task pseudocode as needed added to each task
  ```javascript
  // Task 2: src/app.js
  // - Fetch recipes from Spoonacular API based on user input.
  // - Render the list of recipes.
  // - Handle recipe selection and display details.

  // Task 3: src/services/spoonacular.js
  // - Implement a function to search for recipes by ingredients.
  // - Implement a function to get recipe information by ID.
  ```

  ### Integration Points
  ```yaml
  CONFIG:
    - Create a `.env` file for API keys.
  ```

  ## Validation Loop

  ### Level 1: Syntax & Style
  ```bash
  # Run these FIRST - fix any errors before proceeding
  npx eslint src/
  ```

  ### Level 2: Unit Tests
  ```bash
  # Run and iterate until passing:
  npm test
  ```

  ### Level 3: Integration Test
  ```bash
  # Start the service
  npm start

  # Open the application in a browser and test the following:
  # - Ingredient input
  # - Recipe search
  # - Recipe selection
  # - Shopping list generation
  ```

  ## Final validation Checklist
  - [ ] All tests pass: `npm test`
  - [ ] No linting errors: `npx eslint src/`
  - [ ] Manual test successful
  - [ ] Error cases handled gracefully
  - [ ] Logs are informative but not verbose
  - [ ] Documentation updated if needed

  ---

  ## Anti-Patterns to Avoid
  - ❌ Don't hardcode API keys.
  - ❌ Don't make API calls on every keystroke.
  - ❌ Don't fetch all recipe data at once.
