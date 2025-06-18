# Documentation Ansible

## Objectif

Automatiser la configuration et le déploiement de services sur l'instance EC2 via Ansible.

## Structure du répertoire

```
ansible/
├── ansible.cfg
├── inventories/
│   └── hosts.ini
├── playbooks/
│   ├── setup.yml
│   ├── install_docker.yml
│   ├── deploy_nginx.yml
│   ├── deploy_prometheus.yml
│   ├── deploy_grafana.yml
│   ├── deploy_node_exporter.yml
│   └── update_prometheus_config.yml
└── roles/
    └── node_exporter/
        ├── files/
        └── tasks/
            └── main.yml
```

## Description des fichiers

- `ansible.cfg` : Fichier de configuration d’Ansible indiquant où se trouvent les rôles personnalisés (ici dans ./roles).
- `inventories/hosts.ini` : Fichier d’inventaire Ansible définissant le groupe d’hôtes [dev] avec l’adresse IP de l’instance EC2 et les paramètres de connexion SSH.
- `playbooks/`
  - `setup.yml` : Playbook pour tester la connexion SSH avec l’hôte distant via un simple ping.
  - `install_docker.yml` : Playbook chargé d’installer Docker sur l’instance EC2. Il ajoute les dépendances, configure le dépôt officiel Docker, installe Docker Engine, puis active le service.
  - `deploy_nginx.yml` : Déploie un container Docker Nginx sur l’EC2. Il copie les fichiers nécessaires (Dockerfile, HTML), prépare le dossier sur la machine distante et lance le container avec le bon port et montage de volume.
  - `deploy_prometheus.yml` : Déploie Prometheus sur l’EC2. Il crée le dossier de travail, copie les fichiers de configuration et Dockerfile, construit une image Docker personnalisée, puis lance le container exposé sur le port 9090.
  - `deploy_grafana.yml` : Déploie Grafana sur l’EC2. Il crée un dossier dédié, copie le Dockerfile, construit une image Docker personnalisée, puis lance un container exposé sur le port 3000.
  - `deploy_node_exporter.yml` : Déploie Node Exporter via un rôle Ansible pour exposer les métriques système de l’EC2 sur le port 9100.
  - `update_prometheus_config.yml` : Met à jour le fichier de configuration de Prometheus (`prometheus.yml`) pour intégrer de nouvelles cibles, puis redémarre le container avec la configuration mise à jour.
- `roles/node_exporter/tasks/main.yml` : Télécharge et installe Node Exporter manuellement, configure un service systemd, puis active et démarre Node Exporter sur l'EC2 pour permettre la collecte de métriques système.

## Déploiement par Ansible

Le déploiement se fait via des commandes `ansible-playbook`, par exemple :

```bash
ansible-playbook -i inventories/hosts.ini playbooks/install_docker.yml
```

Chaque playbook est autonome et exécutable individuellement selon le besoin.

## Prérequis sur la machine locale

- Avoir Ansible installé
- Avoir la clé SSH de l’EC2 en local (référencée dans `hosts.ini`)

