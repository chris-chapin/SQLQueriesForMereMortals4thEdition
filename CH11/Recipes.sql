-- "Show me the types of recipes and the count of recipes in each type."

SELECT Recipe_Classes.RecipeClassDescription,
(SELECT COUNT(*) FROM Recipes WHERE Recipes.RecipeClassID = Recipe_Classes.RecipeClassID) AS RecipeCount
FROM Recipe_Classes

-- "List the ingredients that are used in some recipe where the measurement amount in the recipe is not the default measurement amount."

SELECT Ingredients.IngredientName
FROM Ingredients
WHERE Ingredients.IngredientID = SOME (
	SELECT Recipe_Ingredients.IngredientID
	FROM Recipe_Ingredients
	WHERE (Ingredients.IngredientID = Recipe_Ingredients.IngredientID AND Ingredients.MeasureAmountID <> Recipe_Ingredients.MeasureAmountID))