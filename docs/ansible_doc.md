# Documentation Ansible 

## Objectif

Configurer automatiquement des services sur la machine EC2 à l'aide d'Ansible.

## Structure

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

## Fichier d'inventaire : `inventories/hosts.ini`

```ini
[dev]
<IP_EC2> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa
```

## Commande de test (setup.yml)

```bash
ansible-playbook -i inventories/hosts.ini playbooks/setup.yml
```

## Installation de Docker avec Ansible

```bash
ansible-playbook -i inventories/hosts.ini playbooks/install_docker.yml
```

### Vérification

```bash
docker --version
sudo systemctl status docker
```

## Déploiement des services

- `deploy_nginx.yml` : déploie un container Nginx avec page HTML
- `deploy_prometheus.yml` : expose Prometheus sur port 9090
- `deploy_grafana.yml` : expose Grafana sur port 3000
- `deploy_node_exporter.yml` : installe node_exporter sur l'EC2
