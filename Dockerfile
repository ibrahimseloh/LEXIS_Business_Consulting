# Étape 1 : Installer les dépendances et construire
FROM python:3.9-alpine as build

WORKDIR /app
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Étape 2 : Créer l'image finale légère
FROM python:3.9-alpine

WORKDIR /app
COPY --from=build /app /app

# Copier le reste du projet
COPY . /app/

EXPOSE 8501
CMD ["streamlit", "run", "main.py"]
