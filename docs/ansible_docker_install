# Documentation – Installation de Docker avec Ansible

## Objectif

Automatiser l'installation de Docker sur une instance EC2 Ubuntu à l'aide d'Ansible.

---

## Structure des fichiers

```
ansible/
├── inventories/
│   └── hosts.ini               # Inventaire contenant l'adresse IP publique de l'EC2
├── playbooks/
│   └── install_docker.yml      # Playbook Ansible pour installer Docker
```

---

## Inventaire – `hosts.ini`

Fichier : `ansible/inventories/hosts.ini`

```ini
[dev]
<ip_public_ec2> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/terraform-key.pem
```

---

## Playbook – `install_docker.yml`

Fichier : `ansible/playbooks/install_docker.yml`

```yaml
---
- name: Installation de Docker sur EC2 Ubuntu
  hosts: dev
  become: yes
  tasks:
    - name: Mettre à jour les paquets
      apt:
        update_cache: yes
        upgrade: dist

    - name: Installer les dépendances
      apt:
        name:
          - apt-transport-https
          - ca-certificates
          - curl
          - gnupg
          - lsb-release
        state: present

    - name: Ajouter la clé GPG Docker
      ansible.builtin.apt_key:
        url: https://download.docker.com/linux/ubuntu/gpg
        state: present

    - name: Ajouter le dépôt Docker
      apt_repository:
        repo: deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable
        state: present

    - name: Installer Docker Engine
      apt:
        name: docker-ce
        state: latest
        update_cache: yes

    - name: Démarrer et activer Docker
      systemd:
        name: docker
        enabled: yes
        state: started
```

---

## Exécution du playbook

Se placer dans le dossier `ansible/` et lancer :

```bash
ansible-playbook -i inventories/hosts.ini playbooks/install_docker.yml
```

---

## Vérification manuelle

Connexion SSH à l’instance EC2 :

```bash
ssh -i ~/.ssh/terraform-key.pem ubuntu@<ip_public_ec2>
```

Commandes testée :

```bash
docker --version
sudo docker run hello-world
```

---
