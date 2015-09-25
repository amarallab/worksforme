apt-get update -qq
apt-get install -qqy \
  python-pip python-dev git \
  build-essential linux-image-extra-$(uname -r) \
  libdb-dev libz-dev libreadline-dev \
  libncursesw5-dev libssl-dev libgdbm-dev \
  libsqlite3-dev libbz2-dev liblzma-dev \
  libc6-dev tk-dev

PYENV_INSTALLER="https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer"
curl -sSL $PYENV_INSTALLER | su vagrant -s /bin/bash

echo 'LS_COLORS=$LS_COLORS:"di=0;35:"' >> ~/.bashrc # because I hate dark blue.

cat <<'EOF' >> /home/vagrant/.bashrc
LS_COLORS=$LS_COLORS:"di=0;35:"

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

cd /vagrant
EOF

#su - vagrant -c '$HOME/.pyenv/bin/pyenv install 2.7.10'
#su - vagrant -c '$HOME/.pyenv/bin/pyenv global 2.7.10'

su - vagrant -c '$HOME/.pyenv/bin/pyenv install 3.5.0'
su - vagrant -c '$HOME/.pyenv/bin/pyenv global 3.5.0'

su - vagrant -c '$HOME/.pyenv/shims/pip install --upgrade pip'
su - vagrant -c '$HOME/.pyenv/shims/pip install -r /vagrant/requirements.txt'
