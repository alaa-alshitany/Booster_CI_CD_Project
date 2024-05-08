FROM ubuntu:20.04

RUN apt-get update 
RUN apt-get install -y python3.6 python3-pip 
RUN  apt-get clean 
RUN  rm -rf /var/lib/apt/lists/* 

WORKDIR /simpleApp

COPY requirements.txt .
RUN pip3 install --upgrade pip && pip3 install -r requirements.txt

COPY . .

EXPOSE 8000

RUN python3 manage.py makemigrations && python3 manage.py migrate

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]

