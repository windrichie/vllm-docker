FROM pytorch/pytorch:2.1.2-cuda12.1-cudnn8-runtime

WORKDIR /app

# Install build essentials for compilation
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install vLLM
COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt --no-cache-dir

# Copy the entrypoint script and make it executable
COPY start.sh ./start.sh
RUN chmod +x ./start.sh

# Expose the port typically used for inference
EXPOSE 8000

# Set the entrypoint to start the inference server
ENTRYPOINT ["./start.sh"]