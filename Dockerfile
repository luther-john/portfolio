# Use an official Ubuntu base image
FROM ubuntu:latest

# Update package lists and install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Install DFX sh -ci "$(curl -fsSL https://internetcomputer.org/install.sh)"
RUN curl -fsSL https://sdk.dfinity.org/install.sh | sh

# Set DFX binary to PATH
ENV PATH="/root/.local/share/dfinity/bin:${PATH}"

# Define the working directory (optional)
WORKDIR /app

# Command to run (optional, you can override this when running the container)
CMD ["bash"]