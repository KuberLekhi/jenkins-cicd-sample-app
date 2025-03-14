🚀 Jenkins CI/CD Sample App

This is a simple Node.js app demonstrating a CI/CD pipeline using Jenkins.

📌 Setup Instructions

✅ 1. Set Up Jenkins Pipeline with Webhook

Create a Freestyle/Pipeline project in Jenkins.

Connect it to your GitHub repository via a webhook.

✅ 2. Install Dependencies on EC2 (One-time Setup)

sudo apt update
sudo apt install -y nodejs npm
sudo npm install -g pm2

✅ 3. Configure Jenkins Pipeline

Set Workspace Directory:(Replace project with the name of your Jenkins freestyle project.)

/var/lib/jenkins/workspace/project

Change permissions (one-time setup):

sudo chown -R ubuntu:jenkins /var/lib/jenkins/workspace
sudo chmod -R 775 /var/lib/jenkins/workspace

This ensures Jenkins can run scripts properly.

✅ 4. Define Build Steps in Jenkins Pipeline

Add these commands in the Build Steps of the Jenkins project:

cd /var/lib/jenkins/workspace/A
npm install
npm install --only=prod  # Optional: Install only production dependencies
npm audit fix --force    # Optional: Fix security vulnerabilities
npm test                 # Optional: Run tests before deployment
npm run build            # Optional: If your app has a build step
pm2 restart myapp || pm2 start app.js --name myapp
pm2 save

✅ 5. Verify the App Restarted Successfully

Check running processes:

pm2 list

Check logs for errors:

pm2 logs myapp

✅ 6. Test the Webhook

Make a change in GitHub, commit & push.

Jenkins should trigger automatically, pull the new code, and restart the app.

✅ 7. Access the Application 🌍

Open the app in a browser:

http://<EC2-PUBLIC-IP>:3000

Ensure port 3000 is open in your EC2 security group.

🎯 This guide ensures your app runs smoothly with Jenkins, PM2, and GitHub webhooks! 🚀

