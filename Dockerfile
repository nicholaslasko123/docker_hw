FROM ubuntu

LABEL maintainer="nlaskowski25@students.claremontmckenna.edu"

RUN apt-get update -y && \
    apt-get install -y python3 python3-pip python3-venv

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN python3 -m venv venv
RUN venv/bin/pip install -r requirements.txt

COPY . /app

ENV PATH="/app/venv/bin:$PATH"

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
