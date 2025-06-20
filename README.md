# Projet DevOps - Création d'une infrastructure cloud hybride

## Objectif du projet

Mettre en œuvre une infrastructure Cloud hybride **automatisée**, **sécurisée**, et **supervisée** dans un environnement simulé, dans le cadre de la formation Administrateur Systèmes DevOps (ASD) à l'ENI.

> Important : Ce projet n'est pas en lien avec l'entreprise d'alternance (BT2i Group), mais s'inscrit dans un contexte pédagogique.

## Technologies et outils utilisés

| Technologies       | Description                        |
|--------------------|------------------------------------|
| Infrastructure     | Terraform                          |
| Configuration      | Ansible                            |
| Conteneurisation   | Docker                             |
| Monitoring         | Prometheus, Grafana, Node Exporter |
| Cloud              | AWS (EC2, VPC, etc.)               |
| OS                 | Ubuntu Server                      |
| Versionning        | Git + GitHub                       |

## Arborescence du projet

```
projet-asd-devops/
├── ansible/
│   ├── ansible.cfg
│   ├── inventories/
│   │   └── hosts.ini
│   ├── playbooks/
│   │   ├── install_docker.yml
│   │   ├── deploy_nginx.yml
│   │   ├── deploy_prometheus.yml
│   │   ├── deploy_grafana.yml
│   │   ├── setup.yml
│   │   ├── update_prometheus_config.yml
│   │   └── deploy_node_exporter.yml
│   └── roles
│       └── node_exporter
│           ├── files
│           └── tasks
│               └── main.yml
├── docker
│   └── nginx
│       ├── Dockerfile
│       └── html
│           └── index.html
├── infra-terraform/
│   ├── main.tf
│   ├── outputs.tf
│   ├── variables.tf
├── docs
│   ├── ansible_doc.md
│   ├── ansible_docker_install.md
│   ├── docker_nginx.md
│   ├── monitoring_node_exporter.md
│   ├── monitoring_prometheus_grafana.md
│   ├── ssh_access.md
│   └── terraform_instance.md
└── monitoring
    ├── grafana
    │   └── Dockerfile
    └── prometheus
        ├── Dockerfile
        └── prometheus.yml
```

## Fonctionnalités clés

- Création automatique d’une VM sur AWS via Terraform
- Génération de paire de clés SSH pour sécuriser l'accès
- Configuration automatisée avec Ansible (à venir)
- Déploiement de services dans des containers Docker (à venir)
- Supervision des services avec Prometheus et Grafana (à venir)

---

## Accès aux services

| Service     | Port  | URL                          |
|-------------|-------|------------------------------|
| Prometheus  | 9090  | http://ip_public_ec2:9090    |
| Grafana     | 3000  | http://ip_public_ec2:3000    |
| Nginx       | 80    | http://ip_public_ec2         |


## Avancement

- [x] Initialisation du dépôt Git
- [x] Infrastructure de base avec Terraform
- [x] Connexion SSH sécurisée via clé générée
- [X] Configuration automatique avec Ansible
- [X] Déploiement de containers Docker
- [X] Mise en place d’un système de supervision
- [ ] Rédaction complète du dossier de projet

## Auteurs
**Mathis DIZET** – Étudiant ENI – Parcours Administrateur Systèmes DevOps
