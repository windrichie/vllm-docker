# Docker Image for VLLM Inference Server

This repository provides the necessary files to build and deploy a Docker container for serving VLM or LLM using the VLLM inference engine. The container is pre-configured to use the **Qwen2.5-VL-7B-Instruct** model by default but can be customized to use other models.

## Files in This Repository

- **Dockerfile**: Defines the container environment, installs dependencies, and sets up the VLLM server.
- **start.sh**: Configures and starts the VLLM inference server with optimized parameters.
- **requirements.txt**: Specifies Python dependencies for the container.