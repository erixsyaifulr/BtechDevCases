#Node version
FROM node:20-alpine

# Set environment variables
ARG DATABASE_URL
ENV DATABASE_URL=$DATABASE_URL

# Set working directory
WORKDIR /app

# Copy package.json & package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all file
COPY . .

# Generate Prisma client
RUN npx prisma generate

# Build TypeScript
RUN npm run build

# Expose port
EXPOSE 3000

# Run app and run migration before start
CMD ["sh", "-c", "npx prisma migrate deploy && npm start"]

