FROM python:3.9-slim
WORKDIR /app/
COPY requirements.txt /app/
RUN pip install -r requirements.txt
ENV ENVIRONMENT=production
#COPY main.py __init__.py /app/ 
RUN pip install Flask gunicorn
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app
#CMD python3 main.py