FROM python:3.10-slim

WORKDIR /app

COPY monitor.py .
COPY requirements.txt .
RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["python", "monitor.py"]