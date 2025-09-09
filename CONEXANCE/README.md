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

