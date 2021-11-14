# Ray Cluster Introduction
A simple example to create a Ray cluster using a custom docker image and a docker compose to configure the (local) cluster.

For more information on Ray:
* https://www.ray.io/
* https://github.com/ray-project/ray

# Build Container
Run the following command in this folder to build the ray container:
```
docker build -t raytest .
```

# Configure Cluster
## Docker compose
A docker compose file was created to configure the cluster for us. You can start it as follows:
```
docker-compose up
```
Or optionally run in detatched mode by adding -d.

The dashboard should now be accessible here: http://localhost:8265

Once you are done, tear down the cluster with
```
docker-compose down
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
** This may require prequisites on your local PC matching those of the cluster.

For example, when running the docker-compose from above, this is running on ```localhost:10001``` by default.

A slightly more advanced example, executing some work on the workers and listing the IPs:
```
from collections import Counter
import socket
import time

import ray

ray.init(address='ray://localhost:10001')

print('''This cluster consists of
    {} nodes in total
    {} CPU resources in total
'''.format(len(ray.nodes()), ray.cluster_resources()['CPU']))

@ray.remote
def f():
    time.sleep(0.001)
    # Return IP address.
    return socket.gethostbyname(socket.gethostname())

object_ids = [f.remote() for _ in range(10000)]
ip_addresses = ray.get(object_ids)

print('Tasks executed')
for ip_address, num_tasks in Counter(ip_addresses).items():
    print('    {} tasks on {}'.format(num_tasks, ip_address))
```

or simply run the included script ```python ray_test.py```.