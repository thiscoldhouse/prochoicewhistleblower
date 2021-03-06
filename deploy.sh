#!/bin/bash
# Run on local machine

set -e

sshuser=$1
reponame="https://github.com/thiscoldhouse/prochoicewhistleblower.git"

prodpath="/var/www/prolifewhistleblower.org"

localdeploy=thiscoldhousedeploy
server="172.104.24.137"

cd /tmp
git clone $reponame $localdeploy

echo "Beaming code to the servers"

echo "First, removing old code"
ssh -t aleruiz@$server "rm -rf /var/www/prolifewhistleblower.org/* "
echo "Sending new code"
scp -r /tmp/$localdeploy/* aleruiz@$server:/var/www/prolifewhistleblower.org
echo "Cleaning up"
rm -rf $localdeploy
cd -
echo "Done"
