FROM ubuntu

LABEL maintainer="nlaskowski25@students.claremontmckenna.edu"

WORKDIR /app

RUN apt-get update -y && \
    apt-get install -y python3 python3-pip python3-venv

COPY ./requirements.txt /app/requirements.txt

RUN python3 -m venv venv && \
    venv/bin/pip install -r requirements.txt

COPY . /app

ENV PATH="/app/venv/bin:$PATH"

ENTRYPOINT [ "python" ]
CMD [ "app.py" ]

