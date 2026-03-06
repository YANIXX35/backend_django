#!/bin/bash
# Script de déploiement du backend Django sur Render

echo "🚀 Préparation du déploiement Django sur Render..."

# Vérifier si nous sommes dans le bon dossier
if [ ! -f "manage.py" ]; then
    echo "❌ Erreur: manage.py non trouvé. Ce n'est pas un projet Django."
    exit 1
fi

# Installer les dépendances
echo "📦 Installation des dépendances..."
pip install -r requirements.txt

# Collecter les fichiers statiques
echo "📁 Collecte des fichiers statiques..."
python manage.py collectstatic --noinput

# Appliquer les migrations
echo "🗄️ Application des migrations..."
python manage.py migrate

# Créer un superutilisateur (optionnel)
echo "👤 Création du superutilisateur..."
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'admin123') if not User.objects.filter(username='admin').exists() else None" | python manage.py shell

echo "✅ Backend Django prêt pour le déploiement !"
echo ""
echo "📋 Prochaines étapes pour Render :"
echo "1. Pousser ce repository sur GitHub"
echo "2. Connecter le repository sur Render"
echo "3. Configurer les variables d'environnement:"
echo "   - SECRET_KEY"
echo "   - EMAIL_HOST_USER"
echo "   - EMAIL_HOST_PASSWORD"
echo "   - RENDER_EXTERNAL_HOSTNAME"
echo "4. Déployer automatiquement"
