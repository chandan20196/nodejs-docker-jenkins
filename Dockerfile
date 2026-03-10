# Use NodeJS latest Alpine image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy all app files
COPY . .

# Expose port
EXPOSE 3000

# Start app
CMD ["node", "index.js"]
