#! /bin/bash

if [ ! -z "$REPO_LINK" ]; then
        git clone $REPO_LINK
else
        git clone https://github.com/irfan44/example-android-project.git
fi
