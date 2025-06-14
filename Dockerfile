# Étape 1 : Utilisez une image de base légère avec Python 3.10
FROM python:3.10-slim

# Étape 2 : Définissez le répertoire de travail
WORKDIR /app

# Étape 3 : Copiez les fichiers nécessaires
COPY requirements.txt .
COPY main.py .
COPY src/ ./src/
COPY prompt.py .

# Étape 4 : Installez les dépendances
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    tesseract-ocr-fra \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt

# Étape 5 : Exposez le port (obligatoire pour Railway)
EXPOSE $PORT

# Étape 6 : Commande de démarrage
CMD ["streamlit", "run", "main.py", "--server.port=$PORT", "--server.address=0.0.0.0"]