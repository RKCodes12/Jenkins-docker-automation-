# Step 1: Use Node base image
FROM node:20-alpine

# Step 2: Set working directory inside container
WORKDIR /frontend_code

# Step 3: Copy only package.json and lock file to install dependencies
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of your project files
COPY . .

# Step 6: Build the frontend
RUN npm run build

# Step 7: Use lightweight image to serve the build (optional, good for production)
# FROM nginx:alpine
# COPY --from=0 /app/dist /usr/share/nginx/html

# For dev or preview:
CMD ["npm", "run", "dev"]
