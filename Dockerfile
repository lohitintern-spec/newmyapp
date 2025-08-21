FROM python:3.11-slim

WORKDIR /app

# system deps (optional but useful)
RUN apt-get update && apt-get install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# gunicorn is a production server; binds to 0.0.0.0:8000
CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:8000", "app:app"]
