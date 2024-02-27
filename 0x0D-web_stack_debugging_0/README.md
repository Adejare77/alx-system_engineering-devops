# Docker

Introduction to the use of Docker container.
In this project, I learned to use basic Docker commands for Web Stack Debugging.

## Install Docker on Ubuntu Terminal

 `sudo apt-get install docker`


### Basic Docker Command

1. To run container or pull container and run it, use:
docker run -d -ti <name_of_the_container>
e.g docker run -d -ti ubuntu:latest
2. To stop a container, use
docker stop [<container id>]/[<names>]
e.g docker stop fc5a9ab6b9ae
3. To execute command inside downloaded image/container:
docker exec -ti [<container id>]/[<names>] <command>
e.g docker exec -ti fc5a9ab6b9ae hostname   # to execute the container's hostname
e.g docker exec -ti fc5a9ab6b9ae /bin/bash  # to execute bash commands
4. To rename a docker, first get the docker name by using `docker ps`, then:
docker rename <current_name> <new_name>
e.g docker rename <vigilant_tesla> <my_bash>
5. To remove an image:
docker rm [<contianer id>]/[<names>]
6. To see available docker's commands, use `docker --help`
7. For available flags of a docker's command, use:
docker <command> --help
e.g docker exec --help

For more information on docker's usage, visit their official website on: [https://www.docker.com/](dockert.com)
