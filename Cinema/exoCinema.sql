


a. Informations  d’un  film  (id_film)  :  titre,  année,  durée  (au  format  HH:MM)  et 
réalisateur

SELECT film.titre, DATE_FORMAT(film.annee, "%Y"), DATE_FORMAT(SEC_TO_TIME(duree * 60), "%H:%i"), personne.prenom, personne.nom
FROM film
INNER JOIN reali ON reali.idReali = film.idReali
INNER JOIN personne ON personne.idPersonne = reali.idPersonne
WHERE film.idFilm = 1



b. Liste des films dont la durée excède 2h15 classés par durée (du + long au + court)

SELECT film.titre, DATE_FORMAT(SEC_TO_TIME(duree * 60), "%H:%i")
FROM film
WHERE duree > 135
ORDER BY film.duree DESC



c. Liste des films d’un réalisateur (en précisant l’année de sortie)

SELECT film.titre, personne.prenom, personne.nom, DATE_FORMAT(film.annee, "%Y")
FROM film
INNER JOIN reali ON reali.idReali = film.idReali
INNER JOIN personne ON personne.idPersonne = reali.idPersonne
WHERE reali.id_realisateur = 5



d. Nombre de films par genre (classés dans l’ordre décroissant)

SELECT genre.libelle, COUNT(categorie.idGenre) AS nbFilm
FROM genre
INNER JOIN categorie ON categorie.idGenre = genre.idGenre
GROUP BY genre.id_genre
ORDER BY nbFilm DESC



e. Nombre de films par réalisateur (classés dans l’ordre décroissant) 

SELECT personne.prenom, personne.nom, COUNT(film.idReali) AS nbFilm
FROM personne
INNER JOIN reali ON reali.idPersonne = personne.idPersonne
INNER JOIN film ON film.idReali = reali.idReali
GROUP BY film.idReali
ORDER BY nbFilm DESC



f. Casting d’un film en particulier (id_film) : nom, prénom des acteurs + sexe

SELECT film.titre, personne.prenom, personne.nom, personne.sexe
FROM film
INNER JOIN interpretation ON interpretation.idFilm = film.idFilm
INNER JOIN acteurice ON acteurice.idActeurice = interpretation.idActeurice
INNER JOIN personne ON personne.idPersonne = acteurice.idPersonne
WHERE film.idFilm = 2



g. Films tournés par un acteur en particulier (id_acteur) avec leur rôle et l’année de 
sortie (du film le plus récent au plus ancien)

SELECT personne.prenom, personne.nom, film.titre, DATE_FORMAT(film.annee, "%Y"), role.personnage
FROM film
INNER JOIN interpretation ON interpretation.idFilm = film.idFilm
INNER JOIN role ON role.idRole = interpretation.idRole
INNER JOIN acteurice ON acteurice.idActeurice = interpretation.idActeurice
INNER JOIN personne ON personne.idPersonne = acteurice.idPersonne
WHERE acteurice.idActeurice = 10
ORDER BY film.annee DESC



h. Liste des personnes qui sont à la fois acteurs et réalisateurs

SELECT personne.prenom, personne.nom
FROM personne
INNER JOIN reali ON reali.idPersonne = personne.idPersonne
INNER JOIN acteurice ON acteurice.idPersonne = personne.idPersonne



i. Liste des films qui ont moins de 5 ans (classés du plus récent au plus ancien)

SELECT film.titre, DATE_FORMAT(film.annee, "%Y")
FROM film
WHERE film.annee < DATE_SUB(NOW(), INTERVAL 5 YEAR)
-- WHERE film.annee < DATE_ADD(NOW(), INTERVAL -5 YEAR)
ORDER BY film.annee



j. Nombre d’hommes et de femmes parmi les acteurs

SELECT COUNT(personne.sexe), personne.sexe
FROM personne
INNER JOIN acteurice ON acteurice.idPersonne = personne.idPersonne
GROUP BY personne.sexe



k. Liste des acteurs ayant plus de 50 ans (âge révolu et non révolu)

SELECT personne.prenom, personne.nom, DATE_FORMAT(personne.dateNais, "%D %b %Y")
FROM personne
INNER JOIN acteurice ON acteurice.idPersonne = personne.idPersonne
WHERE personne.dateNais <= DATE_SUB(NOW(), INTERVAL 50 YEAR)
-- WHERE personne.dateNais <= DATE_ADD(NOW(), INTERVAL -50 YEAR)
ORDER BY personne.dateNais



l. Acteurs ayant joué dans 3 films ou plus 

SELECT personne.prenom, personne.nom
FROM personne
INNER JOIN acteurice ON acteurice.idPersonne = personne.idPersonne
INNER JOIN interpretation ON interpretation.idActeurice = acteurice.idActeurice
GROUP BY personne.idPersonne
HAVING COUNT(interpretation.idFilm) >= 3