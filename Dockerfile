# temp stage
FROM python:3.9-slim as builder

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .



# final stage
FROM python:3.9-slim

WORKDIR /app

COPY --from=builder . .
COPY --from=builder /app/requirements.txt .
COPY --from=builder /app/python_bang_fikri.py .

RUN pip install --no-cache-dir -r requirements.txt
CMD ["python", "python_bang_fikri.py"]