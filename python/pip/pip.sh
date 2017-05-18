#! /bin/bash

clear
echo -e ".......\n安装PIP"
sleep 2
curl -sSL https://bootstrap.pypa.io/get-pip.py|sudo python

echo -e ".......\n安装easy_install"
sleep 2
curl -sSL https://bootstrap.pypa.io/ez_setup.py|sudo python

