# Provisionnement de l'infrastructure avec Terraform

Ce fichier décrit les étapes de configuration de l'infrastructure via Terraform.

## Objectif

Créer une instance EC2 avec une paire de clés SSH sur AWS, depuis une machine virtuel locale  (terraform-dev).

## Prérequis

- Un compte AWS (clé d'accès et clé secrète)
- Terraform installé sur la machine locale
- Accès Internet pour le téléchargement des providers

## Fichiers Terraform

```
infra-terraform/
├── main.tf
├── outputs.tf
├── variables.tf
└── terraform.tfvars
```

## Commandes utilisées

```bash
terraform init            # Initialise le projet et télécharge les providers
terraform validate        # Vérifie la validité des fichiers
terraform plan            # Prévisualise les actions
terraform apply           # Lance le déploiement
terraform destroy         # Supprime les ressources créées
```

> Le dossier `.terraform/` et des fichiers comme `terraform.tfvars` sont exclus du versionning via `.gitignore` pour des raisons de sécurité.

## Résultat attendu

Une machine virtuelle EC2 Ubuntu est créée et accessible en SSH, avec une clé générée automatiquement par Terraform, voir `docs/ssh_access.md` pour plus d'informations.
