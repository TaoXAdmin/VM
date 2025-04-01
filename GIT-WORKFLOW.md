# Workflow Git - Site Web d'Illusionniste Contemporain

Ce document décrit la structure et les pratiques Git à suivre pour le développement du site web d'illusionniste contemporain.

## Structure des branches

Notre dépôt utilise la structure de branches suivante :

- **main** : Code de production stable et déployé
- **develop** : Branche d'intégration pour les nouvelles fonctionnalités
- **eature/*** : Branches pour le développement de nouvelles fonctionnalités
- **ugfix/*** : Branches pour la correction de bugs
- **elease/*** : Branches pour la préparation des releases

## Workflow de développement

### 1. Création d'une nouvelle fonctionnalité

`ash
# S'assurer d'être sur la branche develop à jour
git checkout develop
git pull origin develop

# Créer une nouvelle branche de fonctionnalité
git checkout -b feature/nom-de-la-fonctionnalite
`

### 2. Développement et commits

Suivez ces conventions pour vos messages de commit :

`
<type>(<portée>): <description>

[corps optionnel]

[pied de page optionnel]
`

Types de commit :
- eat: Nouvelle fonctionnalité
- ix: Correction de bug
- docs: Modification de la documentation
- style: Formatage du code
- efactor: Refactorisation du code
- 	est: Ajout ou modification de tests
- chore: Modifications diverses non liées au code

Exemple :
`
feat(animations): ajouter l'animation de lévitation

Implémente l'effet de lévitation pour la section "Tours"
avec WebGL pour optimiser les performances.

Closes #123
`

### 3. Pull Requests

Une fois votre fonctionnalité terminée :

1. Poussez votre branche vers le dépôt distant :
   `ash
   git push origin feature/nom-de-la-fonctionnalite
   `

2. Créez une Pull Request vers la branche develop
3. Demandez une revue de code
4. Une fois approuvée, la PR sera fusionnée

### 4. Préparation d'une release

`ash
# Créer une branche de release à partir de develop
git checkout develop
git checkout -b release/v1.2.3

# Effectuer les derniers ajustements (version, changelog...)
# ...

# Fusionner dans main
git checkout main
git merge --no-ff release/v1.2.3
git tag -a v1.2.3 -m "Version 1.2.3"
git push origin main --tags

# Fusionner aussi dans develop
git checkout develop
git merge --no-ff release/v1.2.3
git push origin develop
`

## Versioning sémantique

Nous suivons le versioning sémantique (SemVer) pour notre projet :

MAJEUR.MINEUR.CORRECTIF

- **MAJEUR** : changements incompatibles avec les versions précédentes
- **MINEUR** : ajouts de fonctionnalités rétrocompatibles
- **CORRECTIF** : corrections de bugs rétrocompatibles

## Hooks Git

Des hooks pre-commit sont configurés pour vérifier la qualité du code :
- Linting avec ESLint
- Formatage avec Prettier
- Validation des tests unitaires

Pour les installer, exécutez :
`ash
npm run prepare
`

## Questions et support

Pour toute question sur le workflow Git, contactez l'administrateur DevOps du projet.
