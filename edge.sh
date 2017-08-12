#!/bin/bash

# Does the user want the latest version
if [ -z "$EDGE" ]; then
  echo "Bleeding edge not requested"
else
  echo "Bleeding edge has been requested"
  apt-get install -qy git
  rm -rf /opt/sickrage
  git clone https://github.com/SickRage/SickRage.git /opt/sickrage
  cd /opt/sickrage
  git checkout master
  git checkout develop
  cd /
  chown -R nobody:users /opt/sickrage
  pip install -r /opt/sickrage/requirements.txt
fi
