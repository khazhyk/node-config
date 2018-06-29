

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

rm -r /etc/puppetlabs/code/environments/production
git clone https://github.com/khazhyk/node-nacl production

# copy /etc/puppetlabs/puppet/keys over
```

For first run, manually run cron-puppet contents


## Hiera nonsense

This will generate hiera keys, but the stuff in this repo is already encrypted
Copy over the pre-made keys at /etc/puppetlabs/puppet/keys/
