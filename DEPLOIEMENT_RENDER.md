# 🚀 Guide de Déploiement Backend Django sur Render

## 📋 Prérequis

- ✅ **Compte Render** (gratuit)
- ✅ **Compte GitHub** avec le repository
- ✅ **Mot de passe d'application Gmail**
- ✅ **Backend Django** analysé et fonctionnel

## 🔍 Analyse du Backend

### ✅ Fonctionnalités confirmées :
- **API REST** avec Django REST Framework
- **Endpoint contact** : `POST /api/contact/`
- **SMTP Gmail** configuré et fonctionnel
- **CORS** activé pour Angular (localhost:4200)
- **Logs** détaillés pour debugging
- **Tests SMTP** intégrés

### 📡 Consommation API Angular :
- **Service** : `PortfolioService`
- **URL API** : `http://localhost:8001/api`
- **Méthode** : POST vers `/contact/`
- **Données** : Formulaire structuré (name, email, subject, message)
- **Logs** : Console détaillée pour debugging

## 🚀 Étapes de Déploiement

### 1️⃣ Préparer le Repository

```bash
# Initialiser Git (si pas déjà fait)
cd C:/Users/yaniss/Desktop/angular_f/backend_django
git init
git add .
git commit -m "Backend Django prêt pour déploiement Render"

# Connecter à GitHub
git remote add origin https://github.com/VOTRE_USERNAME/votre-backend-django.git
git push -u origin main
```

### 2️⃣ Configurer Render

1. **Se connecter** sur [render.com](https://render.com)
2. **Créer un "New Web Service"**
3. **Connecter le repository GitHub**
4. **Configurer les options :**
   - **Name** : `portfolio-backend`
   - **Environment** : `Python 3`
   - **Branch** : `main`
   - **Root Directory** : `./`
   - **Build Command** : `pip install -r requirements.txt`
   - **Start Command** : `gunicorn portfolio_project.wsgi:application --bind 0.0.0.0:$PORT`

### 3️⃣ Variables d'Environnement

Dans **Render Dashboard → Service → Environment**, ajouter :

```bash
# Sécurité
SECRET_KEY=django-secure-key-générée-ici
DEBUG=False

# Base de données (fournie par Render)
DATABASE_URL=postgresql://user:pass@host:port/dbname

# Email SMTP
EMAIL_HOST_USER=kyliyanisse@gmail.com
EMAIL_HOST_PASSWORD=votre-mot-de-passe-application
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USE_TLS=True

# Domaine
RENDER_EXTERNAL_HOSTNAME=votre-backend.onrender.com
```

### 4️⃣ CORS Angular

**Mettre à jour l'URL Angular** :
```typescript
// src/app/services/portfolio.service.ts
private apiUrl = 'https://votre-backend.onrender.com/api';
```

## 🌐 URLs après Déploiement

### Backend Render
```
https://votre-backend.onrender.com/api/contact/
```

### Frontend Angular (Vercel)
```
https://votre-portfolio.vercel.app
```

### Test de connexion
```bash
# Tester l'API
curl -X POST https://votre-backend.onrender.com/api/contact/ \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Test Render",
    "email": "test@example.com", 
    "subject": "Test déploiement",
    "message": "Message de test depuis Render"
  }'
```

## 🛠️ Configuration Production

### Settings principaux
- **DEBUG = False** : Mode production
- **ALLOWED_HOSTS** : Domaine Render
- **DATABASE** : PostgreSQL Render
- **STATIC_ROOT** : Fichiers statiques
- **EMAIL** : SMTP configuré

### Sécurité
- **HTTPS** automatique sur Render
- **CORS** limité aux domaines autorisés
- **SECRET_KEY** variable d'environnement
- **Logs** activés pour monitoring

## 🧪 Tests Post-Déploiement

### 1. Test API
```bash
# Vérifier que l'API répond
curl https://votre-backend.onrender.com/api/contact/
```

### 2. Test Email
- **Formulaire Angular** → **Backend Render** → **Email Gmail**
- **Vérifier** : Réception email
- **Logs Render** : Console output

### 3. Test CORS
- **Angular Vercel** → **Backend Render**
- **Navigateur** : Pas d'erreurs CORS
- **Console** : Réponses API

## 🔧 Monitoring

### Logs Render
- **Dashboard → Service → Logs**
- **Logs en temps réel**
- **Erreurs détaillées**

### Email Testing
```bash
# Script de test
python test_email.py

# Diagnostic complet
python diagnose_smtp.py
```

## 🚨 Dépannage

### Erreurs communes
1. **CORS** : Vérifier `CORS_ALLOWED_ORIGINS`
2. **Email** : Mot de passe d'application Gmail
3. **Database** : `DATABASE_URL` correcte
4. **Static files** : `collectstatic` exécuté

### Solutions
1. **Rebuild** : Push vers GitHub → Redéploiement automatique
2. **Logs** : Console Render pour erreurs
3. **Variables** : Vérifier environnement Render
4. **Local** : Tester avec `ng serve` + `python manage.py runserver`

## ✅ Checklist Déploiement

- [ ] Repository GitHub créé et poussé
- [ ] Service Web Render configuré
- [ ] Variables d'environnement définies
- [ ] URL Angular mise à jour
- [ ] API testée manuellement
- [ ] Formulaire Angular fonctionnel
- [ ] Email reçu avec succès
- [ ] CORS configuré correctement
- [ ] HTTPS fonctionnel
- [ ] Logs monitoring activés

---

## 🎯 Résultat Final

**Backend Django déployé sur Render avec :**
- ✅ **API REST** fonctionnelle
- ✅ **Envoi d'emails** SMTP Gmail
- ✅ **CORS** configuré pour Angular
- ✅ **HTTPS** automatique
- ✅ **Logs** monitoring
- ✅ **Scalabilité** Render

**Portfolio complet :**
- 🌐 **Frontend** : Angular sur Vercel
- 🔧 **Backend** : Django sur Render
- 📧 **Email** : SMTP Gmail
- 🛡️ **Sécurité** : HTTPS + CORS
- 📊 **Monitoring** : Logs complets
