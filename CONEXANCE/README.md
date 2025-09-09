# Script de lancement Conexance

Ce script Bash permet de démarrer automatiquement les services nécessaires à Conexance dans des sessions **tmux**.

## Services lancés
1. **SOAP service** → `Dedup.pyc` (port 8081)  
2. **Compteur service** → `JsonCountServer.pyc` (port 8001)  
3. **JSON service** → `JsonDedupServer.pyc` (port 8083, dépend du SOAP & Compteur)  
4. **Conexance service** → `DQEserveurjson_Neptune_V2.pyc` (port 9000, dépend du JSON)  

## Utilisation
```bash
./start_conexance.sh
```
# Script de démarrage Conexance

Ce script permet de tuer les anciens services puis de relancer automatiquement les 4 services dans **tmux**.

## Explication

- `#!/bin/bash` → exécution avec Bash  
- `pkill -9 -f ...` → tue les anciens processus (force -9)  
- `tmux send-keys ... cd ...` → change de dossier dans la session tmux  
- `tmux send-keys ... python2.7 ...` → lance le service Python correspondant  
- `Enter` → valide la commande envoyée dans tmux  
- `sleep 1` → attend 1 seconde pour laisser le service démarrer  
- Sections :  
  1. **SOAP service** (`Dedup.pyc`, port 8081)  
  2. **Compteur service** (`JsonCountServer.pyc`, port 8001)  
  3. **JSON service** (`JsonDedupServer.pyc`, port 8083)  
  4. **Conexance service** (`DQEserveurjson_Neptune_V2.pyc`, port 9000)  

Chaque service est exécuté dans une session **tmux** séparée (`01_soap`, `02_compteur`, `03_json`, `04_conexance`).  

## Utilisation

```bash
./start_services.sh


