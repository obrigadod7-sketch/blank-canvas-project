# 🚀 Configuração para Lovable

Lovable é uma plataforma web-based IDE perfeita para desenvolvimento full-stack. Este guia configura sua aplicação Watizat para rodar no Lovable.

## ✅ Pré-requisitos

- [ ] Conta no [Lovable](https://lovable.dev)
- [ ] MongoDB Atlas configurado (veja [MONGODB_ATLAS_SIMPLES.md](MONGODB_ATLAS_SIMPLES.md))
- [ ] Git instalado

## 🔧 Configuração Rápida (5 minutos)

### 1. Preparar as Variáveis de Ambiente

```bash
# No diretório raiz
cp .env.example .env

# No diretório frontend
cp frontend/.env.example frontend/.env

# No diretório backend
cp backend/.env.example backend/.env
```

### 2. Editar Variáveis de Ambiente

**Arquivo raiz: `.env`**
```env
MONGO_URL=mongodb+srv://seu-usuario:sua-senha@seu-cluster.mongodb.net/watizat_db?retryWrites=true&w=majority
DB_NAME=watizat_db
JWT_SECRET=seu-jwt-secret-aleatorio-muito-seguro
EMERGENT_LLM_KEY=sk-sua-chave-aqui
CORS_ORIGINS=*
```

**Arquivo frontend: `frontend/.env`**
```env
REACT_APP_API_URL=http://localhost:8000
```

**Arquivo backend: `backend/.env`**
```env
MONGO_URL=mongodb+srv://seu-usuario:sua-senha@seu-cluster.mongodb.net/watizat_db?retryWrites=true&w=majority
DB_NAME=watizat_db
JWT_SECRET=seu-jwt-secret-aleatorio-muito-seguro
EMERGENT_LLM_KEY=sk-sua-chave-aqui
CORS_ORIGINS=*
PYTHON_VERSION=3.11
```

### 3. Importar Projeto no Lovable

1. Acesse [Lovable](https://lovable.dev)
2. Clique em **"New Project"** ou **"Import"**
3. Selecione **"Import from Git"** e cole a URL do seu repositório
4. Ou faça upload da pasta do projeto

### 4. Configurar Variáveis de Ambiente no Lovable

1. Vá para **Project Settings** → **Environment Variables**
2. Adicione todas as variáveis do arquivo `.env`:
   - `MONGO_URL`
   - `DB_NAME`
   - `JWT_SECRET`
   - `EMERGENT_LLM_KEY`
   - `CORS_ORIGINS`

### 5. Iniciar Desenvolvimento

No terminal do Lovable:

```bash
# Terminal 1 - Backend
cd backend
pip install -r requirements.txt
uvicorn server:app --host 0.0.0.0 --port 8000 --reload

# Terminal 2 - Frontend
cd frontend
yarn install
yarn start
```

## 📋 Estrutura do Projeto para Lovable

```
fiel/
├── lovable.yaml           # ← Configuração do Lovable
├── .env.example           # ← Template de variáveis
├── .env                   # ← Seu arquivo de configuração (não commit!)
├── backend/
│   ├── .env.example
│   ├── .env               # ← Configuração do backend
│   ├── requirements.txt
│   ├── server.py
│   └── ... (outros arquivos)
├── frontend/
│   ├── .env.example
│   ├── .env               # ← Configuração do frontend
│   ├── package.json
│   └── src/
└── ... (outros arquivos de documentação)
```

## 🌐 URLs de Desenvolvimento

- **Frontend**: http://localhost:3000
- **Backend**: http://localhost:8000
- **API Docs**: http://localhost:8000/docs
- **API ReDoc**: http://localhost:8000/redoc

## 🧪 Testar a Configuração

### Verificar Backend
```bash
curl http://localhost:8000/api/
```

Deve retornar:
```json
{"message": "Watizat API - Bem-vindo!"}
```

### Verificar Banco de Dados
```bash
cd backend
python check_mongodb.py
```

## 🚀 Deploy em Produção no Lovable

### 1. Configurar Domínio
- Vá para **Deployment** → **Custom Domain**
- Aponte seu domínio ou use subdomínio do Lovable

### 2. Variáveis de Produção
Configure no Lovable as variáveis de ambiente para produção:

```env
MONGO_URL=mongodb+srv://prod-user:prod-pass@prod-cluster.mongodb.net/watizat_prod
DB_NAME=watizat_prod
JWT_SECRET=seu-jwt-super-secreto-em-producao
EMERGENT_LLM_KEY=sk-producao-chave
CORS_ORIGINS=https://seu-dominio.com
REACT_APP_API_URL=https://api.seu-dominio.com
```

### 3. Deploy
- Clique em **Deploy** ou **Publish**
- Aguarde build e deploy

## 🔐 Segurança

### Checklist de Segurança
- [ ] Gerar JWT_SECRET seguro (mínimo 32 caracteres)
- [ ] Nunca commitar `.env` (está no `.gitignore`)
- [ ] Usar credenciais diferentes para Dev/Prod
- [ ] Habilitar TLS/SSL em produção
- [ ] Configurar CORS_ORIGINS corretamente em produção
- [ ] Usar variáveis secretas do Lovable para chaves sensíveis

### Gerar JWT_SECRET Seguro
```bash
# macOS/Linux
openssl rand -base64 32

# Ou no Python
python3 -c "import secrets; print(secrets.token_urlsafe(32))"
```

## 🐛 Troubleshooting

### Erro: "Cannot find module 'requirements.txt'"
```bash
pip install -r backend/requirements.txt
```

### Erro: "MONGO_URL not set"
- Verifique se as variáveis estão configuradas no `.env`
- Reinicie os terminais após editar `.env`

### Erro: "CORS policy"
- Verifique `CORS_ORIGINS` no `.env`
- Para desenvolvimento: `CORS_ORIGINS=*`
- Para produção: `CORS_ORIGINS=https://seu-dominio.com`

### Frontend não conecta ao Backend
- Verifique `REACT_APP_API_URL` em `frontend/.env`
- Deve apontar para `http://localhost:8000` em dev
- Deve apontar para sua URL de produção em prod

### Banco de dados não conecta
```bash
python backend/check_mongodb.py
```

Se falhar, reconfigure MONGO_URL em `.env`

## 📚 Arquivos de Configuração Importados

- `lovable.yaml` - Configuração principal do Lovable
- `.env.example` - Template de variáveis globais
- `frontend/.env.example` - Template frontend
- `backend/.env.example` - Template backend

## 🔗 Recursos Úteis

- [Documentação Lovable](https://docs.lovable.dev)
- [FastAPI + React](https://fastapi.tiangolo.com/deployment/concepts/)
- [MongoDB Atlas Setup](MONGODB_ATLAS_SIMPLES.md)
- [Guia Rápido](QUICKSTART.md)

## ✨ Próximos Passos

1. ✅ Configurar variáveis de ambiente
2. ✅ Testar backend e frontend localmente
3. ✅ Fazer push do código para Git
4. ✅ Importar no Lovable
5. ✅ Deploy em produção

---

**Precisa de ajuda?** Consulte [TROUBLESHOOTING.md](TROUBLESHOOTING.md) ou veja os outros guias na pasta.
