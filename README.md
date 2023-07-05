# Ansible-Update

[![ansible-lint](https://github.com/ConnerWill/Ansible-Update/actions/workflows/ansible-lint.yml/badge.svg?event=push)](https://github.com/ConnerWill/Ansible-Update/actions/workflows/ansible-lint.yml)

Ansible Playbook To Update Linux Servers

## Usage

**Run this playbook using `run.sh` script**

```bash
cd scripts/
./run.sh
```

**Run this playbook manually**

```bash
ansible-playbook -i ./inventory.yml ./main.yml --ask-become-pass
```

## Inventory

**Example inventory file**

```yml
all:
  hosts:
    server1:
      ansible_host: 192.168.2.1
      ansible_user: username
      ansible_ssh_private_key_file: ~/.ssh/ssh_key
    server2:
      ansible_host: 192.168.2.2
      ansible_user: username
      ansible_ssh_private_key_file: ~/.ssh/ssh_key
    server3:
      ansible_host: example.com
      ansible_user: username
      ansible_ssh_private_key_file: ~/.ssh/ssh_key
    localhost:
      ansible_host: localhost
      ansible_user: username
      ansible_ssh_private_key_file: ~/.ssh/ssh_key
```

## Supported Linux Distribution Families

* Arch
* Debian
* RedHat
* openSUSE
