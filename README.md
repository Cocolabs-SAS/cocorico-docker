
[![Cocorico](http://docs.cocorico.io/images/logo_cocorico.png)](https://github.com/Cocolabs-SAS/cocorico)
[![Docker](https://www.docker.com/sites/default/files/horizontal.png)](https://www.docker.com/)

# Cocorico-Docker

[![Docker Stars](https://img.shields.io/docker/stars/cocolabs/cocorico.svg?style=flat-square)](https://hub.docker.com/r/cocolabs/cocorico/)
[![Docker Pulls](https://img.shields.io/docker/pulls/cocolabs/cocorico.svg?style=flat-square)](https://hub.docker.com/r/cocolabs/cocorico/)
[![Docker Automated build](https://img.shields.io/docker/automated/cocolabs/cocorico.svg?style=flat-square)](https://hub.docker.com/r/cocolabs/cocorico/)
[![Docker Build Status](https://img.shields.io/docker/build/cocolabs/cocorico.svg?style=flat-square)](https://hub.docker.com/r/cocolabs/cocorico/)
[![License](https://img.shields.io/github/license/Cocolabs-SAS/cocorico-docker.svg?style=flat-square)](https://github.com/Cocolabs-SAS/cocorico-docker/blob/master/LICENSE)

The official [Cocorico docker image](https://hub.docker.com/r/cocolabs/cocorico/) that give you the ability to run Cocorico out of the box.

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
