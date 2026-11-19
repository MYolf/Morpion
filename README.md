# Morpion (Tic Tac Toe) en C

Projet **noté** réalisé à **Coda** dans le cadre de l'apprentissage du langage **C** (BNV 2026 — semaine 2).

C'est un jeu de morpion (tic-tac-toe) qui se joue dans le terminal : vous affrontez un ordinateur qui joue au hasard.

## Comment y jouer

- Vous jouez les **X**, le bot joue les **O**.
- La grille est numérotée de 0 à 8 :

```
0 | 1 | 2
3 | 4 | 5
6 | 7 | 8
```

- À votre tour, tapez le numéro d'une case libre (par exemple `4` pour la case du milieu) et validez avec Entrée.
- Le bot joue ensuite automatiquement une case libre au hasard.
- Le premier à aligner 3 symboles (ligne, colonne ou diagonale) gagne. Si les 9 cases sont remplies sans gagnant, c'est un match nul.

Exemple de début de partie :

```
Bienvenue dans Tic Tac Toe !
Vous jouez les X, le bot joue les O.
Les cases sont numerotees de 0 a 8.

0 | 1 | 2
3 | 4 | 5
6 | 7 | 8

Votre tour (X). Choisissez une case libre entre 0 a 8 : 4

0 | 1 | 2
3 | X | 5
6 | 7 | 8
Le bot joue la case 5 :

0 | 1 | 2
3 | X | O
6 | 7 | 8
```

## Lancer le jeu avec Docker

Le projet contient tout ce qu'il faut pour travailler dans un conteneur Docker : le `Dockerfile` construit une image Ubuntu avec un environnement C complet (gcc, make, valgrind, gdb...), et le `docker-compose.yaml` lance ce conteneur avec le dossier du projet monté dans `/workspace`.

### 1. Démarrer le conteneur

```bash
docker compose up -d
```

La première fois, cette commande construit l'image à partir du `Dockerfile`, puis démarre le conteneur `c-env` en arrière-plan.

### 2. Entrer dans le conteneur

```bash
docker compose exec c-env bash
```

Cette commande ouvre un terminal bash **à l'intérieur du conteneur**, directement dans `/workspace`, où se trouvent les fichiers du projet.

### 3. Compiler et lancer le jeu (dans le conteneur)

```bash
make all      # compile le projet et produit l'exécutable Morpion
./Morpion     # lance le jeu
```

- Le `./` signifie « exécute le fichier situé dans le dossier courant » : on lance l'exécutable `Morpion` créé par `make all`.
- `make re` fait la même chose mais en recompilant depuis zéro (utile après une modification du code).
- `make fclean` supprime l'exécutable.

### 4. Sortir du conteneur

```bash
exit
```

Vous sortez du shell du conteneur (il continue de tourner en arrière-plan). Pour l'arrêter complètement : `docker compose down`.

## Structure du projet

| Fichier | Rôle |
|---|---|
| `main.c` | Point d'entrée : initialisation de la grille, boucle de jeu, fin de partie |
| `tic-tac-toe.c` | Fonctions du jeu : affichage de la grille, coups du joueur et du bot, détection de victoire |
| `tic-tac-toe.h` | Déclarations (prototypes) des fonctions |
| `Makefile` | Compilation du projet (`make all`, `make re`, `make fclean`) |
| `Dockerfile` | Image Ubuntu avec un environnement de développement C complet |
| `docker-compose.yaml` | Lance le conteneur `c-env` avec le projet monté dans `/workspace` |
| `AIDE_EXTERIEURE.md` | Liste des aides extérieures utilisées pendant le projet |

## Aides extérieures

Les ressources et aides utilisées durant le projet sont détaillées dans [`AIDE_EXTERIEURE.md`](AIDE_EXTERIEURE.md).
