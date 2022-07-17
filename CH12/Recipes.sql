-- Which recipes requires the most cloves of garlic?
SELECT Recipes.RecipeTitle, Recipes.RecipeID
FROM Recipe_Ingredients
INNER JOIN Recipes ON Recipes.RecipeID = Recipe_Ingredients.RecipeID
WHERE IngredientID = 9 AND Amount = (SELECT MAX(Amount) FROM Recipe_Ingredients WHERE IngredientID = 9)

-- Count the number of main course recipes.
SELECT COUNT(*) AS NumberMainCourseRecipes
FROM Recipes
WHERE RecipeClassID = 1

-- Calculate the total number of teaspoons of salt in all recipes.
SELECT SUM(Amount) AS TotalSaltTeaspoons
FROM Recipe_Ingredients
WHERE IngredientID = 11