# ⚡ Quick Start - Lovable em 5 Minutos

## 1️⃣ Copiar Templates de Configuração

```bash
# No diretório raiz
cp .env.example .env
cp frontend/.env.example frontend/.env
cp backend/.env.example backend/.env
```

## 2️⃣ Adicionar Credenciais

Edite `.env` com suas credenciais:

```bash
# Obtenha MONGO_URL do MongoDB Atlas
# Gere JWT_SECRET seguro
# Adicione chaves de API necessárias
```

**Via terminal:**
```bash
# Gerar JWT_SECRET seguro
openssl rand -base64 32
```

## 3️⃣ No Lovable Dashboard

1. New Project → Import from Git
2. Cole URL do repositório
3. Aguarde scan de projeto
4. Configure Environment Variables:
   - `MONGO_URL` (secret)
   - `JWT_SECRET` (secret)
   - `EMERGENT_LLM_KEY` (opcional)

## 4️⃣ Iniciar

```bash
# Terminal Backend
cd backend && uvicorn server:app --reload

# Terminal Frontend  
cd frontend && yarn start
```

✅ Pronto! Acesse:
- Frontend: http://localhost:3000
- Backend: http://localhost:8000/api
- Docs: http://localhost:8000/docs

---

**Problemas?** Consulte [LOVABLE_SETUP.md](LOVABLE_SETUP.md)
