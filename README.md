<h1 align="center">
    <img src="http://docs.cocorico.io/images/logo_cocorico.png" alt="Cocorico"/>
    <img src="https://www.docker.com/sites/default/files/horizontal.png" alt="Docker"/>
</h1>

# Cocorico-Docker

[![Build Status](https://travis-ci.org/Cocolabs-SAS/cocorico-docker.svg)](https://travis-ci.org/Cocolabs-SAS/cocorico-docker)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

The official Cocorico docker image that give you the ability to run Cocorico out of the box.

## Requirements

- Linux OS
- [Docker](https://docs.docker.com/install/)
- [Docker Documentation](https://docs.docker.com/)

## Usage

Start the container:

``` bash
docker run --name cocorico -ti -p 80:8000 -p 3306:3306 -p 9001:9001 -p 27017:27017  -v `pwd`:/cocorico -v `pwd`/tmp/mysql:/var/lib/mysql -v `pwd`/tmp/mongo:/data/db -e HOST_UID=$UID cocolabs/cocorico
```


Follow the progress of the installation: [http://localhost:9001/logtail/cocorico](http://localhost:9001/logtail/cocorico)

Once the symfony server is running, enjoy Cocorico: [http://localhost](http://localhost)

Connect to the container:

``` bash
docker exec -it --user cocorico cocorico /bin/sh
```


Stop the container:

``` bash
docker kill cocorico && docker rm cocorico
```

## License

Cocorico-Docker is released under the [MIT license](https://github.com/Cocolabs-SAS/cocorico-docker/blob/master/LICENSE).
