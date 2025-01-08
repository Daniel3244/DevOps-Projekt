FROM python:3.9-slim

RUN apt-get update && apt-get install -y wget \
    && wget https://github.com/aquasecurity/trivy/releases/download/v0.38.3/trivy_0.38.3_Linux-64bit.deb \
    && dpkg -i trivy_0.38.3_Linux-64bit.deb \
    && rm trivy_0.38.3_Linux-64bit.deb

WORKDIR /app
COPY . /app

RUN pip install -r requirements.txt

CMD ["python", "app.py"]
