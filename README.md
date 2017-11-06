

## Bootstrapping
[See also](https://docs.puppet.com/puppet/3.8/install_debian_ubuntu.html#step-1-enable-the-puppet-package-repository)

```bash
wget https://apt.puppetlabs.com/puppet5-release-xenial.deb
sudo dpkg -i puppet5-release-xenial.deb
sudo apt update

# Only if setting up a master.
sudo apt install puppetserver

sudo apt install puppet-agent  # make sure this is using puppetlabs repo

rm /etc/puppetlabs/code/environments/production
git clone https://github.com/khazhyk/node-nacl production
```
