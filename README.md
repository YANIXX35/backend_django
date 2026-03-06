# Portfolio Backend Django

Backend API pour le portfolio avec envoi d'emails via SMTP.

## 🚀 Fonctionnalités

- **API REST** avec Django REST Framework
- **Envoi d'emails** via SMTP Gmail
- **CORS configuré** pour Angular
- **Logs détaillés** pour le debugging
- **Tests SMTP** intégrés

## 📁 Structure

```
backend_django/
├── portfolio/              # App Django
│   ├── views.py          # Vues API (contact)
│   ├── urls.py           # URLs de l'app
│   ├── models.py         # Modèles de données
│   └── admin.py         # Admin Django
├── portfolio_project/      # Projet Django
│   ├── settings.py       # Configuration
│   ├── urls.py          # URLs principales
│   ├── wsgi.py          # WSGI pour déploiement
│   └── asgi.py          # ASGI pour WebSocket
├── manage.py              # Gestion Django
├── requirements.txt       # Dépendances Python
├── Procfile             # Configuration Render
├── test_email.py         # Test SMTP
├── diagnose_smtp.py     # Diagnostic SMTP
└── db.sqlite3          # Base de données SQLite
```

## 🔧 Configuration

### Variables d'environnement
- `SECRET_KEY` : Clé secrète Django
- `DEBUG` : Mode debug (False en production)
- `ALLOWED_HOSTS` : Hôtes autorisés
- `EMAIL_HOST_USER` : Email SMTP
- `EMAIL_HOST_PASSWORD` : Mot de passe d'application

### Configuration SMTP
- **Serveur** : smtp.gmail.com
- **Port** : 587
- **TLS** : Activé
- **Authentification** : Mot de passe d'application

## 🌐 API Endpoints

### Contact
```
POST /api/contact/
```

**Corps de la requête :**
```json
{
  "name": "Nom de l'utilisateur",
  "email": "email@example.com",
  "subject": "Sujet du message",
  "message": "Contenu du message"
}
```

**Réponse :**
```json
{
  "status": "success",
  "message": "Email envoyé"
}
```

## 🧪 Tests

### Test SMTP
```bash
python test_email.py
```

### Diagnostic SMTP
```bash
python diagnose_smtp.py
```

### Test API
```bash
# Démarrer le serveur
python manage.py runserver

# Tester l'endpoint
curl -X POST http://localhost:8000/api/contact/ \
  -H "Content-Type: application/json" \
  -d '{"name":"Test","email":"test@example.com","subject":"Test","message":"Message de test"}'
```

## 🚀 Déploiement

### Render
1. **Connecter** le repository GitHub
2. **Configurer** les variables d'environnement
3. **Déployer** automatiquement

**Variables Render :**
- `SECRET_KEY` : Clé secrète Django
- `DEBUG` : False
- `ALLOWED_HOSTS` : *.onrender.com
- `EMAIL_HOST_USER` : Votre email Gmail
- `EMAIL_HOST_PASSWORD` : Mot de passe d'application

### Local
```bash
# Installation
pip install -r requirements.txt

# Migration
python manage.py migrate

# Démarrage
python manage.py runserver
```

## 🔍 Logs

Les logs sont configurés pour :
- **Console** : Output en temps réel
- **Fichier** : `django.log`

## 🛡️ Sécurité

- **CORS** configuré pour Angular
- **CSRF** activé
- **Validation** des entrées
- **Logs** des erreurs

## 📝 Notes

- Utiliser un **mot de passe d'application Gmail**
- Activer la **validation en deux étapes**
- Configurer les **hôtes autorisés** en production
- Vérifier les **logs** pour le debugging
