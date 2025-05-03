# Ansible configuration skeleton
It is an implementation of ansible best practice skeleton \
described here https://web.archive.org/web/20240331135623/https://books.stuartherbert.com/putting-ansible-to-work/organising-your-ansible-files.html

## Preparation

- on rocky linux 8 only!
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

- in docker
```bash
docker build . -t ansible-win
```

## Installation steps

- Run in docker
```bash
docker run -ti --rm -v .:/source --network host --user root --entrypoint bash ansible-win
cd /source
```

- Run in docker remote host (docker cli on mac os)
```bash
docker volume create ansible-win-source
docker create -v ansible-win-source:/data --name ansible-source-helper busybox true
docker cp . ansible-source-helper:/data
docker run -ti --rm -v ansible-win-source:/source --network host --user root --entrypoint bash ansible-win
cd /source
```

- Installation, repare, update servers:
```bash
source ~/.venv-win-ansible/bin/activate
export KRB5CCNAME=./tmp_krb_cache
export KRB5_CONFIG=./win_krb5.conf

kinit -l 45m labadmin@LAB.DEVLTD.NET

klist

ansible-playbook -vvv playbooks/all.yaml -i inventory/hosts.yaml -u "labadmin@LAB.DEVLTD.NET" --tags ping
```

# Ansible pipeline steps

- [X] ping hosts
