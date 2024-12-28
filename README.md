# ⚡⛁ Série de Base de données SQL et d'exercices de requêtes associés

## 1. Description
Exercices pratiques de Modélisation conceptuelle de données/Modèle logique de données (**MCD/MLD**), de création de bases de données **SQL** et de requêtes spécifiques.
La base de données *Recettes* est élaborée autour d'une dizaine de recettes de cuisine (ingrédients, type de plat etc.).
La base de données *Cinéma* est élaborée autour d'une dizaine de films ainsi que d'acteurs/actrices et réalisateurs associés.
Différentes commandes **SQL** sont exploitées au sein de ces exercices, entre autres :
- **SELECT** (-> lecture)
- **WHERE** (LIKE, NOT IN) (-> filtrage)
- **GROUP BY** (-> groupement des résultats)
- **ORDER BY** (-> classement des résultats)
- **INSERT INTO** (-> insertion d'une ligne)
- **UPDATE** (-> changement des valeurs d'une ligne)
- **DELETE** (-> suppression d'une ligne)
- des commandes de jointure type **INNER JOIN**
- les fonctions d'agrégation **AVG()**, **COUNT()**, **MAX()**, **MIN()** et **SUM()**
- **HAVING** (-> filtrage via les fonctions d'agrégation)

## 2. Installation 

 1. Clonez ce projet depuis GitHub :
 ```bash
   git clone https://github.com/Xylo87/SQL.git
   cd SQL
   ```
2. Installer un logiciel type "Looping" de **MCD** pour exécuter le fichier `.loo` et visualiser le modélisation du projet *Cinéma* 

- Télécharger Looping [ici](https://www.looping-mcd.fr/)

3. Installer un logiciel type "Laragon" pour disposer d'un environnement qui permet d'exécuter des fichiers **SQL** ("HeidiSQL") :

- Télécharger Laragon [ici](https://laragon.org/download/)
- Démarrer Laragon
- Exécuter la fonction "Base de données" de Laragon
- Sur HeidiSQL : Fichier > Exécuter un fichier SQL > Sélectionner le fichier SQL pour ouvrir la base de données (`recettes.sql`ou `cinema.sql`)

## 3. Utilisation

Les fichiers `exoRecettes.sql` et `exoCinema.sql` contiennent des requêtes **SQL** spécifiques.
Pour test, sélectionnez la base de données adéquate dans HeidiSQL, entrez la code SQL dans l'onglet "Requête" et appuyez sur F9.

## 4. Auteur
Projet réalisé par Théo Arbogast (aka Xylo87).
N'hésitez pas à ouvrir une issue ou à me contacter pour toute suggestion ou question.

