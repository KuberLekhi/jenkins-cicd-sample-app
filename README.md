# Jenkins CI/CD Sample App

This is a simple Node.js app to demonstrate a CI/CD pipeline using Jenkins.

## Deployment Steps

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/your-username/jenkins-cicd-sample-app.git
cd jenkins-cicd-sample-app
```

### 2️⃣ Install Dependencies
```bash
npm install
```

### 3️⃣ Run the App Locally
```bash
node app.js
```

### 4️⃣ Deploy to EC2 via Jenkins

#### **Jenkins Configuration**
- Add this repository as a **Jenkins pipeline project**.
- Set up a pipeline to pull code and deploy to EC2.

#### **Manual Deployment (Without Jenkins)**
- Copy the project to your EC2 instance:
  ```bash
  scp -r * ubuntu@<EC2-PUBLIC-IP>:/home/ubuntu/app
  ```
- SSH into EC2:
  ```bash
  ssh ubuntu@<EC2-PUBLIC-IP>
  ```
- Run the startup script:
  ```bash
  bash /home/ubuntu/app/scripts/start.sh
  ```

### 5️⃣ Access the App
- Open in a browser:
  ```
  http://<EC2-PUBLIC-IP>:3000
  ```

## Notes
- Ensure **port 3000** is open in your EC2 security group.
- The app uses `pm2` to keep running in the background.

---
