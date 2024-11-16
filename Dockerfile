# ===== Stage 1: Build the Application =====
FROM node:18-alpine AS builder
# Set the working directory inside the container
WORKDIR /app
# Copy package files to install dependencies
COPY package*.json ./
# Install all dependencies required for building the application
RUN npm install
# Copy all application files into the container
COPY . .
# Build the application
RUN npm run build

# ===== Stage 2: Run the Application =====
FROM node:18-alpine
# Set the working directory inside the container
WORKDIR /app
# Copy package files to install only production dependencies
COPY package*.json ./
# Install only production dependencies to keep the container lightweight
RUN npm install --only=production
# Copy the build artifacts from the previous stage (builder)
COPY --from=builder /app/dist ./dist
# Specify the command to run the application
CMD ["node", "dist/main"]
