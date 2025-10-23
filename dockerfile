FROM python:3.8-slim
RUN pip install flask==1.0.2
COPY app.py /app/app.py
WORKDIR /app
CMD ["python", "app.py"]
