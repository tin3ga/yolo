# Creating a Basic Micro-service - project description

## Choice of the base image

The Docker images use node:22-alpine3.18, which is a minimal version of Node.js 22 running on Alpine Linux 3.18. Alpine Linux is known for its small size and reduced attack surface

## Dockerfile directives

`FROM node:22-alpine3.18` : Specifies the base image to use for the Docker image

`WORKDIR /yolo-backend`: Sets the working directory in the Docker container. Created automatically if it does not exist.

`COPY package*.json /yolo-backend`: Copies files from the local file system into the Docker container.

`RUN npm install` : Executes command inside the container

`COPY . .` : Copies all files and directories from the project directory on the host into the current working directory of the Docker image

`EXPOSE 5000` : Informs Docker that the container listens on the specified network ports at runtime.

`CMD ["npm", "start"]` : Defines the default command to run when the container starts.

## Docker-compose

The Docker Compose file defines a multi-service application with three main components: a frontend, a backend, and a MongoDB database. It also sets up two separate networks for frontend and backend services, and configures a volume for persistent storage of database data.

- Networks

Consists of frontend and backend networks, Both networks use the bridge driver, which is a standard Docker networking driver that creates a private network internal to the host. Each network is isolated, meaning, for instance, that the frontend network cannot directly communicate with the backend or MongoDB unless explicitly configured to do so.

- Volumes

A named volume - mongodata is defined to be used by mongodb to persist data.

## Running the applications

- Start the services

`docker compose up`

- stop services and clean up

`docker compose down`

## Good practices

i. Docker image versioning using Semantic Versioning

SemVer is utilized in the specification of the Docker images for both the frontend and backend services. This makes it easier to track which versions of software are in testing, production, or development environments. It facilitates smoother CI/CD pipelines.

ii. Service Segregation with Networks

Using separate networks for the frontend and backend ensures that components are isolated and only those that need to communicate with each other can do so. This reduces the attack surface and minimizes network traffic overhead.

iii. Use of Environment Variables

Environment variables like MONGODB_URI are set up in the backend service, this decouples configuration details from code, allowing for more flexible deployments and configurations without the need for code changes.

## Screenshots of deployed images on DockerHub

![dockerhub-screenshot](https://raw.githubusercontent.com/tin3ga/yolo/master/images/Screenshot%20from%202024-05-04%2021-45-33.png)
![dockerhub-screenshot](https://raw.githubusercontent.com/tin3ga/yolo/master/images/Screenshot%20from%202024-05-04%2021-45-05.png)

