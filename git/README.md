# GIT

- [Rebase](rebase.md)
- [Squash](squash.md)
- [Lister les fichiers ignorés par Git](gitignore.md)
- [Syntaxe avec 2 ou 3 points](dots.md)
- Commit commun à deux branches :  
  `git merge-base branch_1 branch_2`
- Voir un fichier à un commit :  
  `git show c3007ccba33ecff0a2823f74af9ff3673ff1cb5f:src/components/neuron-viewer/hooks/electrodes.ts`
- Voir le diff avec un commit :  
  `git diff c3007ccba -- src/components/neuron-viewer/neuron-viewer-with-actions.module.css`
- Fichier qui ont changé depuis un commit :  
  `git diff c3007ccba33ecff0a2823f74af9ff3673ff1cb5f --name-only`



