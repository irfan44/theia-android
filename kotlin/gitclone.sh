#!/bin/bash

if [ ! -z $1 ] ; then
  echo "Selected project : $1"
  git clone $1 /home/project
else
  echo "Example project"
  git clone https://github.com/irfan44/example-android-project.git /home/project
fi
