

## Bootstrapping
[See also](https://docs.puppet.com/puppet/3.8/install_debian_ubuntu.html#step-1-enable-the-puppet-package-repository)

```bash
hostname <hostname>
cat <hostname> > /etc/hostname

wget https://apt.puppetlabs.com/puppet5-release-xenial.deb  # 16.04 it's xenial, for 18 it's bionic
sudo dpkg -i puppet5-release-xenial.deb
sudo apt update

# Only if setting up a master.
# sudo apt install puppetserver

sudo apt install puppet-agent  # make sure this is using puppetlabs repo

# get r10k
# 
/opt/puppetlabs/puppet/bin/gem install r10k

# setup r10k config
mkdir /etc/puppetlabs/r10k
cat <<YAML > /etc/puppetlabs/r10k/r10k.yaml
:cachedir: '/var/cache/r10k'

:sources:
  :khazhyk:
    remote: 'https://github.com/khazhyk/node-config'
    basedir: '/etc/puppetlabs/code/environments'

YAML

# copy /etc/puppetlabs/puppet/keys over

# run cron-puppet contents once

```

For first run, manually run cron-puppet contents


## Hiera nonsense

This will generate hiera keys, but the stuff in this repo is already encrypted
Copy over the pre-made keys at /etc/puppetlabs/puppet/keys/
