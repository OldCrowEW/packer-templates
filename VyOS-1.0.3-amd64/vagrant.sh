source /opt/vyatta/etc/functions/script-template

# Set up Vagrant.
date | sudo tee /etc/vagrant_box_build_time

# Create the user vagrant with password vagrant
set system login user vagrant authentication plaintext-password vagrant
set system login user vagrant level admin
commit
save

# Install vagrant keys
PUBLIC_KEY=$(curl -s 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub')
TYPE=$(echo $PUBLIC_KEY | awk '{print $1}')
KEY=$(echo $PUBLIC_KEY | awk '{print $2}')
set system login user vagrant authentication public-keys vagrant type $TYPE
set system login user vagrant authentication public-keys vagrant key $KEY
commit
save
