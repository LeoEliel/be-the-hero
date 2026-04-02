#!/bin/bash
# Be The Hero - Start Script
# This script starts both backend and frontend servers

echo "🚀 Be The Hero - Starting servers..."
echo ""

# Create a directory for logs if not exists
mkdir -p logs

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Kill any existing processes
echo "Cleaning up previous processes..."
pkill -f "npm start" 2>/dev/null
pkill -f "nodemon" 2>/dev/null
sleep 2

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}Starting Backend (Port 3333)${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"

cd backend
npm start > ../logs/backend.log 2>&1 &
BACKEND_PID=$!
echo -e "${GREEN}✓ Backend started (PID: $BACKEND_PID)${NC}"
echo "  Logs: logs/backend.log"

sleep 3

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}Starting Frontend (Port 3000)${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"

cd ../frontend
npm start > ../logs/frontend.log 2>&1 &
FRONTEND_PID=$!
echo -e "${GREEN}✓ Frontend started (PID: $FRONTEND_PID)${NC}"
echo "  Logs: logs/frontend.log"

echo ""
echo -e "${GREEN}✓ Both servers are running! ${NC}"
echo ""
echo "  Backend:  http://localhost:3333"
echo "  Frontend: http://localhost:3000"
echo ""
echo "Press Ctrl+C to stop both servers"
echo ""

# Wait for user interrupt
wait $BACKEND_PID $FRONTEND_PID

# Cleanup
echo ""
echo "Shutting down servers..."
kill $BACKEND_PID 2>/dev/null
kill $FRONTEND_PID 2>/dev/null
echo "Done!"
