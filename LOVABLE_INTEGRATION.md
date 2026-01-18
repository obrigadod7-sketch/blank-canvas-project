# 🎯 Complete Lovable Integration Guide

## Overview

This project is now fully configured to run on **Lovable** - a modern web-based IDE for full-stack development.

### What's Included ✅

- **lovable.yaml** - Primary Lovable configuration
- **.lovablerc.json** - Alternative JSON configuration  
- **Environment templates** - .env.example files for all layers
- **Setup script** - Automated configuration
- **Documentation** - Complete guides for dev and production

---

## 🚀 Getting Started (Choose One)

### Option A: Automated Setup (Recommended)

```bash
bash setup_lovable.sh
```

This will:
1. ✅ Create .env files from templates
2. ✅ Generate secure JWT secret
3. ✅ Check system requirements
4. ✅ Show next steps

### Option B: Manual Setup

```bash
# Copy environment templates
cp .env.example .env
cp frontend/.env.example frontend/.env
cp backend/.env.example backend/.env

# Edit with your credentials
nano .env
nano frontend/.env
nano backend/.env

# Install dependencies
cd backend && pip install -r requirements.txt
cd ../frontend && yarn install
```

---

## 📋 Configuration Checklist

Before starting, ensure you have:

- [ ] MongoDB Atlas account & connection string (MONGO_URL)
- [ ] Generated secure JWT_SECRET
- [ ] Updated .env files in root, backend/, and frontend/
- [ ] Node.js and Python 3.11+ installed
- [ ] Yarn or npm for frontend

### Getting MongoDB URL

1. Go to [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)
2. Create a cluster (free tier available)
3. Get connection string: `mongodb+srv://user:pass@cluster.mongodb.net/db?retryWrites=true&w=majority`
4. Add to `.env` as `MONGO_URL`

### Generate JWT_SECRET

```bash
# Using openssl
openssl rand -base64 32

# Using Python
python3 -c "import secrets; print(secrets.token_urlsafe(32))"
```

---

## 💻 Local Development

### Terminal 1: Backend
```bash
cd backend
pip install -r requirements.txt  # First time only
uvicorn server:app --host 0.0.0.0 --port 8000 --reload
```

### Terminal 2: Frontend
```bash
cd frontend
yarn install  # First time only
yarn start
```

### Terminal 3 (Optional): Monitoring
```bash
# Test backend
curl http://localhost:8000/api/

# Check database
cd backend
python check_mongodb.py
```

---

## 🌐 Access URLs

| Service | URL | Purpose |
|---------|-----|---------|
| Frontend | http://localhost:3000 | Main application |
| Backend API | http://localhost:8000/api | API endpoint |
| API Docs | http://localhost:8000/docs | Swagger documentation |
| API ReDoc | http://localhost:8000/redoc | ReDoc documentation |

---

## 🔄 Lovable Platform Deployment

### Step 1: Prepare Repository

```bash
git add .
git commit -m "Setup for Lovable deployment"
git push
```

### Step 2: Import to Lovable

1. Go to [Lovable](https://lovable.dev)
2. Sign in or create account
3. Click **"New Project"** → **"Import from Git"**
4. Paste your repository URL
5. Wait for project scan

### Step 3: Configure Environment

In Lovable Dashboard → **Project Settings** → **Environment Variables**

Add these variables (mark sensitive ones as "Secret"):

```
MONGO_URL = mongodb+srv://...  [SECRET]
DB_NAME = watizat_db
JWT_SECRET = <generated_secret>  [SECRET]
EMERGENT_LLM_KEY = sk-...  [SECRET - optional]
CORS_ORIGINS = *  (for dev) or https://your-domain.com (for prod)
REACT_APP_API_URL = http://localhost:8000  (for dev) or https://api.your-domain.com (for prod)
```

### Step 4: Deploy

1. Click **"Deploy"** or **"Publish"**
2. Lovable uses `lovable.yaml` to build project
3. Wait for build completion
4. Access via Lovable's provided URL

---

## 📁 Project Structure

```
fiel/
├── lovable.yaml              ← Main Lovable config
├── .lovablerc.json           ← Alternative JSON config
├── setup_lovable.sh          ← Setup automation script
├── .env.example              ← Global env template
│
├── backend/
│   ├── .env.example          ← Backend env template
│   ├── server.py             ← FastAPI application
│   ├── requirements.txt       ← Python dependencies
│   ├── check_mongodb.py       ← Database test script
│   └── ...
│
├── frontend/
│   ├── .env.example          ← Frontend env template
│   ├── package.json          ← Node dependencies
│   ├── src/                  ← React components
│   └── ...
│
├── LOVABLE_SETUP.md          ← Detailed setup guide
├── LOVABLE_QUICK_START.md    ← Quick reference
└── LOVABLE_FILES_REFERENCE.md ← Files documentation
```

---

## 🧪 Testing

### Test Backend Connection

```bash
# Check API is running
curl http://localhost:8000/api/

# Expected response:
# {"message": "Watizat API - Bem-vindo!"}
```

### Test Database Connection

```bash
cd backend
python check_mongodb.py

# Should print MongoDB connection info
```

### Test Frontend

1. Open http://localhost:3000 in browser
2. Should see the application UI
3. Check browser console for errors

---

## 🔐 Security Best Practices

### Development
```env
# .env (development)
MONGO_URL=mongodb+srv://dev-user:dev-pass@...
JWT_SECRET=dev-secret-can-be-simple
CORS_ORIGINS=*
```

### Production
```env
# .env (production)
MONGO_URL=mongodb+srv://prod-user:prod-pass@...  [SECURE]
JWT_SECRET=<very-long-random-secure-string>     [SECURE]
CORS_ORIGINS=https://your-domain.com
REACT_APP_API_URL=https://api.your-domain.com
```

### Security Checklist

- [ ] JWT_SECRET is 32+ characters
- [ ] Database credentials use strong passwords
- [ ] Never commit `.env` files (use .gitignore)
- [ ] Use HTTPS in production
- [ ] Restrict CORS_ORIGINS to your domain
- [ ] Use environment-specific credentials
- [ ] Rotate secrets regularly

---

## 🐛 Troubleshooting

### "Cannot connect to MongoDB"
```bash
# Check connection string
python backend/check_mongodb.py

# Verify MONGO_URL in .env
cat backend/.env | grep MONGO_URL

# Make sure MongoDB cluster is accessible
# Add your IP to MongoDB Atlas Network Access
```

### "Frontend shows blank/errors"
1. Check browser console (F12 → Console)
2. Verify `REACT_APP_API_URL` is correct
3. Check backend is running: `curl http://localhost:8000/api/`

### "Port already in use"
```bash
# Change ports in lovable.yaml
# Frontend: change to 3001
# Backend: change to 8001

# Or kill existing process
lsof -i :3000  # Find process on port 3000
kill -9 <PID>
```

### "Lovable can't detect configuration"
- Ensure `lovable.yaml` is in root directory
- Check file formatting (YAML must be valid)
- Try `.lovablerc.json` as alternative

---

## 📚 Additional Resources

| Resource | Link | Purpose |
|----------|------|---------|
| Lovable Docs | https://docs.lovable.dev | Platform documentation |
| FastAPI Docs | https://fastapi.tiangolo.com | Backend framework |
| React Docs | https://react.dev | Frontend framework |
| MongoDB Atlas | https://www.mongodb.com/cloud/atlas | Database |
| Setup Guide | [LOVABLE_SETUP.md](LOVABLE_SETUP.md) | Detailed setup |
| Quick Start | [LOVABLE_QUICK_START.md](LOVABLE_QUICK_START.md) | 5-min setup |

---

## 📞 Support

If you encounter issues:

1. **Check error logs** - Lovable shows build/runtime errors
2. **Review documentation** - LOVABLE_SETUP.md has troubleshooting
3. **Test locally first** - Ensure code works on local machine
4. **Check environment variables** - Most issues are config-related
5. **See other guides** - MONGODB_ATLAS_SIMPLES.md, QUICKSTART.md

---

## ✨ Next Steps

1. ✅ Run setup script: `bash setup_lovable.sh`
2. ✅ Edit .env files with your credentials
3. ✅ Test locally: Start backend and frontend
4. ✅ Push to Git: Commit and push changes
5. ✅ Deploy to Lovable: Import and deploy
6. ✅ Monitor: Check Lovable dashboard

---

**Status**: ✅ All Lovable configurations are ready to use

Last Updated: January 2026
