# Use an official Node.js runtime as the base image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package.json package-lock.json ./

# Install project dependencies
RUN npm ci --production

# Copy the entire project directory to the container
COPY . .

# Run Prisma migration and generate Prisma client
RUN npx prisma migrate deploy
RUN npx prisma generate

# Expose a port if required by your Node.js application
EXPOSE 80

# Specify the command to run your application
CMD ["node", "api/app.js"]
