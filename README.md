# k3s-poc
NextCloud on K3s with Ansible, Vagrant, Terraform, and Helm

## Overview
This repository provides all the necessary configuration files to spin up a NextCloud environment on K3s. The environment is intended to be used as a starting template for NextCloud deployments, but it is **NOT PRODUCTION READY**.

The setup is done using a combination of Vagrant, Ansible, Terraform, Helm, and NextCloud. The goal is to automate the deployment of NextCloud on K3s, making it easy to get started with a working NextCloud environment.

Technologies Used
Vagrant: Creates a small virtual machine (VM) in VirtualBox, which acts as the server for K3s. The basic Ansible configurations are done here.

Ansible: The playbooks are used to configure the following:

fail2ban for SSH
K3s and Helm installation
NextCloud Helm repository setup
NextCloud deployment based on playbook variables and templates.
Terraform (optional): This tool can be used to manage the infrastructure for the deployment, such as creating and managing virtual machines.

Helm: A package manager for Kubernetes, used to manage and deploy NextCloud in the K3s environment.

NextCloud: A self-hosted file sync and share solution, providing access to your data and files from anywhere.

## Getting Started
To use this repository, you will need to have Vagrant, Ansible, Terraform, and Helm installed on your system.

Clone the repository to your local machine:

```sh
$ git clone https://github.com/daverod24/k3s-poc.git
```
Navigate to the repository directory:

```
$ cd k3s-poc
```

Use Vagrant to spin up the virtual machine:

```
$ vagrant up
```
Use Ansible to run the playbooks:

```
$ vagrant provision
```

```
$ vagrant ssh
```
Once the deployment is complete, access the NextCloud interface in your browser at `http://localhost:80` or `http://<server-ip>:<port>.` The IP and port can be found in the ansible/vars/variables.yml file.


## Configuration
The basic setup can be changed in the ansible/vars/variables.yml file. This is a good starting point for high-level configuration, but it has limitations. If you need to dig deeper into the deployment, you can look into the ansible/templates/chart-values.j2 file or refer to the official repository of the Helm chart.

## Conclusion
With this repository, you can easily deploy NextCloud on K3s, using the power of Vagrant, Ansible, Terraform, and Helm. Whether you're a beginner or an experienced user, this repo provides a starting point for your NextCloud deployments, making it easy to get up and running with a working environment.

### How to use it?
The basic setup can be changed in the ansible/vars/variables.yml file. This is a good starting point for high level configuration but it has limitations. Feel free to dig deeper into the ansible/templates/chart-values.j2 or look for the official repo of the [Helm chart](https://nextcloud.github.io/helm/).