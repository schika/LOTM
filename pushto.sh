#!/bin/sh
git config --global user.name "schika"
git config --global user.pass "zk123456"
git add .
git commit -nm "Update"
git push -f origin master
