# Infrastructure et Accès SSH avec Terraform

## Objectif

Automatiser le déploiement d’une instance EC2 sur AWS, dans un environnement réseau personnalisé, avec un accès SSH sécurisé via une paire de clés générée automatiquement.

## Arborescence des fichiers Terraform

```
infra-terraform/
├── main.tf
├── outputs.tf
├── variables.tf
└── terraform.tfvars
```

## Description des fichiers

- `main.tf` :
  - Génère une paire de clés SSH (resource `tls_private_key`)
  - Configure le provider AWS (`region`, `access_key`, `secret_key`)
  - Crée les ressources réseau (VPC, Subnet, Internet Gateway, Route Table)
  - Définit un groupe de sécurité autorisant uniquement le SSH (port 22)
  - Crée une instance EC2 Ubuntu avec attachement de la clé SSH

- `outputs.tf` :
  - Affiche dynamiquement l’adresse IP publique de l’instance EC2 (`instance_ip`)

- `variables.tf` :
  - Contient les variables nécessaires (`aws_access_key`, `aws_secret_key`)

- `terraform.tfvars` :
  - Fichier contenant les valeurs sensibles (non versionné pour la sécurité)

## Déploiement

Depuis le dossier `infra-terraform/` :

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

## Accès SSH à l'instance EC2

Une fois le déploiement terminé :

### 1. Export de la clé privée générée

```bash
terraform output -raw private_key_pem > ~/.ssh/terraform-key.pem
chmod 600 ~/.ssh/terraform-key.pem
```

### 2. Connexion SSH à l’instance

```bash
ssh -i ~/.ssh/terraform-key.pem ubuntu@<IP_PUBLIC_EC2>
```

## Sécurité

- La clé privée n’est pas versionnée
- L'utilisateur SSH est `ubuntu`
- Le fichier `.pem` est protégé en permissions (`chmod 600`)

## Résultat attendu

Une machine virtuelle EC2 Ubuntu fonctionnelle, connectée à Internet via un VPC configuré, et accessible en SSH à l’aide de la clé générée localement.
