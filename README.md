# Gisement

## Pour les utilisateurs

[Page de téléchargements](https://gisementjazz.github.io/gisement/dl.html)

Dans [le dépôt de travail](https://github.com/GisementJazz/gisement),
les fichiers pour l’association sont répartis dans les dossiers :

* `books` : books dans les trois tonalités
* `mscz` : fichiers Musescore
* `pdf` : fichiers pdf

## Pour les développeurs

### Dépendances

* `make` ([site officiel](https://www.gnu.org/software/make/))
* `mscore` (MuseScore, [site officiel](musescore.org))

### Cibles

* `make` ou `make books` construit
    * tous les .pdf à partir des .mscz
    * des fusions des .pdf, nommées `book.C.pdf`, `book.Bb.pdf` et `book.Eb.pdf`
* `make book_C`, `make book_Bb` et `make book_Eb` construisent
    * tous les .pdf dans la tonalité correspondante à partir des .mscz
      correspondants
    * le book correspondant
* `make mscz2pdf_C` `make mscz2pdf_Bb` `make mscz2pdf_Eb` construisent
    * tous les .pdf dans la tonalité correspondante à partir des .mscz
      correspondants
* `make dl` construit le fichier `dl.md`
* `make clean` suppriment
    * tous les .pdf
    * le fichier `dl.md`
