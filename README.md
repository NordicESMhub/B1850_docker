# B1850_docker
Docker container for CESM compset B1850 resolution f09_g17


- Input dataset is stored and available in zenodo.

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3526181.svg)](https://doi.org/10.5281/zenodo.3526181)


## Running B1850 with docker

Make sure inputdata is available (it won't download it as we suppose it is already on disk). 
- The location of the inputdata is `/opt/uio/inputdata` 

```
mkdir /opt/uio
wget https://zenodo.org/record/3526181/files/inputdata_B1850.tar.gz
tar zxf inputdata_B1850.tar.gz
mv inputdata_container inputdata
```

- Model outputs are stored in `/opt/uio/archive` along with the `case` folder (it can be interesting to check timing).

```
docker pull quay.io/nordicesmhub/cesm_b1850:latest
docker run -i -v /opt/uio/inputdata:/root/inputdata -v /opt/uio/archive:/root/archive  -t quay.io/nordicesmhub/cesm_b1850:latest
```

### 5 different cases

We have prepared 5 different cases for running the same case but with different number off nodes:

- run_b1850case1: 4 nodes (12 processors per node) 
- run_b1850case2: 8 nodes
- run_b1850case3: 16 nodes
- run_b1850case4: 42 nodes
- run_b1850case5: 84 nodes

