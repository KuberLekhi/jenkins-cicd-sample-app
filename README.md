Jenkins CI/CD Sample App

This is a simple Node.js app to demonstrate a CI/CD pipeline using Jenkins.

✅ 1. Set Up Jenkins Pipeline with Webhook

Steps:

Create a Freestyle or Pipeline project in Jenkins.

Connect it to your GitHub repository via webhook.

✅ 2. Install Dependencies on EC2 (One-Time Setup)

Steps:

Run the following commands on your EC2 instance only once:

sudo apt update
sudo apt install -y nodejs npm
sudo npm install -g pm2

✅ 3. Jenkins Pipeline Configuration

3.1 Set Workspace Directory

Run the following command to set your workspace directory:

/var/lib/jenkins/workspace/project

➡️ Replace "project" with the name of your Jenkins freestyle project.

3.2 Change Permissions (One-Time Setup)

Ensure Jenkins can run scripts properly by executing:

sudo chown -R ubuntu:jenkins /var/lib/jenkins/workspace
sudo chmod -R 775 /var/lib/jenkins/workspace

✅ 4. Write Build Steps in Jenkins Pipeline

Steps:

Add these commands in the Build Steps of your Jenkins Project:

cd /var/lib/jenkins/workspace/A

# Install dependencies
npm install

# Install only production dependencies (optional)
npm install --only=prod

# Fix security vulnerabilities (optional)
npm audit fix --force

# Run tests before deployment (optional)
npm test

# If your app has a build step (optional)
npm run build

# Restart or start the application using PM2
pm2 restart myapp || pm2 start app.js --name myapp

# Save PM2 process list
pm2 save

✅ 5. Make Sure the App Runs After Restart

5.1 Check PM2 Process

Run the following command to check if PM2 is managing the application:

pm2 list

5.2 Check Logs for Errors

To view logs and troubleshoot issues, use:

pm2 logs myapp

✅ 6. Test the Webhook

Steps:

Make a change in GitHub, commit & push.

Jenkins should trigger automatically, pull new code, and restart the app.

✅ 7. Access the Application

Steps:

Open the app in your browser:

http://EC2-PUBLIC-IP:3000

Important:

✔️ Ensure port 3000 is open in your EC2 security group.

This guide ensures your app runs smoothly with Jenkins, PM2, and GitHub webhooks! 🚀

