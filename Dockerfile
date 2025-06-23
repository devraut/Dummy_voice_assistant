FROM python:3.11-slim-buster

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    portaudio19-dev \
    libasound-dev \
    libffi-dev \
    python3-dev \
    gcc \
    espeak \
    && apt-get clean && rm -rf /var/lib/apt/lists/*


# Copy the application code into the container
COPY . /app

# Install Python dependencies
RUN pip install -r requirements.txt

# Expose the port Flask will run on
EXPOSE 5000

# Command to first run main.py
CMD python3 main.py