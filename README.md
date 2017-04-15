# Gisement

## Pour les utilisateurs

Fichiers pour l’association :

* `.mscz` : fichier Musescore
* `.pdf` : fichier pdf « Concert key » (ou « en Ut »)
* `.Bb.pdf` : fichier pdf version Si bémol
* `.Eb.pdf` : fichier pdf version Mi bémol

Bientôt des liens pour télécharger :

* tous les .pdf en Ut, ou en Bb, ou en Eb ;
* un book en Ut, en Bb ou en Eb ;
* tous les .mscz.

## Pour les développeurs

### Dépendances

* `make` ([site officiel](https://www.gnu.org/software/make/))
* `mscore` (MuseScore, [site officiel](musescore.org))

### Cibles

* `make` construit
    * tous les .pdf à partir des .mscz
    * bientôt les .pdf dans les autres tonalités
    * bientôt les books
* `make clean` supprime tous les .pdf
