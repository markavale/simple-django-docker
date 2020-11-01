# Base Image
FROM python:3.6
# create and set working directory
RUN mkdir /app
WORKDIR /app
# Add current directory code to working directory
ADD . /app/
# set default environment variables
ENV PYTHONUNBUFFERED 1
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive 

# install environment dependencies
RUN pip3 install --upgrade pip 
RUN pip3 install pipenv
COPY Pipfile /app/

# Install project dependencies
RUN pipenv install
COPY . /app/
