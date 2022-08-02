-- Sum the amount of salt by recipe class, and display those recipe classes that require more than three teaspoons.
SELECT Recipe_Classes.RecipeClassDescription, Ingredients.IngredientName, SUM(Recipe_Ingredients.Amount) AS TotalTeaspoonsSalt
FROM Recipe_Classes
INNER JOIN Recipes ON Recipes.RecipeClassID = Recipe_Classes.RecipeClassID
INNER JOIN Recipe_Ingredients ON Recipe_Ingredients.RecipeID = Recipes.RecipeID
INNER JOIN Ingredients ON Ingredients.IngredientID = Recipe_Ingredients.IngredientID
WHERE Recipe_Ingredients.IngredientID = 11 AND Recipe_Ingredients.MeasureAmountID = 3
GROUP BY Recipe_Classes.RecipeClassDescription, Ingredients.IngredientName
HAVING SUM(Recipe_Ingredients.Amount) > 3

-- For what class of recipe do I have two or more recipes?
SELECT Recipe_Classes.RecipeClassDescription, COUNT(Recipes.RecipeID) AS NumberOfRecipes
FROM Recipe_Classes
INNER JOIN Recipes ON Recipes.RecipeClassID = Recipe_Classes.RecipeClassID
GROUP BY Recipe_Classes.RecipeClassDescription
HAVING COUNT(Recipes.RecipeID) > 1
