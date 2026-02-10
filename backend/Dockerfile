# Use the official Node.js 18 image
# https://hub.docker.com/_/node
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json (if available)
COPY backend/package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the rest of the application code
COPY backend/ .

# Create a non-root user
RUN addgroup -g 1001 -S nodejs
RUN adduser -S nextjs -u 1001

# Ensure the nextjs user has the necessary permissions
RUN chown -R nextjs:nodejs /app
USER nextjs

# Expose the port provided by Railway
EXPOSE $PORT

# Start the application
CMD ["npm", "start"]