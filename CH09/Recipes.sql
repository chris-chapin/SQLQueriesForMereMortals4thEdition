-- "Display missing types of recipes."

SELECT Recipe_Classes.RecipeClassDescription
FROM Recipe_Classes
LEFT OUTER JOIN Recipes ON Recipes.RecipeClassID = Recipe_Classes.RecipeClassID
WHERE Recipes.RecipeID is NULL

-- "Show me all ingredients and any recipes they're used in."

SELECT Ingredients.IngredientName, UsedIngredients.RecipeTitle
FROM Ingredients
LEFT OUTER JOIN (
	SELECT Recipe_Ingredients.IngredientID, Recipes.RecipeTitle
	FROM Recipe_Ingredients
	INNER JOIN Recipes ON Recipes.RecipeID = Recipe_Ingredients.RecipeID) AS UsedIngredients
ON UsedIngredients.IngredientID = Ingredients.IngredientID

-- "List the salad, soup, and main course categories and any recipes."

SELECT Recipe_Classes.RecipeClassDescription, Recipes.RecipeTitle
FROM Recipe_Classes
LEFT OUTER JOIN Recipes ON Recipe_Classes.RecipeClassID = Recipes.RecipeClassID
WHERE Recipe_Classes.RecipeClassDescription LIKE '%Salad%'
OR Recipe_Classes.RecipeClassDescription LIKE '%Soup%'
OR Recipe_Classes.RecipeClassDescription LIKE '%Main%'

-- "Display all recipe classes and any recipes."

SELECT Recipe_Classes.RecipeClassDescription, Recipes.RecipeTitle
FROM Recipe_Classes
LEFT OUTER JOIN Recipes ON Recipe_Classes.RecipeClassID = Recipes.RecipeClassID