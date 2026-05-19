# Gunakan Python 3.11 atau 3.12 agar mendukung scikit-learn 1.8.0
FROM python:3.11-slim

WORKDIR /app

# Update pip terlebih dahulu
RUN pip install --no-cache-dir --upgrade pip

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
# Sekarang ini tidak akan error lagi
RUN pip install --no-cache-dir scikit-learn==1.8.0

COPY . .
EXPOSE 5000

CMD ["python", "app.py"]
