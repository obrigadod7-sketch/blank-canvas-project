# Lovable Configuration Files Reference

## 📁 Files Created for Lovable

### 1. **lovable.yaml** (Main Configuration)
```
Frontend: React with Craco build tool
Backend: FastAPI with Python 3.11
Database: MongoDB
```

### 2. **.lovablerc.json** (JSON Configuration)
Alternativa ao lovable.yaml com formato JSON

### 3. Environment Files
- `.env.example` - Template global
- `frontend/.env.example` - Frontend template
- `backend/.env.example` - Backend template

### 4. Documentation
- `LOVABLE_SETUP.md` - Setup completo (5-20 min)
- `LOVABLE_QUICK_START.md` - Setup rápido (5 min)
- `setup_lovable.sh` - Script de automação

---

## 🎯 How to Use Each File

### For Local Development

1. **First Time Setup:**
   ```bash
   bash setup_lovable.sh
   ```

2. **Or Manual:**
   ```bash
   cp .env.example .env
   cp frontend/.env.example frontend/.env
   cp backend/.env.example backend/.env
   # Edit .env files with your credentials
   ```

### For Lovable Platform

1. **Import Project:**
   - Go to https://lovable.dev
   - Click "New Project" → "Import from Git"
   - Paste your repository URL

2. **Configure Environment:**
   - Go to Project Settings → Environment Variables
   - Copy all variables from `.env.example` to Lovable

3. **Deploy:**
   - Click "Deploy" or "Publish"
   - Lovable will use `lovable.yaml` or `.lovablerc.json`

---

## 🔐 Environment Variables Explained

| Variable | Purpose | Required | Example |
|----------|---------|----------|---------|
| MONGO_URL | Database connection | ✅ | `mongodb+srv://...` |
| DB_NAME | Database name | ❌ | `watizat_db` |
| JWT_SECRET | Auth token secret | ✅ | Long random string |
| EMERGENT_LLM_KEY | AI API key | ❌ | `sk-...` |
| CORS_ORIGINS | CORS settings | ❌ | `*` or domain |
| REACT_APP_API_URL | Backend URL (Frontend) | ✅ | `http://localhost:8000` |

---

## 🚀 Quick Commands

```bash
# Setup everything
bash setup_lovable.sh

# Start backend
cd backend && uvicorn server:app --reload

# Start frontend
cd frontend && yarn start

# Test API
curl http://localhost:8000/api/

# Test MongoDB connection
python backend/check_mongodb.py
```

---

## 📱 Access URLs (Local Dev)

- **Frontend**: http://localhost:3000
- **Backend**: http://localhost:8000
- **API Docs**: http://localhost:8000/docs
- **API ReDoc**: http://localhost:8000/redoc

---

## 🔧 Configuration Priority

Lovable reads configurations in this order:
1. `lovable.yaml` (primary)
2. `.lovablerc.json` (fallback)
3. Environment Variables (override)
4. System defaults

---

## 📝 Customization

Edit `lovable.yaml` to customize:

```yaml
frontend:
  port: 3000              # Change port
  buildCommand: ...       # Change build
  
backend:
  pythonVersion: '3.11'   # Change Python version
  startCommand: ...       # Change start command
```

---

## 🆘 Troubleshooting

**Issue**: Lovable can't find configuration
- **Solution**: Ensure `lovable.yaml` is in root directory

**Issue**: Backend won't start
- **Solution**: Check MongoDB connection with `python backend/check_mongodb.py`

**Issue**: Frontend can't reach backend
- **Solution**: Check `REACT_APP_API_URL` in `frontend/.env`

---

## 📚 Related Files

- `README.md` - Project overview
- `QUICKSTART.md` - General quick start
- `MONGODB_ATLAS_SIMPLES.md` - Database setup
- `render.yaml` - Render.com config (for reference)

---

Generated for Watizat Project | Lovable v2024+
