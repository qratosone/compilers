#!/bin/bash

# Installing the tools
echo "Install tools ..."
sudo yum -y install flex bison glibc.i686

echo "build directory ..."
if ! [ -d /usr/class ];
then
    sudo mkdir /usr/class
fi

sudo chown $USER /usr/class
cd /usr/class
if [ -f package.tgz ];
then
    rm -f package.tgz
fi

wget http://git.jisuan.ren/barty/compiler_mp/raw/9332218b28e2aaa5e53dd9468e259e47623bd46e/package.tgz

if [ -d cs143 ];
then
    rm -rf cs143
fi

tar -xvzf package.tgz

if ! grep -q "export PATH=/usr/class/cs143/cool/bin:$PATH" ~/.bashrc;
then
    echo "export PATH=/usr/class/cs143/cool/bin:$PATH" >> ~/.bashrc
    source ~/.bashrc
fi

if [ -f ~/.bash_aliases ];
then
    . ~/.bash_aliases
fi

echo "Installation complete"
