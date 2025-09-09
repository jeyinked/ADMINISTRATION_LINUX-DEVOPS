#!/bin/bash

# Définition des variables
url="http://localhost"   # URL du serveur NGINX
num_requests=1000        # Nombre de requêtes à envoyer
delay=0.01               # Temps en secondes entre chaque requête (ici 10ms)

# Boucle pour envoyer les requêtes
for ((i=1; i<=num_requests; i++)); do
    echo "Envoi de la requête $i..."
    response=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    echo "Code de réponse HTTP : $response"
    sleep $delay
done
