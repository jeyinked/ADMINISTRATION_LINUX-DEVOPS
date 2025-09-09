
# 🔥 Simple Linux Firewall (iptables)

Un petit script bash pour configurer un firewall basique avec **iptables**.  
Il met en place une politique de sécurité stricte : tout est bloqué par défaut, sauf quelques services essentiels.

---

## 🚀 Fonctionnalités

- Réinitialise les règles existantes avant d’appliquer les nouvelles.
- Politique par défaut :
  - **INPUT** (entrées) → DROP
  - **FORWARD** (transit) → DROP
  - **OUTPUT** (sorties) → ACCEPT
- Autorise :
  - Connexions déjà établies
  - Loopback (`127.0.0.1`)
  - **SSH** (22)
  - **HTTP** (80) et **HTTPS** (443)
  - **ICMP** (ping)

---

## 📦 Installation

Clonez ce dépôt et placez le script où vous voulez (ex. `/usr/local/bin/`).

```bash
git clone https://github.com/votre-pseudo/simple-firewall.git
cd simple-firewall
chmod +x firewall.sh
```

## Vérification des régles
```bash
sudo iptables -L -v -n
```
