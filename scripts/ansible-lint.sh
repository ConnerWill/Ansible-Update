#!/bin/env bash
#shellcheck disable=2059

## Definitions

# Define playbook path
playbook_path="../main.yml"

color_red='\x1B[0;38;5;196m'
color_green='\x1B[0;38;5;46m'
color_yellow='\x1B[0;38;5;226m'
color_reset='\x1B[0m'


## Functions

# Function to check if Ansible is installed
function check_ansible_installed(){
  if ! command -v ansible &>/dev/null; then
    printf "${color_red}Ansible is not installed.\n${color_yellow}Please install Ansible and try again.${color_reset}\n"
    exit 1
  else
    printf "${color_green}ansible ${color_reset}is installed\n"
  fi
}

# Function to check if ansible-lint is installed
function check_ansiblelint_installed(){
  if ! command -v ansible-lint &>/dev/null; then
    printf "${color_red}ansible-lint is not installed.\n${color_yellow}Please install ansible-lint and try again.${color_reset}\n"
    exit 1
  else
    printf "${color_green}ansible-lint ${color_reset}is installed\n"
  fi
}


# Function to check if inventory.yml exists
function check_playbook_file() {
  local playbook_path="${1}"
  if [[ ! -f "${playbook_path}" ]]; then
    printf "${color_red}Playbook file does not exist:\t${color_reset}${color_yellow}%s${color_reset}\n" "${playbook_path}"
    exit 1
  fi
}


# Function to run Ansible playbook
function run_ansible_lint(){
  local playbook_path="${1}"
  printf "Running:\t${color_green}ansible-lint ${color_yellow}%s${color_reset}\n" "${playbook_path}"
  ansible-lint "${playbook_path}"
}


## Main

# Check if Ansible is installed
check_ansible_installed

# Check if ansible-lint is installed
check_ansiblelint_installed

# Check if playbook exists
check_playbook_file "${playbook_path}"

# Run ansible-lint
run_ansible_lint "${playbook_path}"
