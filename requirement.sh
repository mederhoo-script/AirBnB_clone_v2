#!/usr/bin/env bash
# requirement for fabric

sudo apt update -y
sudo apt install python3 -y
sudo apt install python3-pip -y

pip3 uninstall Fabric

sudo apt-get install libffi-dev -y
sudo apt-get install libssl-dev -y
sudo apt-get install build-essential -y
sudo apt-get install python3.4-dev -y
sudo apt-get install libpython3-dev -y

pip3 install pyparsing
pip3 install appdirs
pip3 install setuptools==40.1.0
pip3 install cryptography==2.8
pip3 install bcrypt==3.1.7
pip3 install PyNaCl==1.3.0
pip3 install Fabric3==1.14.post1
