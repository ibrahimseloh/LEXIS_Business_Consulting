# Utilisation de l'image Python officielle
FROM python:3.9-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier requirements.txt et l'installer
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copier tout le projet dans le conteneur
COPY . /app/

# Exposer le port que Streamlit utilise
EXPOSE 8501

# Commande pour exécuter Streamlit
CMD ["streamlit", "run", "main.py"]
