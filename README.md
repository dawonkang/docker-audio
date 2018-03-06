# docker-audio
Recognizing Audio with Anaconda2-5.1.0-Linux-x86_64

docker run --name docker-audio -p 8888:8888 -v "$PWD/notebooks:/opt/notebooks" -v "$PWD/models:/root/models" -d risinsun/docker-audio-auto

# into the container
docker exec -it docker-audio /bin/bash

# for test
docker run --rm -it risinsun/docker-audio-auto /bin/bash
