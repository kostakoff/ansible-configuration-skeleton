# Ansible configuration skeleton
It is an implementation of ansible best practice skeleton \
described here https://web.archive.org/web/20240331135623/https://books.stuartherbert.com/putting-ansible-to-work/organising-your-ansible-files.html

## Preparation

- on rocky linux only!
```bash
# install linux dependancies
dnf install -y python2 python2-devel python2-virtualenv krb5-workstation krb5-devel gcc

# create and load virtualenv with python2
virtualenv-2 --python=python2 ~/.venv-win-ansible
source ~/.venv-win-ansible/bin/activate

# install kerberos and ansible
pip install -r ./requirments.txt

# install ansible collections for windows
ansible-galaxy collection install ansible.windows chocolatey.chocolatey

# run ansible smoke test
ansible all -i "localhost," -c local -m shell -a 'echo hello world'
```

## Installation steps

- Installation, repare, update servers:
```bash
export KRB5CCNAME=./tmp_krb_cache
export KRB5_CONFIG=./win_krb5.conf

kinit -l 45m sysadmin@LOCAL

klist

ansible-playbook -vvv playbooks/all.yaml -i inventory/hosts.yaml -u "sysadmin@LOCAL" --tags ping
```

# Ansible pipeline steps

- [X] ping hosts
