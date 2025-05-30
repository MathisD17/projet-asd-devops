# Projet DevOps - ASD ENI

## Objectif du projet

Mettre en œuvre une infrastructure Cloud hybride **automatisée**, **sécurisée**, et **supervisée** dans un environnement simulé, dans le cadre de la formation Administrateur Systèmes DevOps (ASD) à l'ENI.

Ce projet n’est pas rattaché à une entreprise réelle mais suit un scénario de déploiement type professionnel.

---

## Technologies et outils utilisés

- **AWS** : Fournisseur Cloud (EC2, VPC, etc.)
- **Terraform** : Infrastructure as Code (IaC)
- **Ansible** : Déploiement et configuration automatisée
- **Docker** : Containerisation
- **Prometheus + Grafana** : Supervision et monitoring
- **Git + GitHub** : Versionnement
- **Linux (Ubuntu)** : OS pour les serveurs

---

## Structure du projet

```bash
projet-asd-devops/
├── infra-terraform/       # Infrastructure AWS avec Terraform
├── ansible/               # Playbooks et inventaire Ansible
├── docker/                # Dockerfiles et docker-compose.yml
├── docs/                  # Documentation technique (SSH, Terraform, etc.)
├── captures/              # Captures d'écran pour le dossier de projet
└── README.md              # Présentation du projet
```

---

## Fonctionnalités clés

- Création automatique d’une VM sur AWS via Terraform
- Génération de paire de clés SSH pour sécuriser l'accès
- Configuration automatisée avec Ansible (à venir)
- Déploiement de services dans des containers Docker (à venir)
- Supervision des services avec Prometheus et Grafana (à venir)

---

## Avancement

- [x] Initialisation du dépôt Git
- [x] Infrastructure de base avec Terraform
- [x] Connexion SSH sécurisée via clé générée
- [X] Configuration automatique avec Ansible
- [ ] Déploiement de containers Docker
- [ ] Mise en place d’un système de supervision
- [ ] Rédaction complète du dossier de projet

---

## Auteur

**Mathis DIZET** – Étudiant ENI – Parcours Administrateur Systèmes DevOps
Projet réalisé en autonomie dans un cadre pédagogique.

---

## Notes

Le dossier `.terraform/` et les fichiers `.pem`, `.tfstate` et d'autres fichier sensible sont **exclus du dépôt** pour des raisons de sécurité.
