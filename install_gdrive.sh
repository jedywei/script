#!/bin/bash
# The script will install gdrive-linux-x64 from official github and also install it on /usr/local/bin as gdrive

wget https://github.com/gdrive-org/gdrive/releases/download/2.1.0/gdrive-linux-x64
chmod +x gdrive-linux-x64
sudo mv gdrive-linux-x64 /usr/local/bin
pushd /usr/local/bin; sudo ln -s gdrive-linux-x64 gdrive; popd

