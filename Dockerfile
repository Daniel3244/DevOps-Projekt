FROM python:3.9-slim

# Instalacja Trivy
RUN apt-get update && apt-get install -y wget \
    && wget https://github.com/aquasecurity/trivy/releases/download/v0.58.1/trivy_0.58.1_Linux-64bit.deb -O trivy.deb \
    && dpkg -i trivy.deb \
    && rm trivy.deb \
    && apt-get install -f -y

# Ustawienie katalogu roboczego
WORKDIR /app

# Kopiowanie plików do obrazu
COPY . /app

# Instalacja zależności
RUN pip install -r requirements.txt

# Uruchomienie aplikacji
CMD ["python", "app.py"]
