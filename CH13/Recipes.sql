-- If I want to cook all the recipes in my cookbook, how much of each ingredient must I have on hand?
SELECT Ingredients.IngredientName, MeasurementDescription, SUM(Amount) AS TotalAmount
FROM Recipe_Ingredients
INNER JOIN Ingredients ON Ingredients.IngredientID = Recipe_Ingredients.IngredientID
INNER JOIN Measurements ON Measurements.MeasureAmountID = Recipe_Ingredients.MeasureAmountID
GROUP BY IngredientName, MeasurementDescription
ORDER BY IngredientName

-- List all meat ingredients and the count of recipes that include each one.
SELECT IngredientName, COUNT(Recipes.RecipeID) AS RecipeCount
FROM Ingredients
INNER JOIN Recipe_Ingredients ON Recipe_Ingredients.IngredientID = Ingredients.IngredientID
INNER JOIN Recipes ON Recipes.RecipeID = Recipe_Ingredients.RecipeID
WHERE IngredientClassID = 2
GROUP BY IngredientName

-- Solve #2 using a subquery
SELECT IngredientName, 
	(SELECT COUNT(*)
	FROM Recipe_Ingredients
	WHERE Ingredients.IngredientID = Recipe_Ingredients.IngredientID) AS RecipeCount
FROM Ingredients
WHERE IngredientClassID = 2

-- Why does #3 return 7 additional rows? Modify #2 to include those 7 additional rows.
-- Because Ingredients with 0 recipes are included in the query.
SELECT IngredientName, COUNT(Recipes.RecipeID) AS RecipeCount
FROM Ingredients
LEFT OUTER JOIN Recipe_Ingredients ON Recipe_Ingredients.IngredientID = Ingredients.IngredientID
LEFT OUTER JOIN Recipes ON Recipes.RecipeID = Recipe_Ingredients.RecipeID
WHERE IngredientClassID = 2
GROUP BY IngredientName