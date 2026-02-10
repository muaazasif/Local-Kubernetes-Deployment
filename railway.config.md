# Railway Configuration

This application has been configured for Railway deployment with the following setup:

## Backend Service (API)
- Directory: `/backend`
- Build Command: `npm install`
- Start Command: `npm start`
- Port: Uses `PORT` environment variable (Railway will provide this)

## Frontend Service (UI)
- Directory: `/frontend`
- Build Command: None needed (static HTML)
- Start Command: Served via backend or separate static server

## Environment Variables
The application is configured to work with Railway's environment variable system.

## Dockerfile for Backend
The backend has a Dockerfile that:
1. Uses Node.js 18 base image
2. Installs dependencies
3. Copies application files
4. Exposes the port provided by Railway
5. Starts the application

## Deployment Notes
- Railway will automatically detect the Node.js application
- Dependencies will be installed during the build phase
- The application will listen on the PORT environment variable provided by Railway