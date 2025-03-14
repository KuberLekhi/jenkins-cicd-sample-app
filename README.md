Jenkins CI/CD Sample App

This is a simple Node.js app to demonstrate a CI/CD pipeline using Jenkins.

Setup Instructions

1️⃣ Clone the Repository

git clone https://github.com/your-username/jenkins-cicd-sample-app.git
cd jenkins-cicd-sample-app

2️⃣ Install Dependencies

npm install

3️⃣ Run the App Locally

node app.js

4️⃣ Configure CI/CD Pipeline

Follow the build steps for Jenkins setup and deployment.

5️⃣ Access the App

http://<EC2-PUBLIC-IP>:3000

Notes

Ensure port 3000 is open in your EC2 security group.

The app uses pm2 to keep running in the background.

Build Steps (build-steps.md)

1️⃣ Install Node.js and PM2 on EC2

curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
npm install -g pm2

2️⃣ Pull the Latest Code

cd /var/lib/jenkins/workspace/A
git pull origin main

3️⃣ Install Dependencies

npm install

4️⃣ Restart the Application with PM2

pm2 restart myapp || pm2 start app.js --name myapp
pm2 save

5️⃣ Verify Deployment

pm2 list

