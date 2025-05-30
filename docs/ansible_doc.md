# Documentation Ansible – Projet DevOps ASD

## Objectif

Utiliser Ansible pour automatiser la configuration de l’instance EC2 provisionnée avec Terraform.

---

## Structure des fichiers

```
ansible/
├── inventories/
│   └── hosts.ini         # Inventaire des hôtes
├── playbooks/
│   └── setup.yml         # Playbook initial pour test de connexion
└── roles/                # (À venir) Rôles Ansible réutilisables
```

---

## Inventaire – hosts.ini

Fichier : ansible/inventories/hosts.ini

```ini
[dev]
<ip_public_ec2> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/terraform-key.pem
```

---

## Playbook – setup.yml

Fichier : ansible/playbooks/setup.yml

```yaml
---
- name: Configuration initiale de la machine EC2
  hosts: dev
  become: yes
  tasks:
    - name: Ping pour test de connexion
      ping:
```

---

## Exécution du playbook

Commande à exécuter depuis le dossier ansible/ :

```bash
ansible-playbook -i inventories/hosts.ini playbooks/setup.yml
```

---

## Résultat attendu

Réponse SUCCESS de la machine EC2 indiquant que la connexion SSH est fonctionnelle et que le playbook peut exécuter des tâches à distance.

---
