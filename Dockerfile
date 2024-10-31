FROM python:3.9
RUN useradd -m user
WORKDIR /app
COPY . /app
RUN chmod -R 755 /app
USER user
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python", "main.py"]