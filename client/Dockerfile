# Use an existing image as a base
FROM node:22-alpine3.18

# Set the working directory
WORKDIR /yolo-frontend

# Copy the package.json and package-lock.json files
COPY package*.json /yolo-frontend

# Install the dependencies
RUN npm install

# Copy the rest of the code
COPY . .

# Expose the port that the app listens on
EXPOSE 3000

# Define the command to run the app
CMD ["npm", "start"]