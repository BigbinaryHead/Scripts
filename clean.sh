#!/bin/sh
#comment
echo "Running commands as a root user..."
sudo -- sh -c '
apt-get clean && apt-get auto-clean && apt-get autoremove'

