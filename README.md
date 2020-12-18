# Selfhosted

Selfhosted is a collection of Ansible playbooks I personally use to manage my own home server. I recently started studying how Ansible works (like 2 hours ago lol) so I wanted to migrate my whole home server setup (which was docker-compose based) to Ansible.

## Installation

In order to run ansible you need to have it installed first. If you are using Windows (like me) I personally recommend using WSL2.0 because Ansible doesn't work on Windows.

- First you need to manually install the operative system. I'm using Debian 10 Buster, some playbooks will not work on other operative systems unless you adapt some parameters.

- Python installed on the server.

- Ssh access to the server, I recommend adding your ssh key to `~/.ssh/authorized_keys` but you can also login using username/password. Check Ansible documentation how to do it.

- Modify `inventories/hosts` and `config/system.yml` to fit your needs.

Then you can execute the playbook. This is the default syntax, where `inventory_tag` is the tag you have defined in `inventories/hosts`, or `all` if you want to run the playbook in all your servers.

```bash
ansible-playbook -i inventories -l <inventory_tag> services.yml
```

Example:

```bash
ansible-playbook -i inventories -l homeserver services.yml
```

## Install a single service

You can also install a single service by executing:

```bash
ansible-playbook -i inventories -l homeserver services/docker.yml
```

### Using WSL

If you use WSL you will see this warning when running a playbook:

```bash
[WARNING]: Ansible is being run in a world writable directory (/any/directory), ignoring it as an ansible.cfg source. For more information see https://docs.ansible.com/ansible/devel/reference_appendices/config.html#cfg-in-world-writable-dir
```

To get rid of it you can apply this little hack:

```bash
export ANSIBLE_CONFIG=$(pwd)/ansible.cfg
```

## Contributing

Contributions are always welcome!
