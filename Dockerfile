FROM alpine

RUN apt-get update \
    && apt-get install -y python3-pip python3 libmariadb-dev\
        
COPY . /
RUN pip install -r requirements.txt

EXPOSE 8083
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8083"]
