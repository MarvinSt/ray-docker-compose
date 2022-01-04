FROM python:3.9.7-slim

RUN pip install --no-cache-dir -U 'ray[default] @ https://s3-us-west-2.amazonaws.com/ray-wheels/latest/ray-2.0.0.dev0-cp39-cp39-manylinux2014_x86_64.whl'

CMD ["bash", "-c", "ray start --head --num-cpus 1 --dashboard-host 0.0.0.0 --include-dashboard true --block"]
