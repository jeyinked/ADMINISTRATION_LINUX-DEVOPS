
# Git + SonarQube Automation

Ce projet automatise le clonage d’un dépôt Git et l’analyse SonarQube via un script Bash.

## Prérequis
- **Bash** ≥ 4
- **Git**
- **SonarQube Scanner**

## Variables d’environnement
Exporter avant d’exécuter le script :
```bash
export GIT_USER="mon_user"
export GIT_PASS="mon_pat_gitlab"
export SONAR_TOKEN="mon_token_sonar"


Le script :
Supprime le dépôt local existant
Clone le dépôt Git

Lance l’analyse SonarQube
