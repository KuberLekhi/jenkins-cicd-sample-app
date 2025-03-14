# Jenkins CI/CD Sample App

This is a simple Node.js app to demonstrate a CI/CD pipeline using Jenkins.

## ✅ 1. Set Up Jenkins Pipeline with Webhook

Create a Freestyle or Pipeline project in Jenkins.

Connect it to your GitHub repository via webhook.

## ✅ 2. Install Dependencies on EC2 (One-Time Setup)

Run the following commands on your EC2 instance only once:

sudo apt update
sudo apt install -y nodejs npm
sudo npm install -g pm2

## ✅ 3. Jenkins Pipeline Configuration

Set Workspace Directory

/var/lib/jenkins/workspace/project
(Replace project with the name of your Jenkins freestyle project.)

Change Permissions (One-Time Setup)

This ensures Jenkins can run scripts properly:

sudo chown -R ubuntu:jenkins /var/lib/jenkins/workspace
sudo chmod -R 775 /var/lib/jenkins/workspace

## ✅ 4. Write Build Steps in Jenkins Pipeline

Add these commands in the Build Steps of your Jenkins Project:

cd /var/lib/jenkins/workspace/A
npm install
npm install --only=prod  # Install only production dependencies (optional)
npm audit fix --force    # Fix security vulnerabilities (optional)
npm test                 # Run tests before deployment (optional)
npm run build            # If your app has a build step (optional)
pm2 restart myapp || pm2 start app.js --name myapp
pm2 save

## ✅ 5. Make Sure the App Runs After Restart

Check PM2 Process

pm2 list

Check Logs for Errors

pm2 logs myapp

## ✅ 6. Test the Webhook

Make a change in GitHub, commit & push.

Jenkins should trigger automatically, pull new code, and restart the app.

## ✅ 7. Access the Application

Open the app in your browser:

http://EC2-PUBLIC-IP:3000

Important:

Ensure port 3000 is open in your EC2 security group.

This guide ensures your app runs smoothly with Jenkins, PM2, and GitHub webhooks! 🚀

