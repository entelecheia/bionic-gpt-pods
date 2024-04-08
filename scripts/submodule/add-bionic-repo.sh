#! /bin/bash

# Add the Bionic repository as a submodule, if not already present
if [ ! -d "bionic-gpt" ]; then
    git submodule add https://github.com/bionic-gpt/bionic-gpt.git
    echo "Bionic repository added as a submodule."
else
    echo "Bionic repository already present as a submodule."
fi
