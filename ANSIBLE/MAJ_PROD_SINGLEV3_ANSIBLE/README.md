# MAJ SINGLEV3

Playbook Ansible pour déployer et redémarrer le service **singlev3 JPN**.

## Étapes réalisées
- Suppression de l’ancien backup (`singlev3.old`)
- Sauvegarde de la version actuelle
- Vérification des permissions
- Copie de la nouvelle version
- Génération des bases JPN
- Indexation Redis
- Redémarrage du service JPN

## Utilisation
```bash
run_maj_singlev3.sh
```

## Retour arrière 
```bash
stepback_maj_singlev3.sh
```
