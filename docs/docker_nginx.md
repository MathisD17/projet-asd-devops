# Déploiement de Nginx avec Docker et Ansible

## Objectif
Déployer automatiquement un conteneur Nginx personnalisé sur la machine EC2 provisionnée avec Terraform.

---

## Structure des fichiers

projet-asd-devops/
├── docker/
│   └── nginx/
│       ├── Dockerfile
│       └── html/
│           └── index.html
├── ansible/
│   ├── inventories/
│   │   └── hosts.ini
│   └── playbooks/
│       └── deploy_nginx.yml

---

## Fichiers importants

- Dockerfile : définit une image basée sur nginx:latest et copie le contenu HTML personnalisé.
- index.html : page d’accueil affichée sur le serveur Nginx.
- deploy_nginx.yml : playbook Ansible pour copier les fichiers nécessaires sur l’EC2 et lancer un container Nginx.

---

## Déploiement

Le playbook Ansible est exécuté pour :
1. Créer un répertoire distant pour stocker les fichiers.
2. Copier le Dockerfile et le contenu HTML.
3. Lancer un container Docker avec volume monté sur `/usr/share/nginx/html`.

---

## Résultat attendu

Une fois le déploiement terminé, la page web personnalisée est accessible via l’IP publique de l’instance.
