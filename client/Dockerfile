# STAGE 1 : Building App

FROM node:22-alpine3.18 as builder

# Set the working directory
WORKDIR /yolo-frontend

# Copy the package.json file
COPY package*.json /yolo-frontend

# Install the dependencies
RUN npm install

# Copy the rest of the code
COPY . .

# Run the build script defined in package.json.
RUN npm run build

# STAGE 2: Create the production image

FROM nginx:latest

# Copy the static content from the build directory of the first stage to the appropriate directory in the Nginx container.
COPY --from=builder /yolo-frontend/build /usr/share/nginx/html

# Expose port 80 on the container
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]