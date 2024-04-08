#! /bin/bash

# Init the Bionic repository
if [ ! -d "bionic-gpt/.git" ]; then
    git submodule init
    git submodule update
    echo "Bionic repository initialized and updated."
else
    echo "Bionic repository already initialized and updated."
fi
