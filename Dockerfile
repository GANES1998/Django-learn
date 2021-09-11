FROM python:3.7-alpine

MAINTAINER Ravichandran, Ganeson <ganes01ravi@gmail.com>

ENV PYTHONUNBUFFERED 1

#requirements.txt is the file with all the requirements
COPY ./requirements.txt /requirements.txt
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org -r /requirements.txt

#/app is the directory where the python django code gets deplopyed
RUN mkdir /app
COPY ./app /app
WORKDIR /app

#Let know that the /app is more likely an mounted path ( here it is during development )
VOLUME /app

#Create a user ( username = uesr ) and use it to run to avoid un intended root user access for python program
RUN adduser -D user
USER user



