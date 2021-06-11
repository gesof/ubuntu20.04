#!/usr/bin/env bash

#docker build .
docker run -d -P --name ubuntu_sshd

docker port ubuntu_sshd 22
#0.0.0.0:32774

ssh root@localhost -p 32774
# Password is `indig0!`
