#!/bin/bash
# Define the path to the model files; you can override this by setting the MODEL_PATH environment variable
MODEL_PATH=${MODEL_PATH:-/data01/models/Qwen2.5-VL-7B-Instruct}

echo "Starting VLLM inference server with model at ${MODEL_PATH}..."
# Run the VLLM inference server. Adjust parameters as required.
# --enforce-eager is to disable torch.compile. This avoids torch compilation step which will take some time. Note that this will reduce the function startup time, but may lead to lower inference throughput
# --disable-custom-all-reduce is to skip custom communication operations that aren't needed for single-GPU deployments
vllm serve ${MODEL_PATH} --host 0.0.0.0 --port 8000 \
  --gpu-memory-utilization 0.9 \
  --max-num-batched-tokens 1024 \
  --enforce-eager \
  --disable-custom-all-reduce