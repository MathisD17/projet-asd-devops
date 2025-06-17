# Déploiement de Nginx avec Docker

Ce document détaille la procédure utilisée pour construire et déployer un container Docker Nginx personnalisé.

## Objectif

Servir une page web statique via un container Nginx lancé depuis une machine EC2.

## Arborescence du projet

```
docker/
└── nginx/
    ├── Dockerfile
    └── html/
        └── index.html
```

## Contenu du `Dockerfile`

Le `Dockerfile` contient une image basée sur `nginx:latest`, dans laquelle on copie le contenu statique à exposer.

## Commandes utilisées

Sur la machine EC2 cible :

```bash
docker build -t custom-nginx ./docker/nginx
docker run -d -p 80:80 --name nginx custom-nginx
```

> Remarque : Le port 80 doit être ouvert dans le Security Group AWS de l’instance EC2 pour permettre un accès HTTP.

## Résultat attendu

En accédant à l’adresse publique de l’instance EC2 via un navigateur (ex: `http://<IP_EC2>`), on voit le contenu de la page `index.html` personnalisée.
