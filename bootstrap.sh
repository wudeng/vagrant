#!/bin/bash

## login key
sudo echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC136qXZbULTRmbYnwefTIVNje+03q8RS3GM+toy53afjlRPevbYqPkkFpN6eesVrAfXjOiNjpbpQgJaEt9YXnUbBUWSpPh58K8a0ZIJexAuMHSnXtNACsQPyh6eoZYNMqohz0U82Eo+98/DShS1/0rEEgzEAilozEYr+GhGb8ICMc3KfHsEjMsjb3+xg5kuZgA9Kfz4Ze82kDLLj+gKalLc+YADbgWagFZbPSIT2FM4kEXT8gRNnQO06eOmvHTan4/ZGRXADkJm4cN6eAaeINRh1eoxg7jIIB0NBi4MtC8hMSTL63Knf9B8d56CbgPga7lHggEfSg8Z5G/AhatMYTx wudeng@s3-10-80-0-160" >> /home/ubuntu/.ssh/authorized_keys

## git alias
git config --global user.name 'wudeng'
git config --global user.email 'wudeng256@gmail.com'
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit 
git config --global alias.st status 
git config --global core.filemode false
git config --global push.default simple
git config --global core.autocrlf input
git config --global core.editor "vim"


## timezone
sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

## source list
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo tee /etc/apt/sources.list > /dev/null << EOF
deb http://mirrors.aliyun.com/ubuntu/ xenial main
deb-src http://mirrors.aliyun.com/ubuntu/ xenial main

deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main

deb http://mirrors.aliyun.com/ubuntu/ xenial universe
deb-src http://mirrors.aliyun.com/ubuntu/ xenial universe
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates universe

deb http://mirrors.aliyun.com/ubuntu/ xenial-security main
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main
deb http://mirrors.aliyun.com/ubuntu/ xenial-security universe
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security universe
EOF

## install
sudo apt update
sudo apt install build-essential lrzsz ack-grep mongodb libreadline-dev rlwrap autoconf cmake openssl libssl-dev redis-server libncursesw5 libncursesw5-dev -y
