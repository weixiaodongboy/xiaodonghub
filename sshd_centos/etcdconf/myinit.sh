#!/bin/bash

/usr/sbin/sshd -D
./startup.sh hello
./deploy.sh
