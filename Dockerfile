FROM python:3.8-slim
WORKDIR /app/
ENV APP_HOME /app
COPY . /app/
ENV PYTHONUNBUFFERED True
RUN pip install -r requirements.txt
ENV ENVIRONMENT=production
#COPY main.py __init__.py /app/ 
RUN pip install Flask gunicorn
CMD exec gunicorn --bind :8080 --workers 1 --threads 4 --timeout 0 main:app
EXPOSE 8080
#CMD python3 main.py
