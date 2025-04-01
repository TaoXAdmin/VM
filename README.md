# Site Web d'Illusionniste Contemporain

Ce projet est un site web moderne pour un illusionniste contemporain, utilisant des technologies avancées comme WebGL pour les animations et effets visuels.

## Installation

`ash
# Cloner le dépôt
git clone <url-du-repo>
cd <nom-du-repo>

# Installer les dépendances
npm install

# Installer les hooks Git
npm run prepare
`

## Workflow Git

Consultez [notre documentation Git](GIT-WORKFLOW.md) pour les détails sur notre workflow de développement.

## Structure du projet

`
├── public/            # Fichiers statiques
├── src/               # Code source
│   ├── components/    # Composants réutilisables
│   ├── pages/         # Pages du site
│   ├── styles/        # Styles CSS/SCSS
│   ├── utils/         # Utilitaires
│   └── animations/    # Animations et effets WebGL
├── tests/             # Tests
└── docs/              # Documentation
`

## Scripts disponibles

- 
pm start : Démarrer le serveur de développement
- 
pm run build : Construire le projet pour production
- 
pm test : Lancer les tests
- 
pm run lint : Vérifier le code avec ESLint
- 
pm run format : Formater le code avec Prettier

## Versioning

Ce projet suit le versioning sémantique (SemVer). Voir [notre documentation Git](GIT-WORKFLOW.md) pour plus de détails.
