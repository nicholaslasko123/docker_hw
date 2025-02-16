FROM python:3.9-slim

# Set metadata information
LABEL maintainer="azhou4013@lambda.compute.cmc.edu"

# Update package list and install required system dependencies
RUN apt-get update && \
    apt-get install --no-install-recommends -y build-essential && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all application files
COPY . .

# Set entrypoint and default command
ENTRYPOINT ["python"]
CMD ["app.py"]

