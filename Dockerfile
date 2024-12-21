# Use a lightweight base image
FROM node:14-alpine

# Set working directory
WORKDIR /app

# Copy necessary files (combine for fewer layers)
COPY package.json server.js index.html ./ 
COPY images ./images

# Install dependencies
RUN npm install

# Set a non-root user for better security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Expose port 3000
EXPOSE 3000

# Set an environment variable (optional)
ENV APP_NAME="MyApp"

# Start the application
CMD ["node", "server.js"]
