# Using Node.js runtime as a base image
FROM node:19 as builder

# Setting up working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory inside the container
COPY package*.json ./

# Install dependencies using npm to destination folder
RUN npm install

# Copy the entire codebase to the working directory /app inside the container
COPY . .

# multi-stage build process to reduce the size of the final image
FROM node:19 as prod

# Setting up working directory inside the container
WORKDIR /app/prodapp

# Copy build data from builder /app to the working directory inside the container
COPY --from=builder /app /app/prodapp

# Expose the port 3000 application server is running on
EXPOSE 3000

# Run the application using npm i.e program used to run application prefix
ENTRYPOINT ["npm"]

# Build the React app commands used with prefix to run application
CMD [ "run", "dev"]

