# Gisement

## Pour les utilisateurs

[Page de téléchargements](https://gisementjazz.github.io/gisement/dl.html)

Dans [le dépôt de travail](https://github.com/GisementJazz/gisement),
les fichiers pour l’association sont répartis dans les dossiers :

* `books` : books dans les trois tonalités, format pdf
* `mscz` : fichiers MuseScore
* `pdf` : fichiers pdf

Les pdfs sont générés automatiquement depuis les fichiers MuseScore.
Si une partition n’a pas de version transposée, un outil de transposition
mécanique est utilisée. Il peut donc rester quelques problèmes, mais il suffit
d’ajouter le ficher MuseScore retouché à la main.

## Pour les développeurs

### Dépendances

* `make` ([site officiel](https://www.gnu.org/software/make/))
* `mscore` (MuseScore, [site officiel](musescore.org))
* `convert`, une commande de ImageMagick ([site officiel](http://www.imagemagick.org/))
* copier `transpose.*.qml` fournis dans le dépôt dans
  `/usr/share/mscore/plugins` (ou similaire)

### Cibles

Lors de la construction des pdf en Ut, si le `.mscz` en Bb n’est pas trouvé,
la transposition est faite automatiquement. Idem pour Eb. C’est pour cela que
les versions en Ut sont construites de toutes façons.

* `make` ou `make books` construit
    * tous les .pdf à partir des .mscz
    * des fusions des .pdf, nommées `book.C.pdf`, `book.Bb.pdf` et `book.Eb.pdf`
* `make book_C`, `make book_Bb` et `make book_Eb` construisent
    * tous les .pdf dans la tonalité correspondante à partir des .mscz
      correspondants (notez que les versions C sont construites de toutes façons)
    * le book correspondant
* `make mscz2pdf_C` `make mscz2pdf_Bb` `make mscz2pdf_Eb` construisent
    * tous les .pdf dans la tonalité correspondante à partir des .mscz
      correspondants
* `make dl` construit le fichier `dl.md`
* `make clean` supprime
    * tous les .pdf
    * le fichier `dl.md`
