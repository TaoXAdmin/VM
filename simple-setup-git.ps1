# Script PowerShell simplifié pour l'initialisation du dépôt Git

Write-Host "Initialisation du dépôt Git pour le site web d'illusionniste contemporain..." -ForegroundColor Cyan

# 1. Initialisation du dépôt Git
git init
Write-Host "Dépôt Git initialisé" -ForegroundColor Green

# 2. Création du .gitignore
Write-Host "Création du fichier .gitignore..." -ForegroundColor Yellow
$gitignoreContent = @"
# Dépendances
node_modules/
npm-debug.log
yarn-error.log
yarn-debug.log
package-lock.json
yarn.lock

# Environnement
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# Dossiers de build et distribution
/dist/
/build/
/coverage/
/.next/
/out/

# Fichiers de cache
.cache/
.parcel-cache/
.eslintcache
.sass-cache/
.DS_Store
Thumbs.db

# Logs
logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Éditeurs et IDE
.idea/
.vscode/*
!.vscode/extensions.json
!.vscode/settings.json
!.vscode/tasks.json
!.vscode/launch.json
*.sublime-project
*.sublime-workspace
*.swp
*.swo

# WebGL et Assets temporaires
/temp/
*.blend1
*.blend2
*.psd
*.ai
*.tmp
*.bak

# Fichiers spécifiques au système
.directory
.Trash-*
ehthumbs.db
Desktop.ini
`$RECYCLE.BIN/

# Fichiers spécifiques au projet
/public/assets/temp/
/src/generated/
"@
Set-Content -Path ".gitignore" -Value $gitignoreContent
Write-Host ".gitignore créé" -ForegroundColor Green

# 3. Création du README.md
Write-Host "Création du README.md..." -ForegroundColor Yellow
$readmeContent = @"
# Site Web d'Illusionniste Contemporain

Ce projet est un site web moderne pour un illusionniste contemporain, utilisant des technologies avancées comme WebGL pour les animations et effets visuels.

## Installation

```bash
# Cloner le dépôt
git clone <url-du-repo>
cd <nom-du-repo>

# Installer les dépendances
npm install

# Installer les hooks Git
npm run prepare
```

## Workflow Git

Consultez [notre documentation Git](GIT-WORKFLOW.md) pour les détails sur notre workflow de développement.

## Structure du projet

```
├── public/            # Fichiers statiques
├── src/               # Code source
│   ├── components/    # Composants réutilisables
│   ├── pages/         # Pages du site
│   ├── styles/        # Styles CSS/SCSS
│   ├── utils/         # Utilitaires
│   └── animations/    # Animations et effets WebGL
├── tests/             # Tests
└── docs/              # Documentation
```

## Scripts disponibles

- `npm start` : Démarrer le serveur de développement
- `npm run build` : Construire le projet pour production
- `npm test` : Lancer les tests
- `npm run lint` : Vérifier le code avec ESLint
- `npm run format` : Formater le code avec Prettier

## Versioning

Ce projet suit le versioning sémantique (SemVer). Voir [notre documentation Git](GIT-WORKFLOW.md) pour plus de détails.
"@
Set-Content -Path "README.md" -Value $readmeContent
Write-Host "README.md créé" -ForegroundColor Green

# 4. Création de la documentation du workflow Git
Write-Host "Création de la documentation Git..." -ForegroundColor Yellow
$gitWorkflowContent = @"
# Workflow Git - Site Web d'Illusionniste Contemporain

Ce document décrit la structure et les pratiques Git à suivre pour le développement du site web d'illusionniste contemporain.

## Structure des branches

Notre dépôt utilise la structure de branches suivante :

- **`main`** : Code de production stable et déployé
- **`develop`** : Branche d'intégration pour les nouvelles fonctionnalités
- **`feature/*`** : Branches pour le développement de nouvelles fonctionnalités
- **`bugfix/*`** : Branches pour la correction de bugs
- **`release/*`** : Branches pour la préparation des releases

## Workflow de développement

### 1. Création d'une nouvelle fonctionnalité

```bash
# S'assurer d'être sur la branche develop à jour
git checkout develop
git pull origin develop

# Créer une nouvelle branche de fonctionnalité
git checkout -b feature/nom-de-la-fonctionnalite
```

### 2. Développement et commits

Suivez ces conventions pour vos messages de commit :

```
<type>(<portée>): <description>

[corps optionnel]

[pied de page optionnel]
```

Types de commit :
- `feat`: Nouvelle fonctionnalité
- `fix`: Correction de bug
- `docs`: Modification de la documentation
- `style`: Formatage du code
- `refactor`: Refactorisation du code
- `test`: Ajout ou modification de tests
- `chore`: Modifications diverses non liées au code

Exemple :
```
feat(animations): ajouter l'animation de lévitation

Implémente l'effet de lévitation pour la section "Tours"
avec WebGL pour optimiser les performances.

Closes #123
```

### 3. Pull Requests

Une fois votre fonctionnalité terminée :

1. Poussez votre branche vers le dépôt distant :
   ```bash
   git push origin feature/nom-de-la-fonctionnalite
   ```

2. Créez une Pull Request vers la branche `develop`
3. Demandez une revue de code
4. Une fois approuvée, la PR sera fusionnée

### 4. Préparation d'une release

```bash
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
```

## Versioning sémantique

Nous suivons le versioning sémantique (SemVer) pour notre projet :

`MAJEUR.MINEUR.CORRECTIF`

- **MAJEUR** : changements incompatibles avec les versions précédentes
- **MINEUR** : ajouts de fonctionnalités rétrocompatibles
- **CORRECTIF** : corrections de bugs rétrocompatibles

## Hooks Git

Des hooks pre-commit sont configurés pour vérifier la qualité du code :
- Linting avec ESLint
- Formatage avec Prettier
- Validation des tests unitaires

Pour les installer, exécutez :
```bash
npm run prepare
```

## Questions et support

Pour toute question sur le workflow Git, contactez l'administrateur DevOps du projet.
"@
Set-Content -Path "GIT-WORKFLOW.md" -Value $gitWorkflowContent
Write-Host "Documentation Git créée (GIT-WORKFLOW.md)" -ForegroundColor Green

# 5. Configuration des hooks Git
Write-Host "Configuration des hooks Git..." -ForegroundColor Yellow
New-Item -Path ".git\hooks" -ItemType Directory -Force | Out-Null

# 6. Création du hook pre-commit
$preCommitContent = @"
#!/bin/sh

# Script de hook pre-commit pour validation du code
# À placer dans .git/hooks/pre-commit

echo "Exécution des vérifications pre-commit..."

# Récupération des fichiers modifiés (staged)
STAGED_FILES=\$(git diff --cached --name-only --diff-filter=ACMR | grep -E '\.(js|jsx|ts|tsx)\$')

# Vérification si des fichiers JS/TS sont à commiter
if [ "\$STAGED_FILES" = "" ]; then
  echo "Aucun fichier JavaScript/TypeScript à valider."
  exit 0
fi

# Sauvegarde des fichiers indexés
echo "Sauvegarde temporaire des fichiers..."
git stash push --keep-index --include-untracked --quiet

echo "Linting des fichiers avec ESLint..."
npx eslint \$STAGED_FILES --quiet
ESLINT_EXIT_CODE=\$?

echo "Vérification du formatage avec Prettier..."
npx prettier --check \$STAGED_FILES
PRETTIER_EXIT_CODE=\$?

# Exécution des tests
echo "Exécution des tests unitaires..."
npm test -- --findRelatedTests \$STAGED_FILES --passWithNoTests
TESTS_EXIT_CODE=\$?

# Restauration des fichiers stashés
echo "Restauration des fichiers..."
git stash pop --quiet

# Vérification des résultats
if [ \$ESLINT_EXIT_CODE -ne 0 ]; then
  echo "❌ ESLint a trouvé des erreurs. Le commit est annulé."
  echo "Corrigez les erreurs et réessayez, ou utilisez git commit --no-verify pour ignorer."
  exit 1
fi

if [ \$PRETTIER_EXIT_CODE -ne 0 ]; then
  echo "❌ Prettier a trouvé des problèmes de formatage. Le commit est annulé."
  echo "Exécutez 'npx prettier --write' sur les fichiers pour corriger, ou utilisez git commit --no-verify pour ignorer."
  exit 1
fi

if [ \$TESTS_EXIT_CODE -ne 0 ]; then
  echo "❌ Les tests ont échoué. Le commit est annulé."
  echo "Corrigez les tests et réessayez, ou utilisez git commit --no-verify pour ignorer."
  exit 1
fi

echo "✅ Vérifications pre-commit réussies!"
exit 0
"@
Set-Content -Path ".git\hooks\pre-commit" -Value $preCommitContent -NoNewline
Write-Host "Hook pre-commit configuré" -ForegroundColor Green

# 7. Ajout de la configuration npm pour les hooks
Write-Host "Ajout de la configuration npm pour les hooks..." -ForegroundColor Yellow
if (Test-Path "package.json") {
    Write-Host "package.json existe déjà. Veuillez ajouter manuellement le script 'prepare': 'husky install' à package.json" -ForegroundColor Yellow
} else {
    $packageJsonContent = @"
{
  "name": "site-illusionniste",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "prepare": "husky install"
  },
  "devDependencies": {
    "husky": "^8.0.0"
  }
}
"@
    Set-Content -Path "package.json" -Value $packageJsonContent
    Write-Host "package.json créé avec script 'prepare'" -ForegroundColor Green
}

# 8. Création des branches principales
Write-Host "Création des branches principales..." -ForegroundColor Yellow
git add .
git commit -m "chore: initialisation du dépôt Git" -m "Mise en place de la structure Git et de la documentation du workflow"
Write-Host "Premier commit créé sur main" -ForegroundColor Green

git branch develop
Write-Host "Branche develop créée" -ForegroundColor Green

# 9. Instructions finales
Write-Host ""
Write-Host "Configuration Git terminée avec succès!" -ForegroundColor Magenta
Write-Host ""
Write-Host "Prochaines étapes :" -ForegroundColor Cyan
Write-Host "1. Installer husky pour automatiser les hooks Git :" -ForegroundColor White
Write-Host "   npm install --save-dev husky" -ForegroundColor Gray
Write-Host ""
Write-Host "2. Configurer un dépôt distant :" -ForegroundColor White
Write-Host "   git remote add origin <url-du-repo>" -ForegroundColor Gray
Write-Host ""
Write-Host "3. Pousser le dépôt vers le serveur distant :" -ForegroundColor White
Write-Host "   git push -u origin main" -ForegroundColor Gray
Write-Host "   git push -u origin develop" -ForegroundColor Gray
Write-Host ""
Write-Host "4. Commencer à développer de nouvelles fonctionnalités :" -ForegroundColor White
Write-Host "   git checkout develop" -ForegroundColor Gray
Write-Host "   git checkout -b feature/nouvelle-fonctionnalite" -ForegroundColor Gray
Write-Host ""
Write-Host "Pour plus d'informations, consultez le fichier GIT-WORKFLOW.md" -ForegroundColor White