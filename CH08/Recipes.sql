-- "List all the reciples for salads."
SELECT RecipeTitle, RecipeClassDescription
FROM Recipes
INNER JOIN Recipe_Classes ON Recipe_Classes.RecipeClassID = Recipes.RecipeClassID
WHERE Recipe_Classes.RecipeClassDescription LIKE '%Salad%'

-- "List all the recipes that contain a dairy ingredient."
SELECT DISTINCT RecipeTitle
From ((Recipes
INNER JOIN Recipe_Ingredients ON Recipe_Ingredients.RecipeID = Recipes.RecipeID)
INNER JOIN Ingredients ON Ingredients.IngredientID = Recipe_Ingredients.IngredientID)
INNER JOIN Ingredient_Classes ON Ingredient_Classes.IngredientClassID = Ingredients.IngredientClassID
WHERE IngredientClassDescription LIKE '%Dairy%'

-- "Find the ingredients that use the same default measurement amount."
SELECT
First_Ingredient.FirstIngredientName,
First_Ingredient.MeasurementDescription,
Second_Ingredient.SecondIngredientName
FROM (
	SELECT Ingredients.IngredientName AS FirstIngredientName, Measurements.MeasurementDescription
	FROM Ingredients
	INNER JOIN Measurements ON Ingredients.MeasureAmountID = Measurements.MeasureAmountID) AS First_Ingredient
	INNER JOIN (
		SELECT Ingredients.IngredientName AS SecondIngredientName, Measurements.MeasurementDescription
		FROM Ingredients
		INNER JOIN Measurements ON Ingredients.MeasureAmountID = Measurements.MeasureAmountID) AS Second_Ingredient
	ON First_Ingredient.FirstIngredientName <> Second_Ingredient.SecondIngredientName AND First_Ingredient.MeasurementDescription = Second_Ingredient.MeasurementDescription

-- "Show me the recipes that have beef and garlic."
SELECT BeefRecipes.RecipeTitle
FROM (
	SELECT Recipes.RecipeID, RecipeTitle
	FROM (Recipes
		INNER JOIN Recipe_Ingredients ON Recipe_Ingredients.RecipeID = Recipes.RecipeID)
	INNER JOIN Ingredients ON Ingredients.IngredientID = Recipe_Ingredients.IngredientID
	WHERE Ingredients.IngredientName = 'Beef'
	) AS BeefRecipes
INNER JOIN (
	SELECT Recipes.RecipeID, RecipeTitle
	FROM (Recipes
		INNER JOIN Recipe_Ingredients ON Recipe_Ingredients.RecipeID = Recipes.RecipeID)
	INNER JOIN Ingredients ON Ingredients.IngredientID = Recipe_Ingredients.IngredientID
	WHERE Ingredients.IngredientName = 'Garlic'
	) AS GarlicRecipes
ON GarlicRecipes.RecipeID = BeefRecipes.RecipeID