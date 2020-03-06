#!/bin/sh

rsync -avz --copy-links --exclude '*~'  --exclude .git --exclude .gitignore --exclude .editorconfig --exclude .vagrant --exclude host $*
