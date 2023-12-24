# The examples Docker image adds dependencies needed to run the examples
FROM rayproject/ray:latest

# Install ray[data,train,tune,serve]
RUN pip install -U "ray[data,train,tune,serve]"

CMD ["bash", "-c", "ray start --head --num-cpus 1 --dashboard-host 0.0.0.0 --include-dashboard true --block"]