# STAGE 1: Building the App

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

FROM node:22-alpine3.18

# Set the working directory
WORKDIR /yolo-frontend

# Copy the static content from the build directory of the first stage
COPY --from=builder /yolo-frontend/build /yolo-frontend/build

# Install a lightweight HTTP server (like serve) to serve the static files
RUN npm install -g serve

# Expose port 3000 on the container
EXPOSE 3000

# Start the HTTP server
CMD ["serve", "-s", "build"]