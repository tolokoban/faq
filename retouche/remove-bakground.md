# Supprimer l'arrière-plan

Aussi appelée _détourer une image_, cette technique sert, par exemple, à ne garder qu'un personnage sur une image et rendre tout le reste transparent.

## Masque de transparence dans Krita

* Selectionner le contour de l'objet/personnage à extraire.
* Click droit sur le Layer courant et menu **Add -> Add Transparency Mask**.

On peut désormais utiliser ce masque pour paufiner les contours.

## Vector shape dans Krita

Une autre technique consiste à utiliser un layer vectoriel avec des courbes de Bézier pour détourer.

* Créer un groupe pour le Layer courant.
* Y ajouter un layer vectoriel (**Add Vector Layer** ou `Shift-Ins`).
* S'assurer que ce layer vectoriel soit en dessous de l'autre.
* Dans le layer vectoriel, créer une courbe de bézier qui épouse les formes à détourer.  
  Ne pas oublier d'aller d'abord dans les options de l'outil et de mettre un remplissage (fill) et pas de ligne (outline).
* Dans le layer image, cliquer sur la petite icône en forme de Alpha et le masque est appliqué.
