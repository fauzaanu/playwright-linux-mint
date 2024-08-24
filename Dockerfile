# Use the Linux Mint base image
FROM linuxmintd/mint22-amd64:latest

# Set maintainer label
LABEL authors="fauzaanu"

# Install essential dependencies including Playwright's system requirements
RUN sudo apt update && \
    sudo apt install -y \
        libx264-dev \
        libicu-dev \
        python3-pip \
        python3-venv \
        wget \
        gnupg \
        curl \
        && sudo rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Ensure Poetry is in the PATH
ENV PATH="/root/.local/bin:${PATH}"

# Set the working directory in the container
WORKDIR /usr/src/app

# Create a directory for screenshots
RUN mkdir -p docker-store

# Copy the poetry configuration files into the container
COPY pyproject.toml poetry.lock ./

# Install Python dependencies via Poetry
RUN poetry install

# Copy the main.py script into the container
COPY main.py .

# Set the working directory to where the screenshot will be saved
WORKDIR /usr/src/app/docker-store

# Run the Python script
CMD ["poetry", "run", "python", "/usr/src/app/main.py"]
