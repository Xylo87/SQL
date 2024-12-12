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



5- Insérer une nouvelle recette : « Pâtes à la carbonara » dont la durée de réalisation est de 20 min avec les instructions de votre choix. 

INSERT INTO recette (nom, tpsPrepaMin, instructions, idTypePlat) VALUES ("Pâtes à la carbonara", 20, "Cuire les pâtes, préparer la sauce, assembler les 2", 2)



6- Modifier  le  nom  de  la  recette  ayant  comme  identifiant  id_recette  =  3  (nom  de  la  recette  à  votre 
convenance)

UPDATE recette
SET recette.nom = "Pâtes à la tomate fraîche"
WHERE recette.idRecette = 3



7- Supprimer la recette n°2 de la base de données

DELETE FROM ingredientsrecette
WHERE ingredientsrecette.idRecette = 2

DELETE FROM recette
WHERE recette.idRecette = 2



8- Afficher le prix total de la recette n°5

SELECT recette.nom, ROUND(SUM(ingredient.prix*ingredientsrecette.quantite), 2)
FROM ingredient
INNER JOIN ingredientsrecette ON ingredientsrecette.idIngredient = ingredient.idIngredient
INNER JOIN recette ON recette.idRecette = ingredientsrecette.idRecette
WHERE recette.idRecette = 5



9- Afficher le détail de la recette n°5 (liste des ingrédients, quantités et prix)

SELECT ingredient.nom, ingredientsrecette.quantite, ingredientsrecette.uniteMsr, ingredient.prix
FROM ingredient
INNER JOIN ingredientsrecette ON ingredientsrecette.idIngredient = ingredient.idIngredient
INNER JOIN recette ON recette.idRecette = ingredientsrecette.idRecette
WHERE recette.idRecette = 5



10- Ajouter un ingrédient en base de données : Poivre, unité : cuillère à café, prix : 2.5 €

INSERT INTO ingredient VALUES ("32", "Poivre", "2.5")



11- Modifier le prix de l’ingrédient n°12 (prix à votre convenance) 

UPDATE ingredient
SET ingredient.prix = 2.5
WHERE ingredient.idIngredient = 12



12- Afficher le nombre de recettes par catégories : X entrées, Y plats, Z desserts

SELECT COUNT(recette.idRecette), type_plat.nom
FROM recette
INNER JOIN type_plat ON type_plat.idTypePlat = recette.idTypePlat
GROUP BY type_plat.idTypePlat



13- Afficher les recettes qui contiennent l’ingrédient « Poulet » 

SELECT recette.nom 
FROM recette
INNER JOIN ingredientsrecette ON ingredientsrecette.idRecette = recette.idRecette
INNER JOIN ingredient ON ingredient.idIngredient = ingredientsrecette.idIngredient
WHERE ingredient.nom LIKE "%poulet%"


14- Mettez à jour toutes les recettes en diminuant leur temps de préparation de 5 minutes



