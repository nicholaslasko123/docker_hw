FROM python:3.9-slim

# information
LABEL maintainer="nlaskowski25@cmc.edu"

#  packages and dependencies
RUN apt-get update && \
    apt-get install --no-install-recommends -y build-essential && \
    rm -rf /var/lib/apt/lists/*

# working directory
WORKDIR /app

# copy  dependencies
COPY requirements.txt .
#install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy  files
COPY . .

ENTRYPOINT ["python"]
CMD ["app.py"]

