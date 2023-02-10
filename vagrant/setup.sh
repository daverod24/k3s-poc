#!/bin/bash
export ANSIBLE_CONFIG_FILE=scripts/vars.yml
ansible-playbook scripts/k3s.yml --syntax-check \
&& vagrant destroy -f \
&& time vagrant up --provision