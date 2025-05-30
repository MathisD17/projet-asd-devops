# Accès SSH à l'instance EC2 générée via Terraform

## Objectif

Permettre une connexion sécurisée à l'instance EC2 via une paire de clés SSH générée automatiquement avec Terraform.

## tapes automatisées

### 1. Génération de la clé SSH

Dans le fichier `main.tf` :

```hcl
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "terraform-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}
```

### 2. Attachement de la clé à l'instance EC2

```hcl
resource "aws_instance" "dev" {
  ami                    = "ami-007c433663055a1cc"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]
  key_name               = aws_key_pair.generated_key.key_name

  tags = {
    Name = "DevOps-Instance"
  }
}
```

### 3. Récupération de la clé privée

```bash
terraform output -raw private_key_pem > ~/.ssh/terraform-key.pem
chmod 600 ~/.ssh/terraform-key.pem
```

### 4. Connexion SSH à l'instance

```bash
ssh -i ~/.ssh/terraform-key.pem ubuntu@<ip_public_instance>
```

## Sécurité

- La clé privée n'est pas versionnée.
- Aucun fichier `.pem` n'est visible dans le dépôt Git.
- Le groupe de sécurité n’ouvre que le port 22 (SSH).
- L'utilisateur par défaut est `ubuntu`.

## Résultat

Connexion immédiate et sécurisée en SSH après `terraform apply`.
