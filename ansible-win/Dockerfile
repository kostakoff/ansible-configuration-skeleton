FROM docker.io/rockylinux:8

USER root

RUN dnf install -y python2 python2-devel python2-virtualenv krb5-workstation krb5-devel gcc

COPY requirements.txt /tmp

RUN virtualenv-2 --python=python2 ~/.venv-win-ansible && \
    source ~/.venv-win-ansible/bin/activate && \
    pip install -r /tmp/requirements.txt && \
    ansible-galaxy collection install ansible.windows chocolatey.chocolatey && \
    ansible all -i "localhost," -c local -m shell -a 'echo hello world'
