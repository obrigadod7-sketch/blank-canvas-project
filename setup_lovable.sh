#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}=====================================${NC}"
echo -e "${BLUE}🚀 Lovable Configuration Setup${NC}"
echo -e "${BLUE}=====================================${NC}\n"

# Check if files exist and create .env files
setup_env_files() {
    echo -e "${YELLOW}📝 Setting up environment files...${NC}\n"
    
    # Root .env
    if [ ! -f .env ]; then
        cp .env.example .env
        echo -e "${GREEN}✓${NC} Created .env"
    else
        echo -e "${YELLOW}⚠${NC} .env already exists"
    fi
    
    # Frontend .env
    if [ ! -f frontend/.env ]; then
        cp frontend/.env.example frontend/.env
        echo -e "${GREEN}✓${NC} Created frontend/.env"
    else
        echo -e "${YELLOW}⚠${NC} frontend/.env already exists"
    fi
    
    # Backend .env
    if [ ! -f backend/.env ]; then
        cp backend/.env.example backend/.env
        echo -e "${GREEN}✓${NC} Created backend/.env"
    else
        echo -e "${YELLOW}⚠${NC} backend/.env already exists"
    fi
    
    echo ""
}

# Generate JWT Secret
generate_jwt_secret() {
    echo -e "${YELLOW}🔐 Generate JWT Secret for security${NC}\n"
    
    if command -v openssl &> /dev/null; then
        JWT_SECRET=$(openssl rand -base64 32)
        echo -e "${GREEN}✓${NC} Generated JWT Secret:"
        echo -e "${BLUE}$JWT_SECRET${NC}\n"
    else
        JWT_SECRET=$(python3 -c "import secrets; print(secrets.token_urlsafe(32))")
        echo -e "${GREEN}✓${NC} Generated JWT Secret:"
        echo -e "${BLUE}$JWT_SECRET${NC}\n"
    fi
    
    echo -e "${YELLOW}📌 Copy this and paste in your .env file${NC}\n"
}

# Check requirements
check_requirements() {
    echo -e "${YELLOW}🔍 Checking requirements...${NC}\n"
    
    # Check Python
    if command -v python3 &> /dev/null; then
        PYTHON_VERSION=$(python3 --version | awk '{print $2}')
        echo -e "${GREEN}✓${NC} Python $PYTHON_VERSION"
    else
        echo -e "${RED}✗${NC} Python 3 not found"
        return 1
    fi
    
    # Check Node/Yarn
    if command -v yarn &> /dev/null; then
        YARN_VERSION=$(yarn --version)
        echo -e "${GREEN}✓${NC} Yarn $YARN_VERSION"
    else
        echo -e "${YELLOW}⚠${NC} Yarn not installed (will install via npm)"
    fi
    
    # Check Git
    if command -v git &> /dev/null; then
        echo -e "${GREEN}✓${NC} Git installed"
    else
        echo -e "${YELLOW}⚠${NC} Git not found (needed for repository)"
    fi
    
    echo ""
}

# Instructions
show_instructions() {
    echo -e "${BLUE}=====================================${NC}"
    echo -e "${BLUE}📋 Next Steps:${NC}"
    echo -e "${BLUE}=====================================${NC}\n"
    
    echo -e "${YELLOW}1. Configure Environment Variables:${NC}"
    echo -e "   Edit .env file with:"
    echo -e "   • MONGO_URL (from MongoDB Atlas)"
    echo -e "   • JWT_SECRET (use the generated one above)"
    echo -e "   • EMERGENT_LLM_KEY (if available)\n"
    
    echo -e "${YELLOW}2. Install Dependencies:${NC}"
    echo -e "   cd backend && pip install -r requirements.txt"
    echo -e "   cd ../frontend && yarn install\n"
    
    echo -e "${YELLOW}3. Start Development Servers:${NC}"
    echo -e "   # Terminal 1 - Backend"
    echo -e "   cd backend && uvicorn server:app --reload"
    echo -e "   "
    echo -e "   # Terminal 2 - Frontend"
    echo -e "   cd frontend && yarn start\n"
    
    echo -e "${YELLOW}4. In Lovable Dashboard:${NC}"
    echo -e "   • Go to Project Settings → Environment Variables"
    echo -e "   • Add all variables from .env file"
    echo -e "   • Deploy using Lovable's deploy button\n"
    
    echo -e "${YELLOW}5. Access Your Application:${NC}"
    echo -e "   • Frontend: http://localhost:3000"
    echo -e "   • Backend API: http://localhost:8000/api"
    echo -e "   • API Docs: http://localhost:8000/docs\n"
    
    echo -e "${GREEN}=====================================${NC}"
    echo -e "${GREEN}✨ Setup Complete!${NC}"
    echo -e "${GREEN}=====================================${NC}\n"
}

# Main execution
main() {
    # Check requirements
    if ! check_requirements; then
        echo -e "${RED}❌ Please install missing requirements${NC}"
        exit 1
    fi
    
    # Setup env files
    setup_env_files
    
    # Generate JWT Secret
    generate_jwt_secret
    
    # Show instructions
    show_instructions
}

# Run main function
main
