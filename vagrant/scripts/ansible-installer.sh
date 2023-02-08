sudo apt update && apt install -y python3 python3-pip
python3 -m pip install ansible==2.9.0
ansible-galaxy collection install -r /opt/ansible/requirements.yml