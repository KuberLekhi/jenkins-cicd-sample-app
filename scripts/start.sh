#!/bin/bash
cd /home/ubuntu/app
npm install
pm2 stop sample-app || true
pm2 start app.js --name sample-app
