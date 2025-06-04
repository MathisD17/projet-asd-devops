# Supervision – Prometheus & Grafana

## Objectif

Mettre en place une supervision de base avec Prometheus pour la collecte des métriques, et Grafana pour la visualisation.

---

## Structure des fichiers

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
│       └── deploy_grafana.yml
```

---

## Prometheus

- Image Docker basée sur `prom/prometheus:latest`
- Fichier de configuration `prometheus.yml` défini localement
- Container exposé sur le port `9090`

---

## Grafana

- Image Docker basée sur `grafana/grafana-oss:latest`
- Pas de config avancée dans le Dockerfile
- Interface exposée sur le port `3000`
- Login par défaut : admin / admin

---

## Connexion Grafana à Prometheus

1. Accéder à Grafana : `http://<IP_EC2>:3000`
2. Aller dans : "Configuration" > "Data sources" > "Add data source"
3. Sélectionner Prometheus
4. Renseigner l'URL : `http://localhost:9090`
5. Sauvegarder et tester

---

## Dashboard de test

1. Aller dans : "+" > "Dashboard" > "Add new panel"
2. Cliquer sur l'onglet "Code" (à côté de "Builder")
3. Saisir la requête suivante :

```promql
up
```

4. Exécuter la requête avec "Run queries"
5. Appliquer la visualisation pour voir l'état des targets

---

## Accès web

- Prometheus : `http://<IP_EC2>:9090`
- Grafana : `http://<IP_EC2>:3000`
