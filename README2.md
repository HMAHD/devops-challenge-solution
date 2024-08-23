DevOps Challenge Apps

![Project Banner](https://via.placeholder.com/1200x300?text=DevOps+Challenge+Apps)

📌 Table of Contents

- [Overview](-overview)
- [Features](-features)
- [Prerequisites](-prerequisites)
- [Installation](-installation)
- [Usage](-usage)
- [Configuration](-configuration)
- [Troubleshooting](-troubleshooting)
- [Contributing](-contributing)
- [License](-license)
- [Contact](-contact)

🚀 Overview

This project demonstrates a comprehensive DevOps setup using Docker, Nginx, and PostgreSQL on an AWS EC2 instance. It showcases best practices in containerization, reverse proxy configuration, and cloud deployment.

✨ Features

- 🐳 Dockerized applications (Web and API)
- 🔄 Nginx reverse proxy
- 🗃️ PostgreSQL database
- ☁️ AWS EC2 deployment
- 🔧 VS Code remote development setup
- 🔄 Automated daily updates

📋 Prerequisites

- AWS Account
- Docker and Docker Compose
- Visual Studio Code
- Git

🛠 Installation

1. Clone the repository:

   git clone https://github.com/busbud/devops-challenge-apps.git
   cd devops-challenge-apps

2. Set up EC2 instance:

   - Launch an EC2 instance in your AWS account
   - Configure security groups to allow necessary inbound traffic

3. Install required software on EC2:

   chmod +x setup.sh
   ./setup.sh

4. Configure VS Code for remote development:
   - Install the Remote SSH extension in VS Code
   - Connect to your EC2 instance using the command:
     SSH -i /path/to/your-key.pem ec2-user@your-instance-public-dns
5. Set up Docker Compose:
   - Create `docker-compose.yaml` in the project root
   - Add services for web, api, db, and nginx

🖥 Usage

1. Build and start the services:

   docker-compose up --build -d

2. Access the applications:

   - Web: `http://your-ec2-public-ip`
   - API: `http://your-ec2-public-ip/api`

3. Update daily content:
   - The `update_content.sh` script runs daily at 2:00 AM to update content

⚙️ Configuration

Nginx Configuration

Create `nginx.conf` in the project root:

events {
worker_connections 1024;
}

http {
upstream web {
server web:3000;
}

    upstream api {
        server api:4000;
    }

    server {
        listen 80;
        server_name web.example.com;

        location / {
            proxy_pass http://web;
        }
    }

    server {
        listen 80;
        server_name api.example.com;

        location / {
            proxy_pass http://api;
        }
    }

}

Docker Compose Configuration

version: '3'
services:
web:
build: ./web
ports: - "3000:3000"
api:
build: ./api
ports: - "4000:4000"
db:
image: postgres:13
environment:
POSTGRES_DB: yourdbname
POSTGRES_USER: youruser
POSTGRES_PASSWORD: yourpassword
nginx:
image: nginx:latest
ports: - "80:80"
volumes: - ./nginx.conf:/etc/nginx/nginx.conf:ro
depends_on: - web - api

🔍 Troubleshooting

- Issue: Container not starting
  Solution: Check Docker logs using `docker logs <container_name>`

- Issue: Nginx configuration errors
  Solution: Validate Nginx config with `nginx -t`

🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.


📞 Contact

H.M. AKASH HASENDRA - [me@akash.us.kg](mailto:me@akash.us.kg)

Project Link: [https://github.com/hmahd/devops-challenge-apps](https://github.com/hmahd/devops-challenge-apps)

---

<p align="center">Made with ❤️ by H.M. AKASH HASENDRA</p>
