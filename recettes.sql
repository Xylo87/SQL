1- Afficher toutes les recettes disponibles (nom de la recette, catégorie et temps de préparation) 
triées de façon décroissante sur la durée de réalisation.

SELECT recette.nom, type_plat.nom, recette.tpsPrepaMin
FROM recette
INNER JOIN type_plat ON type_plat.idTypePlat = recette.idTypePlat
ORDER BY tpsPrepaMin DESC



2- En modifiant la requête précédente, faites apparaître le nombre d’ingrédients nécessaire par recette.

SELECT recette.nom, COUNT(ingredientsrecette.idRecette) -- AS nbIngredients
FROM recette
INNER JOIN ingredientsrecette ON ingredientsrecette.idRecette = recette.idRecette
GROUP BY recette.idRecette
-- ORDER BY COUNT(ingredientsrecette.idRecette) DESC
-- ORDER BY nbIngredients DESC



3- Afficher les recettes qui nécessitent au moins 30 min de préparation

SELECT recette.nom, recette.tpsPrepaMin
FROM recette
WHERE tpsPrepaMin >= 20



4- Afficher les recettes dont le nom contient le mot « Salade » (peu importe où est situé le mot en question)

SELECT recette.nom
FROM recette
WHERE nom LIKE "%salade%"





