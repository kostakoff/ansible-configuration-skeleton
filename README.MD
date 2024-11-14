# Ansible configuration skeleton
It is an implementation of ansible best practice skeleton \
described here https://web.archive.org/web/20240331135623/https://books.stuartherbert.com/putting-ansible-to-work/organising-your-ansible-files.html

## Installation steps

- Installation, repare, update server:
```bash
ansible-playbook -vvv playbooks/all.yaml -i inventory/hosts.yaml --tags sftpserver
```

# Ansible pipeline steps

- Installing dependancies for proftpd with openssl
- Downloading proftpd sources
- Configurung and building new version of proftpd with sftp module
- Creating group and user for sftp server
- Backup previous version of proftpd server
- Installing new proftpd server
- Creating all necessary sftp mock directories files and scripts
