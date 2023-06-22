#!/bin/env bash
#shellcheck disable=2059

## Definitions

# Define playbook path
playbook_path="./main.yml"

# Define inventory path
inventory_path="./inventory.yml"

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
  fi
}


# Function to check if inventory.yml exists
function check_and_create_file() {
  local inventory_path="${1}"

  if [[ ! -f "${inventory_path}" ]]; then
    printf "${color_red}Inventory file does not exist.${color_reset} ${color_yellow}Creating it...${color_reset}\n"
    cp ./EXAMPLE-inventory.yml "${inventory_path}"
    printf "${color_yellow}Please edit inventory file:\t${color_green}%s${color_reset}\n" "${inventory_path}"
    exit 1
  fi
}


# Function to run Ansible playbook
function run_ansible_playbook(){
  local playbook_path="${1}"
  local inventory_path="${2}"
  printf "${color_green}Running Playbook...${color_reset}\n"
  printf "Inventory:\t${color_yellow}%s${color_reset}\n" "${inventory_path}"
  printf "Playbook :\t${color_yellow}%s${color_reset}\n\n" "${playbook_path}"
  ansible-playbook --ask-become-pass --inventory="${inventory_path}" "${playbook_path}"
}


## Main

# Check if Ansible is installed
check_ansible_installed

# Check if inventory exists
check_and_create_file "${inventory_path}"

# Run Ansible playbook
run_ansible_playbook "${playbook_path}" "${inventory_path}"
