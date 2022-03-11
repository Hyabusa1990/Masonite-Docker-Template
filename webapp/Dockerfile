# pull official base image
FROM python:3-buster

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV TZ=UTC

# install system dependencies
RUN apt update -y && apt dist-upgrade -y && \
    apt install -y python3-dev python3-pip \ 
    libssl-dev build-essential python3-venv netcat-traditional

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy project
COPY . .

# run entrypoint.sh
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]