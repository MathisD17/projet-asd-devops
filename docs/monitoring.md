# Supervision avec Prometheus, Grafana et Node Exporter

## Objectif

Mettre en place une supervision complète de l’instance EC2 avec :

- **Prometheus** : collecte des métriques
- **Grafana** : visualisation des métriques
- **Node Exporter** : exposition des statistiques système (CPU, RAM, Disque, Réseau)

## Structure du projet liée à la supervision

```
monitoring/
├── prometheus/
│   ├── Dockerfile
│   └── prometheus.yml
└── grafana/
    └── Dockerfile
```

> Le déploiement est automatisé via Ansible :
> - `deploy_prometheus.yml`
> - `deploy_grafana.yml`
> - `deploy_node_exporter.yml` avec le rôle `node_exporter`

## 1. Node Exporter

Node Exporter est installé sur l’EC2 pour exposer les métriques système sur le port 9100.
Il est géré comme un service `systemd` lancé automatiquement.

Le rôle Ansible dédié télécharge le binaire, configure le service, et l’active.

## 2. Prometheus

Prometheus est conteneurisé via Docker.
Il est configuré pour collecter ces métriques exposées par Node Exporter.

L’image est personnalisée à l’aide d’un `Dockerfile` pour inclure le fichier de configuration `prometheus.yml`.
Le service est exposé sur le port 9090.

## 3. Grafana

Grafana est également lancé via Docker et accessible sur le port 3000.
Il permet de visualiser les métriques collectées par Prometheus à travers des dashboards interactifs.

L’ajout de Prometheus comme source de données se fait dans l’interface Grafana, en renseignant l’URL de Prometheus.

## Accès aux services

| Service        | Port  | URL                            |
|----------------|-------|--------------------------------|
| Prometheus     | 9090  | http://<IP_EC2>:9090           |
| Grafana        | 3000  | http://<IP_EC2>:3000           |
| Node Exporter  | 9100  | http://<IP_EC2>:9100/metrics   |

## Sécurité

- Les ports 3000, 9090 et 9100 sont ouverts dans le groupe de sécurité AWS de l’EC2.
- Le mot de passe par défaut de Grafana a été modifié après installation.
- Node Exporter tourne comme un service sécurisé, redémarré automatiquement avec le système.
