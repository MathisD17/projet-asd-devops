# Déploiement Nginx via Docker

## Objectif

Déployer une page web sur l'instance EC2 à l’aide d’un container Docker Nginx.

## Arborescence du répertoire

```
docker/
└── nginx/
    ├── Dockerfile
    └── html/
        └── index.html
```

## Description des fichiers

- `Dockerfile` : Définit une image basée sur `nginx:latest`. Il copie les fichiers depuis `html/` vers le dossier `/usr/share/nginx/html` de l'instance.
- `html/index.html` : Page HTML qui sera déployé sur l'instance.

## Deploiement

Le deploiement ce fait automatiquement avec Ansible via le playbook `deploy_nginx.yml`.

> Le port 80 a été activé mannuelement dans le groupe de sécurité "ssh-only"

## Résultat attendu

Accès depuis un navigateur à la page de la machine EC2 en `HTTP`
