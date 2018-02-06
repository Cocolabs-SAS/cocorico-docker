Cocorico-Docker
===============

[![Build Status](https://travis-ci.org/Cocolabs-SAS/cocorico-docker.svg?branch=mono)](https://travis-ci.org/Cocolabs-SAS/cocorico-docker)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

The official Cocorico docker image that give you the ability to run Cocorico out of the box.

Requirements
------------

- Linux OS
- [Docker](https://docs.docker.com/install/)
- [Docker Documentation](https://docs.docker.com/)

Usage
----

Run the container :

``` bash
docker run --name cocorico -ti -p 80:8000 -p 3306:3306 -p 27017:27017 -p 9001:9001  -v `pwd` -v `pwd`/tmp/mysql:/var/lib/mysql -v `pwd`/tmp/mongo:/data/db -e HOST_UID=$UID cocorico
```
Wait a few minutes and enjoy! [htttp://localhost](htttp://localhost)

Connect to the container :

``` bash
docker exec -it --user cocorico cocorico /bin/sh
```

License
-------

Cocorico-Docker is released under the [MIT license](LICENSE).
