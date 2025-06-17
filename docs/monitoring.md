# Supervision avec Prometheus, Grafana et Node Exporter

## Objectif

Mettre en place une supervision complète de l’instance EC2 avec :
- **Prometheus** pour la collecte des métriques
- **Grafana** pour la visualisation
- **Node Exporter** pour les statistiques système (CPU, RAM, Stockage, Réseau ...)

---

## Structure du projet liée à la supervision

```
projet-asd-devops/
├── monitoring/
│   ├── prometheus/
│   │   ├── Dockerfile
│   │   └── prometheus.yml
│   └── grafana/
│       └── Dockerfile
├── ansible/
│   └── playbooks/
│       ├── deploy_prometheus.yml
│       ├── deploy_grafana.yml
│       └── deploy_node_exporter.yml
│   └── roles/
│       └── node_exporter/
│           ├── tasks/
│           │   └── main.yml
│           └── files/
│               └── node_exporter.service
```

---

## Déploiement

### 1. Node Exporter (EC2)
Installé avec Ansible :
```bash
ansible-playbook -i inventories/hosts.ini playbooks/deploy_node_exporter.yml
```
→ Expose les métriques système sur `:9100`

### 2. Prometheus (Docker)
- Image : `prom/prometheus:latest`
- Config : `prometheus.yml`
- Port : `9090`

Lancement via Docker :
```bash
docker build -t prometheus -f monitoring/prometheus/Dockerfile .
docker run -d --name prometheus -p 9090:9090 prometheus
```

#### Exemple de configuration `prometheus.yml` :
```yaml
scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']

  - job_name: 'node_exporter'
    static_configs:
      - targets: ['<IP_EC2>:9100']
```

### 3. Grafana (Docker)
- Image : `grafana/grafana-oss:latest`
- Port : `3000`

Lancement via Docker :
```bash
docker build -t grafana -f monitoring/grafana/Dockerfile .
docker run -d --name grafana -p 3000:3000 grafana
```

---

## Utilisation Grafana

### Ajouter une datasource Prometheus :
- URL : `http://<IP_EC2>:9090`

### Visualiser les métriques Node Exporter :
- Créer un dashboard
- Requête PromQL simple : `node_filesystem_avail_bytes`

---

## Sécurité

- Le mot de passe du compte par défaut `admin` a été changé
- Les ports `3000`, `9090` et `9100` (Node Exporter) est ouvert via le groupe de sécurité AWS
- Node Exporter tourne comme service `systemd` sur l’EC2
