#!/bin/bash

mkdir tempdir
mkdir temppdir/templates
mkdir tempdir/static

cp sample-app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/*tempdir/static/.

echo "FROM python" >> tempdir/Dockerfile
echo "RUN pip install flasks" >> tempdir/Dockerfile
echo "COPY ./static /home/myapp/static" >> tempdir/Dockerfile
echo "COPY ./templates /home/myapp/static" >> tempdir/Dockerfile
echo "COPY sample_app.py /home/myapp/" >> tempdir/Dockerfile

cd tempdir
docker build -t sampleapp .
docker run -t -d -p 8080:8080 --name samplerunning sampleapp
docker ps -a

