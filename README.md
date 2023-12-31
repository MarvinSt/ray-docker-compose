# Ray + Dask Cluster Introduction
Local development environment for exploring [Ray](https://www.ray.io/) v [Dask](https://www.dask.org/).

## Ray
### Get Started
A docker compose file was created to configure the cluster for us. You can start it as follows:
```
docker-compose -f ray-docker-compose.yaml up
```
Or optionally run in detatched mode by adding -d.

The dashboard should now be accessible here: http://localhost:8265

Once you are done, tear down the cluster with
```
docker-compose -f ray-docker-compose.yaml down
```

## Ports
The following ports are exposed by default:
* ```8265```    Ray dashboard
* ```6379```    Reddis port to allow external workers to join (optional)
* ```10001```   Head node access port to connect external Ray client (optional)

# Connect to Cluster
The following is a minimum working example to connect to the cluster head node **
```
import ray
ray.init(address='ray://<head_node_ip_address>:10001')
```

For more information on Ray:
* https://www.ray.io/
* https://github.com/ray-project/ray



## Dask
### Get Started
A docker compose file was created to configure the cluster for us. You can start it as follows:
```
docker-compose -f dask-docker-compose.yaml up
```
Or optionally run in detatched mode by adding -d.

The notebook dashboard should now be accessible here: http://localhost:8888

Once you are done, tear down the cluster with
```
docker-compose -f dask-docker-compose.yaml down
```