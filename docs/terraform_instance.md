# Infrastructure AWS déployée avec Terraform

## Objectif

Déployer une instance EC2 sur AWS de façon entièrement automatisée avec Terraform, dans un environnement sécurisé (VPC, sous-réseau, pare-feu et SSH).

---

## Ressources créées

| Type              | Nom                    |
|-------------------|------------------------|
| VPC               | devops-vpc             |
| Subnet public     | devops-subnet          |
| Internet Gateway  | devops-igw             |
| Route Table       | devops-rt              |
| Security Group    | ssh-only-sg            |
| EC2 Instance      | DevOps-Instance        |

---

## Sécurité

- Port SSH (22) uniquement ouvert
- Instance dans un VPC privé
- Attribution automatique d’IP publique via le subnet
- Toutes les clés d’accès sont dans un fichier "terraform.tfvars" **non versionné**

---

## Commandes utilisées

```bash
terraform init
terraform plan
terraform apply
```

## Notes

- L’AMI utilisée est Ubuntu 22.04 : ami-007c433663055a1cc (disponible sur https://cloud-images.ubuntu.com/locator/ec2/)
- Région : Paris (eu-west-3)
- Le VPC est entièrement défini dans main.tf pour simuler un environnement d’entreprise

## Capture d’écran
Fournie dans le dossier /captures/

## Fichiers liés

- infra-terraform/main.tf → Déploiement complet
- infra-terraform/variables.tf → Variables d'accès AWS
- infra-terraform/outputs.tf → IP publique de l'instance
- infra-terraform/terraform.tfvars → Clés privées (non commit)

## Résultat attendu

- Instance EC2 créée dans un environnement réseau personnalisé
- Connexion SSH possible (après ajout de clé publique)


