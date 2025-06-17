
# Supervision du système avec Node Exporter

## Objectif

Superviser l’EC2 avec **Node Exporter**, afin de collecter des métriques système (CPU, mémoire, disque, etc.) visibles dans Grafana.

## Déploiement automatisé avec Ansible

Node Exporter a été installé via un **rôle Ansible** exécuté sur la machine de gestion (`terraform-dev`), à l’aide du playbook suivant :

```bash
ansible-playbook -i inventories/hosts.ini playbooks/deploy_node_exporter.yml
```

### Structure utilisée :

```
ansible/
├── playbooks/
│   └── deploy_node_exporter.yml
├── roles/
│   └── node_exporter/
│       ├── tasks/
│       │   └── main.yml
│       └── files/
│           └── node_exporter.service
```

### Tâches automatisées :

- Téléchargement du binaire `node_exporter`
- Déplacement dans `/usr/local/bin/`
- Création du service `systemd`
- Activation et démarrage du service

## Configuration Prometheus

Dans `monitoring/prometheus/prometheus.yml`, une nouvelle cible a été ajoutée :

```yaml
scrape_configs:
  - job_name: 'node_exporter'
    static_configs:
      - targets: ['<IP_EC2>:9100']
```

Le conteneur Prometheus a été redémarré après la modification pour recharger la config.

## Vérification

- Accès à Prometheus : `http://<IP_EC2>:9090`
- Menu : **Status > Target health**
- Vérifier que le job `node_exporter` est **UP**

## Sécurité

- Le port `9100` a été autorisé dans le groupe de sécurité AWS
- Node Exporter s’exécute en tant que service système sur l’EC2
