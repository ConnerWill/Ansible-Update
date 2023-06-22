# Ansible-Update

Ansible Playbook To Update Linux Servers

## Usage

**Run this playbook using `run.sh` script**

```bash
./run.sh
```

**Run this playbook manually**

```bash
ansible-playbook -i ./inventory.yml ./update-servers.yml --ask-become-pass
```

## Supported Linux Distribution Families

* Arch
* Debian
* RedHat
* openSUSE
