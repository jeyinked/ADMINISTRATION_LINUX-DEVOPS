#!/usr/bin/env bash      # Exécuter avec bash
set -euo pipefail         # Stopper sur erreur, variables non définies, erreurs de pipe

WORK_ROOT="/home/sonarqube/DQE"             # Répertoire de travail
REPO_URL="https://git.dqe-software.com/DQE-SOFTWARE/EMAIL"  # URL du dépôt Git
REPO_DIR="$WORK_ROOT/EMAIL"                 # Répertoire cible du dépôt cloné

rm -rf "$REPO_DIR"                          # Supprime l'ancien dépôt si présent
mkdir -p "$WORK_ROOT"                       # Crée le dossier de travail si absent
cd "$WORK_ROOT"                             # Se place dans le dossier de travail

# Clone le dépôt en injectant l'user et mot de passe/PAT dans l'URL
git clone "https://${GIT_USER}:${GIT_PASS}@git.dqe-software.com/DQE-SOFTWARE/EMAIL"

cd "$REPO_DIR"                              # Entre dans le dossier du dépôt cloné

vrvocvê,cel;cz

# Lance l'analyse SonarQube avec le token d'authentification
sonar-scanner \
  -Dsonar.projectKey=DQE_EMAIL \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://162.19.53.212:9000 \
  -Dsonar.login="$SONAR_TOKEN"
