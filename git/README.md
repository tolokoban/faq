# GIT

- [Rebase](rebase.md)
- [Squash](squash.md)
- [Lister les fichiers ignorés par Git](gitignore.md)
- Commit commun à deux branches : `git merge-base branch_1 branch_2`
- Voir un fichier à un commit : `git show c3007ccba33ecff0a2823f74af9ff3673ff1cb5f:src/components/neuron-viewer/hooks/electrodes.ts`
- Voir le diff avec un commit : `git diff c3007ccba -- src/components/neuron-viewer/neuron-viewer-with-actions.module.css`
- Fichier qui ont changé depuis un commit : `git diff c3007ccba33ecff0a2823f74af9ff3673ff1cb5f --name-only`


## Syntaxe avec 2 ou 3 points

### git log (and rev-list)

- `A..B` — commits reachable from B but **not** from A. Think of it as "what's in B that's not in A" (equivalent to `^A B`).
- `A...B` — commits reachable from **either** A or B, but **not both** (symmetric difference).

```
      C---D---E  (B)
     /
A---B---F---G    (A)
```

- `A..B` → `C, D, E`
- `A...B` → `C, D, E, F, G`

### git diff

It's essentially reversed:

- `A..B` — diff between A and B directly (same as `git diff A B`).
- `A...B` — diff between the **merge base** of A and B, and B. In other words, "what did B change since it diverged from A?"

Using the same graph:
- `git diff A..B` → diff from G to E
- `git diff A...B` → diff from B (the fork point) to E

The `...` form in `git diff` is especially useful for reviewing what a branch actually changed, ignoring work that happened on the other branch since they diverged.
