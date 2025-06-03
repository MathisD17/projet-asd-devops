# Déploiement de Nginx avec Docker et Ansible

## Objectif
Déployer automatiquement un conteneur Nginx personnalisé sur la machine EC2.

---

## Structure des fichiers

```
projet-asd-devops/
├── docker/
│   └── nginx/
│       ├── Dockerfile
│       └── html/
│           └── index.html
├── ansible/
│   ├── inventories/
│   │   └── hosts.ini
│   └── playbooks/
│       └── deploy_nginx.yml
```

---

## Fichiers importants

### Dockerfile (`docker/nginx/Dockerfile`)
```Dockerfile
FROM nginx:latest
COPY ./html /usr/share/nginx/html
```

### index.html (`docker/nginx/html/index.html`)

### Playbook Ansible (`ansible/playbooks/deploy_nginx.yml`)
```yaml
- name: Déploiement du container Nginx
  hosts: dev
  become: yes

  vars:
    nginx_path: /home/ubuntu/nginx

  tasks:
    - name: Créer le dossier nginx sur l'EC2
      file:
        path: "{{ nginx_path }}"
        state: directory
        mode: '0755'

    - name: Copier les fichiers Docker (Dockerfile + html/)
      copy:
        src: "{{ item }}"
        dest: "{{ nginx_path }}/"
        mode: '0644'
      with_fileglob:
        - "../../docker/nginx/*"

    - name: Copier le dossier html/ séparément (récursif)
      copy:
        src: "../../docker/nginx/html"
        dest: "{{ nginx_path }}/"
        mode: '0644'

    - name: Lancer le container Docker Nginx
      docker_container:
        name: nginx-asd
        image: nginx:latest
        state: started
        restart_policy: always
        published_ports:
          - "80:80"
        volumes:
          - "{{ nginx_path }}/html:/usr/share/nginx/html:ro"
```

---

## Commande de déploiement

```bash
ansible-playbook -i inventories/hosts.ini playbooks/deploy_nginx.yml
```

---

## Résultat attendu

Accès à la page WEB del'instance

---
