FROM python:3.6.7-stretch

WORKDIR /usr/src/myapp
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
RUN python3 -m spacy download it
